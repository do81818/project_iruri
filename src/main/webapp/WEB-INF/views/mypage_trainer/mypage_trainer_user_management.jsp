<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />

<!DOCTYPE>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<title>이루리 트레이너 마이페이지-회원관리</title>
<!-- 페이지 이름을 적어주세요 -->
<script src=""></script>
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
<script type="text/javascript">
		$(document).ready(function(){
			management(1);
		});
		
		function management(page){
			$.ajax({
				url : 'http://localhost:8282/ex/ajax/mypage/userManagement.json',
				type : 'GET',
				cache : false,
				dataType : 'json',
				data:{
					pageNum : page,
				},
				success : function(result){
					var list = result['list'];
				console.log(list);
				var pagination = result['pageMaker'];
				
				var htmls = '';
				var htmls2 = '';

				if(list.length < 1) {
					htmls += '<table class="management_table">';
					htmls += '<tr>';
					htmls += '<td colspan="3" class="pt_title">';
					htmls += '개설된 클래스가 없습니다.';
					htmls += '</td>';
					htmls += '</tr>'; 
					htmls += '</table>';
					
				} else {
					$(list).each(function() {
						// 테이블 시작
						htmls += '<table class="management_table">';
						console.log()
						// 클래스 상태/제목/인원수	
						htmls += '<tr>'
							+ '<a href="/ex/iruri/ptClassDetails?classId='+this.classId+'"><td class="pt_title">'
							+ '<span class="title_icon-red">'
							+ this.classState
							+ '</span>&nbsp;'

							+ '<a href="/ex/iruri/ptClassDetails?classId='+this.classId+'">'+this.classTitle+'</a>'
							+ '&nbsp;(총<span>'
							+ this.classJoinMember
							+ '</span>명)'
							+ '</td></tr>';
						

						// 유저 코멘트
						htmls += '<tr>';


							// 유저 리스트
						htmls += '<td class="pt_usersInfo_'
							+ this.classId
							+ '">유저리스트 자리</td>';
							userlist(this.classId, page);
							
							// 리스트 화살표
						htmls += '<td class="arrow_box">'
							// + '<button href="" class="a_arrow_up"></button>'
							// + '<button href="" class="a_arrow_down"></button>'
							+ '</td>';


						/*--------------------------- 코멘트 입력 부분------------------------*/
						htmls += '<td class="td_box2">'
									+ '<form class="pt_reply_insertBox">'
										+ '<table>'
										+ '<tr>'
										+ '<td class="reply_textarea">'
										+ '<textarea id="insert_'
										+ this.classId
										+ '" placeholder="회원의 닉네임을 선택 후 작성하세요"></textarea>'
										+ '</td>'
										+ '<td class="reply_insertButton">'
										+ '<button type="button">입력</button>'
										+ '</td>'
										+ '</tr>'
										+ '</table>'
									+ '</form>';			
						/*--------------------------- 코멘트 리스트 부분------------------------*/
							htmls += '<table class="reply_table">'
									+ '<tr>'
									+ '<td class="pt_reply_box" id="classId_'
									+ this.classId
									+ '">'
									+ '<p class="pt_reply_date">회원을 선택하세요.</p>'
									+ '</td>'
									+ '</tr>'

									+ '</td>'
									+ '</tr>'
								+ '</table>';
								
						
						htmls += '</td></tr></table>';
					})

					/*--------------------------- 페이징 부분------------------------*/
					if (pagination['prev']) {
						htmls2 += '<a class="arrow prev" href="javascript:management('+ (pagination['startPage']-1) +')"></a>';
					} 
					// 번호를 표시하는 부분
					for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
						if (page !== idx) {
							htmls2 += '<a class="pageNumLink" href="javascript:management('+ idx + ')">' + (idx) + "</a>";
						} else {
							htmls2 += '<a class="pageNumLink active" href="javascript:management('+ idx + ')">' + (idx) + "</a>";
						}
					}
					
					if (pagination['next']) {
						htmls2 += '<a class="arrow next" href="javascript:management('+ (pagination['endPage']+1) +')"></a>';
						
					}
				
				}

				$(".pt_user_management").html(htmls);
				$(".page_nation").html(htmls2);
				
				}
			})
		}


	function userlist(classId, page) {
		$.ajax({
			url : 'http://localhost:8282/ex/ajax/mypage/userManagement.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				pageNum : page,
			},
			success : function(result){
				var userInfo = result['userInfo'];
				console.log(userInfo);
				var pagination = result['pageMaker'];
				
				var htmls = '';

				var index = -1;
				
				for(var i = 0; i <userInfo.length; i++) {
						htmls += '<ul>';
							if(userInfo[i].iclassVo.classId == classId) {
						index = i;
						htmls += '<li><a href="javascript:commentLink('+ userInfo[i].iuserVo.userId + ',' + classId +')">'; 
						console.log("userId: " + userInfo[i].iuserVo.userId +',' +"classId: " +classId);
						htmls += '<span class="pt_nickname_table">'+userInfo[i].iuserVo.userNickname +'</span>&nbsp;';
						htmls += '<span class="pt_nickname_phone">'+userInfo[i].iuserVo.userPhone+'</span>';
						htmls += '</a></li>';
						htmls += '</ul>';
					}
				}
				
				if(index < 0) {
					htmls += '<ul>';
					htmls += '<li>';
					htmls += '<span class="pt_nickname_table">구매한 회원이 없습니다.</span>';
					htmls += '</li>';
					htmls += '</ul>';
				}

				let replyTableid = ".pt_usersInfo_" + classId;
				$(replyTableid).html(htmls);
			}

		})
	}
	
	function commentLink(userId,classId) {
	    console.log('umanagementComment');
		$.ajax({
			url : 'http://localhost:8282/ex/ajax/mypage/userManagement/comment.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				userIdInput : userId,
				classId: classId,
			},
			success : function(result){
			    var commentList = result['commentList'];
				console.log(commentList);

				var htmls = '';
				var htmls2 = '';
			    
				
				
				htmls2 += '<button type="button" onclick="javascript:insertUserComment('+ userId + ',' + classId +')">입력</button>';
				
				
				
				if(commentList.length < 1) {
				    console.log("코멘트 리스트 없음!");
				    htmls += '<p class="pt_reply_content">작성된 코멘트가 없습니다.</p>';
					
				} else {
				    console.log("코멘트 리스트!");
					$(commentList).each(function() {
					    htmls += '<p class="pt_reply_date">'
						      + this.commentDate
						      + '</p>';
						htmls += '<p class="pt_reply_content">'
						      + this.commentContent
						      + '</p>';
					    
					})
				}
				
				let replyTableid = "#classId_" + classId;
				$(replyTableid).html(htmls);
				$('.reply_insertButton').html(htmls2);
			}
		})
	}

	function insertUserComment(userId
	    
	   /*  htmls += '<input type="hidden" name="classId_'+ classId +'_'+ userInfo[i].iuserVo.userId + '" value="'+ classId + '">';
		htmls += '<input type="hidden" name="userId_'+ classId +'_'+ userInfo[i].iuserVo.userId + '" value="'+ userInfo[i].iuserVo.userId + '">'; */
	   /*  
	    var userId = $('input[name=userId_'+ classId +'_'+ userId + ']').val();
		var classId = $('input[name=classId_'+ classId +'_'+ userId + ']').val(); */, classId) {
	    
	   /*  htmls += '<input type="hidden" name="classId_'+ classId +'_'+ userInfo[i].iuserVo.userId + '" value="'+ classId + '">';
		htmls += '<input type="hidden" name="userId_'+ classId +'_'+ userInfo[i].iuserVo.userId + '" value="'+ userInfo[i].iuserVo.userId + '">'; */
	   /*  
	    var userId = $('input[name=userId_'+ classId +'_'+ userId + ']').val();
		var classId = $('input[name=classId_'+ classId +'_'+ userId + ']').val(); */
		let commentId = '#insert_' + classId;
		console.log('commentId: '+commentId);
		var commentContent = $(commentId).val();
		/* var commentContent =  */

		
		console.log("클래스:"+classId);
		console.log("유저:"+userId);
		console.log("코멘트:"+commentContent);
		
		console.log('insertComment');
		
		$.ajax({
					url : 'http://localhost:8282/ex/insertComment.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				userId : userId,
				classId: classId,
				commentContent: commentContent,
			},
			success : function(result){
				console.log("성공!");
				$(commentId).val('');
				commentLink(userId,classId);
			}
		
	    });
	}

	</script>


</head>
<body>
<!-- 콘텐츠 -->
<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

		<main>
			<!-- 콘텐츠를 넣어주세요 -->
			<div class="container content">
			
			
	<!-- 마이페이지 기본 탭 -->
				<div class="imformation_box">
					<div id="user_info">
						<div class="nickname">
							<!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button" onclick=""​>클래스
								개설</button>
						</div>
						<div class="user_detail">
							<c:if test="${user.authList[0].authContent eq 'ROLE_TRAINER'}">
								<div>나는 이루리의 자랑스러운 <span class = "mypagetrainer_bold">트레이너!</span></div>
							</c:if>
							<div>${user.userEmail}</div>

						</div>
					</div>

					<div id="challenge">
						운영중인 클래스
						<div class="count">${countMypageTrainerClass}</div>
					</div>

					<div id="buy">
						수익금
						<div class="count">
							${trainerProfitMan}
							<div class="buy_text">만원</div>
						</div>
					</div>
				</div>

				<!-- 관리메뉴 -->
				<div class="class_MenuBar">
					<ul>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer">클래스관리</a></li>
						<li class="class_MenuBar_text_now"><a href="/ex/mypage/trainer/userManagement">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/classReply">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/profit">수익관리</a></li>
					</ul>
				</div>


	<!-- 회원관리 -->
	<div class="pt_user_management"></div>

	<div class="page_nation">
	</div>

	
</div>


		</main>

		<%@ include file="../include/footerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

	</div>



</body>
</html>
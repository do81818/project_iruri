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
<!DOCTYPE html>
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
				// 트레이너의 클래스 정보
				var list = result['list'];
				console.log(list);
				
				// 클래스의 유저정보
				var userInfo = result['userInfo'];
				console.log(userInfo);
				
				var pagination = result['pageMaker'];
				
				var htmls = '';
				var htmls2 = '';
				
					
				if(list.length < 1) {
					htmls += '<div class="pt_user_management">';
					htmls += '<table class="management_table">';
					htmls += '<tr>';
					htmls += '<td colspan="3" class="pt_title">';
					htmls += '개설된 클래스가 없습니다.';
					htmls += '</td>';
					htmls += '</tr>'; 
					htmls += '</table>';
					htmls += '</div>';
					
				} else {
					/* htmls += '리스트 출력'; */
					// 트레이너의 클래스 정보
				
				$(list).each(function() {
					
					htmls += '<div class="pt_user_management">';
					htmls += '<table class="management_table">';
					htmls += '<tr>';
					htmls += '<td colspan="3" class="pt_title">';
					htmls += '<span class="title_icon-red">'
					      + this.classState
					      + '</span>&nbsp;'
					      + this.classId
					      + this.classTitle
					      + '&nbsp;(총<span>'
					      + this.classJoinMember
					      + '</span>명)';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '<tr>';
					htmls += '<td>';
					
					var index = -1;
					for(var i = 0; i <userInfo.length; i++) {
						if(userInfo[i].iclassVo.classId == this.classId) {
							index = i;
							htmls += '<ul>';
							htmls += '<li onclick="commentLink('+ userInfo[i].iuserVo.userId + ',' + this.classId +')">'; 
							console.log(userInfo[i].iuserVo.userId, this.classId);
							htmls += '<span class="pt_nickname_table">'+userInfo[i].iuserVo.userNickname +'</span>&nbsp;';
							htmls += '<span class="pt_nickname_phone">'+userInfo[i].iuserVo.userPhone+'</span>';
							htmls += '</li>';
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
					
					htmls += '</td>';
					htmls += '<td class="arrow_box">';
					/* htmls += '<button href="" class="a_arrow_up"></button>';
					htmls += '<button href="" class="a_arrow_down"></button>'; */
					htmls += '</td>';
					/* 코멘트입력 칸 */
					htmls += '<td class="td_box2">';
					htmls += '<form class="reply_insertBox" action="">';
					htmls += '<table>';
					htmls += ' <tr>';
					htmls += '<td class="reply_textarea">';
					htmls += '<textarea placeholder="회원의 닉네임을 선택 후 작성하세요"></textarea>';
					htmls += '</td>';
					htmls += '<td class="reply_insertButton">';
					htmls += '<button>입력</button>';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					htmls += '</form>';
					
					/* ----------------------------- 코멘트 리스트 부분 --------------------------- */
					htmls += '<table class="reply_table" id="classId_'
						+ this.classId
						+ '">';
					htmls += '<tr>';
					htmls += '<td class="pt_reply_box">';
					htmls += '<p class="pt_reply_date">회원을 선택하세요.</p>';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					
					/* ----------------------------------------------------------------------- */
					
					
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					htmls += '</div>';

														
				});
				 
				 /* 페이징처리 */
				 
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

						
							$(".management_list").html(htmls);
							$(".page_nation").html(htmls2);
							
					} 
				
			}
		});
	}
</script>

<script>

$(document).ready(function(){

commentLink = function(userId,classId) {
/* 	alert(userId,classId); */
	console.log('commentLink');
	managementComment(userId,classId);
	
}

function managementComment(userId,classId) {
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
			// 트레이너의 클래스 정보
			var commentList = result['commentList'];
			console.log(commentList);

			var htmls3 = '';
			
			if(commentList.length < 1) {
				htmls3 += '<tr>';
				htmls3 += '<td class="pt_reply_box">';
				htmls3 += '<p class="pt_reply_content">작성된 코멘트가 없습니다.</p>';
				htmls3 += '</td>';
				htmls3 += '</tr>';
				
			} else {
				$(commentList).each(function() {
					
					htmls3 += '<tr>';
					htmls3 += '<td class="pt_reply_box">';
					htmls3 += '<p class="pt_reply_date">'
					      + this.commentDate
					      + '</p>';
					htmls3 += '<p class="pt_reply_content">'
					      + this.commentContent
					      + '</p>';
					htmls3 += '</td>';
					htmls3 += '</tr>';
					
					
				});
			}
			
			var replyTableid = "#classId_" + classId;
			$(replyTableid).html(htmls3);			
		}
	});
}
})
</script>
</head>

<body>
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
								<div>트레이너입니다</div>
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
						<li class="class_MenuBar_text"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text_now"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="#">수익관리</a></li>
						<li class="class_MenuBar_text"><a href="#">프로필관리</a></li>
					</ul>
				</div>

				<div class="management_list"></div>
				<div class="page_nation"></div>


			</div>


		</main>

		<%@ include file="../include/footerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp" %> 
    <title>트레이너 마이페이지 클래스 조회</title> <!-- 페이지 이름을 적어주세요 -->
    <link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
	    <link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/page/mypage_trainaer.css">
	<script type="text/javascript">
		$(document).ready(function(){
			profit(1);
		});
		
		function profit(page){
			$.ajax({
				url : 'http://localhost:8282/ex/ajax/mypage/classReply.json',
				type : 'GET',
				cache : false,
				dataType : 'json',
				data:{
					pageNum: page,
				},
				success : function(result){
					var ReplyList = result['ReplyList'];
					console.log(ReplyList);
					var pagination = result['pageMaker'];
					var htmls = ''; 
					var htmls2 = '';
					
					if(ReplyList.length < 1) {
						htmls = '현재 트레이너님의 클레스에 작성된 댓글이 없습니다';
					} else {
					
					$(ReplyList).each(function() {
						htmls +='<div class="content_list">';
						htmls +='<div class="class_title_and_ing">';
						htmls +='<div class="ing_red">';
						htmls += this.iclassList[0].classState; 
						htmls +='</div>';
						htmls +='<a href="/ex/iruri/ptClassDetails?classId='+ this.iclassList[0].classId +'"><div class="class_title">';
						htmls +=this.iclassList[0].classTitle; 
						htmls +='</div></a>';
						htmls +='</div>';

						htmls +='<div class="class_nickname_and_day">';
		                htmls +='<div class="class_nickname">';
		                htmls +=this.iuserVO.userNickname; 
		                htmls +='</div>';
		                htmls +='<div class="and_class">';
		                htmls +='|';
		                htmls +='</div>';
		                htmls +='<div class="write_day">';
		                htmls +=this.boardDate; 
		                htmls +='</div>';
		                htmls +='</div>';

		                htmls +='<div class="content_text">';
		                htmls +=this.boardContent;
		                htmls +='</div>';
		               	htmls +='</div>';

				});
					if (pagination['prev']) {
						htmls2 += '<a class="arrow prev" href="javascript:profit('+ (pagination['startPage']-1) +')"></a>';
					} 
					// 번호를 표시하는 부분
					for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
						if (page !== idx) {
							htmls2 += '<a class="pageNumLink" href="javascript:profit('+ idx + ')">' + (idx) + "</a>";
						} else {
							htmls2 += '<a class="pageNumLink active" href="javascript:profit('+ idx + ')">' + (idx) + "</a>";
						}
					}
					
					if (pagination['next']) {
						htmls2 += '<a class="arrow next" href="javascript:profit('+ (pagination['endPage']+1) +')"></a>';
						
					}
						$(".pt_class_reply_list").html(htmls);
						$(".page_nation").html(htmls2);
					}
				}
			});

		};
		
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
						<div class="nickname"> <!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button" onclick="location.href='/ex/iruri/ptClassMakeForm'">클래스
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
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/userManagement">회원관리</a></li>
						<li class="class_MenuBar_text_now"><a href="/ex/mypage/trainer/classReply">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/profit">수익관리</a></li>
					</ul>
				</div>

				<!-- 클래스 댓글조회 -->
            	<div class="pt_class_reply_list"></div>

                <div class="page_nation"></div>


		</div>
	</main>
      
    <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
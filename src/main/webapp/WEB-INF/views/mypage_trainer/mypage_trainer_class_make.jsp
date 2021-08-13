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
    <%@ include file="../include/static.jsp" %>  <!-- 경로를 확인해 주세요 --><!-- ../include/static.jsp  -->
    <title>클래스 개설</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
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
						<li class="class_MenuBar_text_now"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="#">수익관리</a></li>
						<li class="class_MenuBar_text"><a href="#">프로필관리</a></li>
					</ul>
				</div>
				
				<script>
					$(document).ready(function() {
						$('.classbarUl_blue a').css('color', '#02a3ff');
						
						$('.classbarUl_blue a').on('click', function() {
							$('.classbarUl_blue a').css('color', '#02a3ff');
							$('.classbarUl a').css('color', '#999');
						})
						
						$('.classbarUl a').on('click', function() {
							$('.classbarUl_blue a').css('color', '#999');
							$('.classbarUl a').css('color', '#02a3ff');
						})
					});
				</script>
				<!-- 클래스 메뉴 -->
				<div class="classbar">
					<ul>
						<li class="classbarUl_blue"><a href="javascript:void(0);" onclick="current(1)">운영중인 클래스</a></li>
						<li class="classbarUl"><a href="javascript:void(0);" onclick="end(1)">종료한 클래스</a></li>
					</ul>
				</div>

				<!-- 클래스 목록  -->
				<div class="class_list"></div>
				
				<!--페이징-->
				<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
				<div class="page_nation"></div>
				

			</div>


		</main>
      
    <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>  
    
      
  </body>
</html>
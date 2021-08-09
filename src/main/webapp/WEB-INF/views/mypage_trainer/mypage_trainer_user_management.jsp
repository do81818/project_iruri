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
    <%@ include file="../include/static.jsp" %> <!-- 경로를 확인해 주세요 --><!-- ../include/static.jsp  -->
    <title>이루리 트레이너 마이페이지</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
  	<link rel="stylesheet" href="${RESOURCES_PATH}/src/css/component/paging.css"> 
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
						<div class="count">10</div>
					</div>

					<div id="buy">
						수익금
						<div class="count">
							200
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
				
				<!-- 회원관리 -->
            	<div class="pt_user_management">
                <table class="management_table">
                    <tr>
                        <td colspan="3" class="pt_title">
                            <span class="title_icon-red">진행중</span>
                        스쿼트, 런지, 플랭크 30일 챌린지 (총<span>12</span>명)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                                <li>
                                    <span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>
                            </ul>
                        </td>
                        
                        <td class="arrow_box">
                            <button href="" class="a_arrow_up"></button>
                            <button href="" class="a_arrow_down"></button>
                            
                        </td>
                        
                        <td class="td_box2">
                            <form class="reply_insertBox" action="">
                                <table>
                                    <tr>
                                        <td class="reply_textarea">
                                            <textarea placeholder="회원의 닉네임을 선택 후 작성하세요"></textarea>
                                        </td>
                                        <td class="reply_insertButton">
                                            <button>입력</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>

                            <table class="reply_table">
                                <tr>
                                    <td class="pt_reply_box">
                                        <p class="pt_reply_date">2021.07.03</p>
                                        <p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍 뜨고 기분 좋았어요</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pt_reply_box">
                                        <p class="pt_reply_date">2021.07.03</p>
                                        <p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍 뜨고 기분 좋았어요</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pt_reply_box">
                                        <p class="pt_reply_date">2021.07.03</p>
                                        <p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍 뜨고 기분 좋았어요</p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
				
				
				

			</div>


		</main>
      
    <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>  
    
      
  </body>
</html>
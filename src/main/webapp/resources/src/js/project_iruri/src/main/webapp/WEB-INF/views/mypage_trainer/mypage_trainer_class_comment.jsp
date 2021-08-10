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
    <title>이루리 메인</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- js -->
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
						운영중인 챌린지
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
						<li class="class_MenuBar_text_now"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="#">수익관리</a></li>
						<li class="class_MenuBar_text"><a href="#">프로필관리</a></li>
					</ul>
				</div>

				<!-- 클래스 메뉴 -->
				 <!-- 클래스 댓글조회 -->
            <div class="content_list">
                <div class="class_title_and_ing">
                    <div class="ing_red">
                        진행중
                    </div>
                    <div class="class_title">
                        스쿼트, 런지, 플랭크 30일 챌린지
                    </div>
                </div>

                <div class="class_nickname_and_day">
                    <div class="class_nickname">
                        닉네임
                    </div>
                    <div class="and_class">
                        |
                    </div>
                    <div class="write_day">
                        2021.07.06
                    </div>
                </div>

                <div class="content_text">
                    아침을 시작하기 전에 스트레칭을 같이 해주시고 끝나고서 질문도 친절하게 받아주세요!! 이름도 불러주시면서 해주셔서 잘하고 있는지 확인받을 수도
                    있고, 화상으로 진행되는 데도 자세를 정확하게 짚어주셔서 신기했습니다!!ㅎㅎ 시간대도 딱 좋고 앞으로도 계속 하고 싶네요!
                </div>
            </div>

            <div class="content_list">
                <div class="class_title_and_ing">
                    <div class="ing_red">
                        진행중
                    </div>
                    <div class="class_title">
                        스쿼트, 런지, 플랭크 30일 챌린지
                    </div>
                </div>

                <div class="class_nickname_and_day">
                    <div class="class_nickname">
                        닉네임
                    </div>
                    <div class="and_class">
                        |
                    </div>
                    <div class="write_day">
                        2021.07.06
                    </div>
                </div>

                <div class="content_text">
                    아침을 시작하기 전에 스트레칭을 같이 해주시고 끝나고서 질문도 친절하게 받아주세요!! 이름도 불러주시면서 해주셔서 잘하고 있는지 확인받을 수도
                    있고, 화상으로 진행되는 데도 자세를 정확하게 짚어주셔서 신기했습니다!!ㅎㅎ 시간대도 딱 좋고 앞으로도 계속 하고 싶네요!
                </div>
            </div>

            <div class="content_list">
                <div class="class_title_and_ing">
                    <div class="ing_gray">
                        종료
                    </div>
                    <div class="class_title">
                        스쿼트, 런지, 플랭크 30일 챌린지
                    </div>
                </div>

                <div class="class_nickname_and_day">
                    <div class="class_nickname">
                        닉네임
                    </div>
                    <div class="and_class">
                        |
                    </div>
                    <div class="write_day">
                        2021.07.06
                    </div>
                </div>

                <div class="content_text">
                    아침을 시작하기 전에 스트레칭을 같이 해주시고 끝나고서 질문도 친절하게 받아주세요!! 이름도 불러주시면서 해주셔서 잘하고 있는지 확인받을 수도
                    있고, 화상으로 진행되는 데도 자세를 정확하게 짚어주셔서 신기했습니다!!ㅎㅎ 시간대도 딱 좋고 앞으로도 계속 하고 싶네요!
                </div>
            </div>

				
				
				<!-- 페이징 -->
				<div class="page_nation">
					<a class="arrow prev" href="#"></a> 
					<a href="#" class="active">1</a>
					<a href="#">2</a> 
					<a href="#">3</a> 
					<a href="#">4</a> 
					<a href="#">5</a>
					<a class="arrow next" href="#"></a>
				</div>



			</div>


		</main>
      
    <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
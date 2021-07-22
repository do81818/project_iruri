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
    <title>이루리 메인</title> <!-- 페이지 이름을 적어주세요 -->
    <script src="" defer></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
  </head>
  <body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

<!--         
		// 4.EmpUser 꺼내오기
        EmpUser empUser = (EmpUser) auth.getPrincipal();
        System.out.println(empUser.getEmp());

        empUser = (EmpUser) userDetails;
        System.out.println(empUser.getEmp());
         -->
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
				<div class="classbar">
					<ul>
						<li class="classbarUl_blue"><a href="#">운영중인 클래스</a></li>
						<li class="classbarUl"><a href="#">종료한 클래스</a></li>
					</ul>
				</div>


				<!-- 클래스 목록  -->
				<div class="class_list">
					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="https://via.placeholder.com/360x250" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							${classList[0].classTitle} <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
					</div>

					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="../image/360-250.png" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							스쿼트, 런지, 플랭크 <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
					</div>

					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="../image/360-250.png" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							스쿼트, 런지, 플랭크 <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
					</div>
				</div>

				<div class="class_list">
					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="../image/360-250.png" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							스쿼트, 런지, 플랭크 <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
					</div>

					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="../image/360-250.png" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							스쿼트, 런지, 플랭크 <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
					</div>

					<div class="pt_card">
						<div class="pt_image_and_mark">
							<img src="../image/360-250.png" class="pt_image">
							<div class="pt_mark">1:1</div>
						</div>

						<div class="trainer_name">트레이너이름</div>

						<div class="pt_title">
							스쿼트, 런지, 플랭크 <br> 30일 챌린지
						</div>

						<div class="pt_date">2021.03.01~2021.04.01</div>

						<div class="pt_icon">
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">EASY
							</div>
							<div class="pt_icon-blue">
								<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">50분/월수금
							</div>
						</div>

						<div class="pt_icon">
							<div class="pt_icon-red">댄스</div>
							<div class="pt_icon-red">피트니스</div>
						</div>

						<div class="pt_price">\69000</div>

						<button class="pt_update_button" type="button" onclick=""​>
							수정</button>
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
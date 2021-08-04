<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<title>이루리 PT클래스 - PT클래스 개설</title>
<!-- Air datepicker js -->
<script src="${RESOURCES_PATH}/src/js/challenge/datepicker.js" defer></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script src="${RESOURCES_PATH}/src/js/challenge/datepicker.ko.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_calendar.js" defer></script>
<link href="${RESOURCES_PATH}/src/css/page/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>



	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

		<main>
				<div class="ptClassFormInsert">

					<form:form class="ptForm" method="POST" action="insert_challenge" accept-charset="utf-8">
						<h2 class="ptFormTitle">PT클래스 개설</h2>

						<div>
							<div class="title">클래스명</div>
							<input type="text">
						</div>

						<div>
							<div class="title">운동종류</div>

							<div class="exerciseList">
								<input type="checkbox" >
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>헬스</span>
								</label>
								<input type="checkbox">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>필라테스</span>
								</label>
								<input type="checkbox">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>요가</span>
								</label>
								<input type="checkbox">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>바디프로필</span>
								</label>
								<input type="checkbox">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>댄스</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">운동강도</div>
              
							<input type="radio">
							<label for="easy" >easy</label> 
							<input type="radio">
							<label for="normal" >normal</label> 
							<input type="radio">
							<label for="hard" >hard</label>
						</div>

						<div>
							<div class="title">운동기간</div>
							<input type="text">
								&nbsp - &nbsp 
							<input type="text">
						</div>

						<div>
							<div class="title">운동요일</div>
							<input type="radio">
							<label for="" >월</label> 
							<input type="radio">
							<label for="" >화</label> 
							<input type="radio">
							<label for="" >수</label> 
							<input type="radio">
							<label for="" >목</label>
							<input type="radio">
							<label for="" >금</label>
							<input type="radio">
							<label for="" >토</label>
							<input type="radio">
							<label for="" >일</label>
						</div>

						<div>
							<div class="title">운동시간</div>
							<input type="text">
                            <span>&nbsp분&nbsp</span>
						</div>

						<div>
							<div class="title">운동인원</div>
							<input type="radio">
							<label for="" >1 : 1</label>
							<input type="radio">
							<label for="" >1 : 2</label> 
							<input type="radio">
							<label for="" >1 : 4</label> 
							<input type="radio">
							<label for="" >1 : 6</label> 
						</div>

						<div>
							<div class="title">운동시간</div>
							<input type="text">
							<span>&nbsp분&nbsp</span> 
						</div>

						<div>
							<div class="title">목표</div>
							<textarea cols="30" rows="50"></textarea>
						</div>

						<div>
							<div class="title">클래스소개</div>
							<textarea cols="30" rows="50"></textarea>
						</div>

						<div>
							<div class="title">트레이너소개</div>
							<textarea cols="30" rows="50"></textarea>
						</div>

						<div>
							<div class="title">대표이미지 설정</div>
							<div>
								<input type="radio">
								<label for="" >직접 이미지 올리기</label> 
								<input type="file" accept=".jpg, .png" id="upload">
								<label for=""></label> 
								<span style="color: #999;">* 650x500px 크기의 jpg.png</span>
							</div>

							<div>
								<input type="radio">
								<label for="" >기본 이미지 사용</label>
							</div>

							<div class="c_img_list">
								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_1">
									<label for="c_basic_img_1" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_2">
									<label for="c_basic_img_2" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_3">
									<label for="c_basic_img_3" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_4">
									<label for="c_basic_img_4" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_5">
									<label for="c_basic_img_5" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_6">
									<label for="c_basic_img_6" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_7">
									<label for="c_basic_img_7" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>

								<div class="c_img_detail">
									<input type="radio" name="file_img" id="c_basic_img_8">
									<label for="c_basic_img_8" class="img_rd"> 
									<img src="/ex/resources/src/img/icon/123-123.png" alt="">
									</label>
								</div>
							</div>
						</div>



						


						<div class="button">
							<p></p>
							<button class="c_make_button_cancle" type="reset">챌린지등록
								취소</button>
							<button class="c_make_button_submit" type="submit">
							<a href="challengeList">챌린지등록</a></button>
						</div>


					</form:form>

				</div>

		</main>

		<%@ include file="../include/footerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
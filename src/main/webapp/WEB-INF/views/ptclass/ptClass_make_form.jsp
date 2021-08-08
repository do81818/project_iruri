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

		<main>
				<div class="ptClassFormInsert">

					<form:form class="ptForm" method="POST" action="insertPtClass" accept-charset="utf-8">
						<h2 class="ptFormTitle">PT클래스 개설</h2>

						<div>
							<div class="title">클래스명</div>
							<input type="text" name="classTitle">
						</div>

						<div>
							<div class="title">운동종류</div>

							<div class="exerciseList">
								<input type="checkbox" name="exerciseKindList" value="헬스">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>헬스</span>
								</label>
								<input type="checkbox" name="exerciseKindList" value="필라테스">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>필라테스</span>
								</label>
								<input type="checkbox" name="exerciseKindList" value="요가">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>요가</span>
								</label>
								<input type="checkbox" name="exerciseKindList" value="바디프로필">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>바디프로필</span>
								</label>
								<input type="checkbox" name="exerciseKindList" value="댄스">
								<label for="">
									<i class="iruri-check-no-icon"></i>
									<span>댄스</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">준비물</div>
							<input type="text" name="classNeed">
						</div>

						<div>
							<div class="title">운동강도</div>
              
							<div class="exerciseLevel">
								<input type="radio" name="classLevel" value="easy">
								<label for="easy" >
									<i class="iruri-check-no-icon"></i>
									<span>easy</span>
								</label> 
								<input type="radio" name="classLevel" value="normal">
								<label for="normal" >
									<i class="iruri-check-no-icon"></i>
									<span>normal</span>
								</label> 
								<input type="radio" name="classLevel" value="hard">
								<label for="hard" >
									<i class="iruri-check-no-icon"></i>
									<span>hard</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">운동기간</div>

							<div class="exerciseTerm">
								<input type="text" id="sDate" name="classStartDate" required>
								<span>&nbsp - &nbsp</span> 
								<input type="text" id="eDate" name="classEndDate" required>
							</div>
						</div>

						<div>
							<div class="title">운동요일</div>

							<div class="exerciseDate">
								<input type="checkbox" name="exerciseDateList" value="월">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>월</span>
								</label> 
								<input type="checkbox" name="exerciseDateList" value="화">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>화</span>
								</label> 
								<input type="checkbox" name="exerciseDateList" value="수">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>수</span>
								</label> 
								<input type="checkbox" name="exerciseDateList" value="목">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>목</span>
								</label>
								<input type="checkbox" name="exerciseDateList" value="금">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>금</span>
								</label>
								<input type="checkbox" name="exerciseDateList" value="토">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>토</span>
								</label>
								<input type="checkbox" name="exerciseDateList" value="일">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>일</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">운동시간</div>

							<div class="exerciseTime">
								<input type="text" name="classTime">
								<span>&nbsp분&nbsp</span>
							</div>
						</div>

						<div>
							<div class="title">운동인원</div>

							<div class="exercisePerson">
								<input type="radio" name="classTotalMember" value="1">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 1</span>
								</label>
								<input type="radio" name="classTotalMember" value="2">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 2</span>
								</label> 
								<input type="radio" name="classTotalMember" value="4">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 4</span>
								</label> 
								<input type="radio" name="classTotalMember" value="6">
								<label for="" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 6</span>
								</label> 
							</div>
						</div>

						<div>
							<div class="title">가격</div>

							<div class="exercisePrice">
								<input type="text" name="classPrice">
								<span>&nbsp원&nbsp</span> 
							</div>
						</div>

						<div>
							<div class="title">목표</div>
							<textarea name="classGoal"></textarea>
						</div>

						<div>
							<div class="title">클래스소개</div>

							<textarea></textarea>
						</div>

						<div>
							<div class="title">트레이너소개</div>

							<textarea></textarea>
						</div>

						<div class="thumbnail">
							<div class="title">대표이미지 설정</div>

							<div class="thumbnailWrap">
								<div class="ptClassthumbnail">
									<div>
										<input type="radio">
										<label for="" >
											<i class="iruri-check-no-icon"></i>
											<span>직접 이미지 올리기</span>
										</label>
									</div>
	
									<div>
										<input type="file" accept=".jpg, .png" id="upload">
										<label for="" class="file_upload">
											<i class="iruri-fileUpload-icon"></i>
										</label> 
									</div>
									
									<div>
										<span style="color: #999;">* 650x500px 크기의 jpg.png</span>
									</div>
								</div>

								<div class="defaultThumbnail">
									<input type="radio">
									<label for="" >
										<i class="iruri-check-no-icon"></i>
										<span>기본 이미지 사용</span>
									</label>
								</div>

								<div class="c_img_list">
									<div>
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
							</div>
						</div>

						<div class="button">
							<button class="c_make_button_cancle" type="reset">
								챌린지등록 취소
							</button>
							<button class="c_make_button_submit" type="submit">
								챌린지등록
							</button>
						</div>


					</form:form>

				</div>

		</main>

		<%@ include file="../include/footerTemplate.jsp"%>

	</div>
</body>
</html>
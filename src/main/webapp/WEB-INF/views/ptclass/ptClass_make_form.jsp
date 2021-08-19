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

<script src="${RESOURCES_PATH}/src/js/ptClass/makeForm.js" defer></script>
</head>
<body>



	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>

		<main>
				<div class="ptClassFormInsert">

					<form class="ptForm" method="POST" action="/ex/iruri/insertPtClass?${_csrf.parameterName}=${_csrf.token}" accept-charset="utf-8" enctype="multipart/form-data">
						
						<h2 class="ptFormTitle">PT클래스 개설</h2>

						<div>
							<div class="title">클래스명</div>
							<input type="text" name="classTitle" required autocomplete="off">
						</div>

						<div>
							<div class="title">운동종류</div>

							<div class="exerciseList">
								<input id="EList1" type="checkbox" name="exerciseKind" value="헬스" >
								<label for="EList1">
									<i class="iruri-check-no-icon"></i>
									<span>헬스</span>
								</label>
								<input id="EList2" type="checkbox" name="exerciseKind" value="필라테스">
								<label for="EList2">
									<i class="iruri-check-no-icon"></i>
									<span>필라테스</span>
								</label>
								<input id="EList3" type="checkbox" name="exerciseKind" value="요가">
								<label for="EList3">
									<i class="iruri-check-no-icon"></i>
									<span>요가</span>
								</label>
								<input id="EList4" type="checkbox" name="exerciseKind" value="바디프로필">
								<label for="EList4">
									<i class="iruri-check-no-icon"></i>
									<span>바디프로필</span>
								</label>
								<input id="EList5" type="checkbox" name="exerciseKind" value="댄스">
								<label for="EList5">
									<i class="iruri-check-no-icon"></i>
									<span>댄스</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">준비물</div>
							<input type="text" name="classNeed" required autocomplete="off">
						</div>

						<div>
							<div class="title">운동강도</div>
              
							<div class="exerciseLevel">
								<input id="ELevel1" type="radio" name="classLevel" value="easy">
								<label for="ELevel1" >
									<i class="iruri-check-no-icon"></i>
									<span>easy</span>
								</label> 
								<input id="ELevel2" type="radio" name="classLevel" value="normal">
								<label for="ELevel2" >
									<i class="iruri-check-no-icon"></i>
									<span>normal</span>
								</label> 
								<input id="ELevel3" type="radio" name="classLevel" value="hard">
								<label for="ELevel3" >
									<i class="iruri-check-no-icon"></i>
									<span>hard</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">운동기간</div>

							<div class="exerciseTerm">
								<input type="text" id="sDate" name="classStartDate" required autocomplete="off">
								<span>&nbsp - &nbsp</span> 
								<input type="text" id="eDate" name="classEndDate" required autocomplete="off">
							</div>
						</div>

						<div>
							<div class="title">운동요일</div>

							<div class="exerciseDate">
								<input id="EDate1" type="checkbox" name="exerciseDate" value="월">
								<label for="EDate1" >
									<i class="iruri-check-no-icon"></i>
									<span>월</span>
								</label> 
								<input id="EDate2" type="checkbox" name="exerciseDate" value="화">
								<label for="EDate2" >
									<i class="iruri-check-no-icon"></i>
									<span>화</span>
								</label> 
								<input id="EDate3" type="checkbox" name="exerciseDate" value="수">
								<label for="EDate3" >
									<i class="iruri-check-no-icon"></i>
									<span>수</span>
								</label> 
								<input id="EDate4" type="checkbox" name="exerciseDate" value="목">
								<label for="EDate4" >
									<i class="iruri-check-no-icon"></i>
									<span>목</span>
								</label>
								<input id="EDate5" type="checkbox" name="exerciseDate" value="금">
								<label for="EDate5" >
									<i class="iruri-check-no-icon"></i>
									<span>금</span>
								</label>
								<input id="EDate6" type="checkbox" name="exerciseDate" value="토">
								<label for="EDate6" >
									<i class="iruri-check-no-icon"></i>
									<span>토</span>
								</label>
								<input id="EDate7" type="checkbox" name="exerciseDate" value="일">
								<label for="EDate7" >
									<i class="iruri-check-no-icon"></i>
									<span>일</span>
								</label>
							</div>
						</div>

						<div>
							<div class="title">운동시간</div>

							<div class="exerciseTime">
								<input type="text" name="classTime" required autocomplete="off">
								<span>&nbsp분&nbsp</span>
							</div>
						</div>

						<div>
							<div class="title">운동인원</div>

							<div class="exercisePerson">
								<input id="EPerson1" type="radio" name="classTotalMember" value="1">
								<label for="EPerson1" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 1</span>
								</label>
								<input id="EPerson2" type="radio" name="classTotalMember" value="2">
								<label for="EPerson2" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 2</span>
								</label> 
								<input id="EPerson3" type="radio" name="classTotalMember" value="4">
								<label for="EPerson3" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 4</span>
								</label> 
								<input id="EPerson4" type="radio" name="classTotalMember" value="6">
								<label for="EPerson4" >
									<i class="iruri-check-no-icon"></i>
									<span>1 : 6</span>
								</label> 
							</div>
						</div>

						<div>
							<div class="title">가격</div>

							<div class="exercisePrice">
								<input type="text" name="classPrice" required autocomplete="off">
								<span>&nbsp원&nbsp</span> 
							</div>
						</div>

						<div>
							<div class="title">목표</div>
							<textarea name="classGoal" required></textarea>
						</div>

						<div>
							<div class="title">클래스소개</div>

							<textarea name="classContent" required></textarea>
						</div>

						<div>
							<div class="title">트레이너소개</div>

							<textarea name="classTrainerInfo" required></textarea>
						</div>

						<div class="thumbnail">
							<div class="title">대표이미지 설정</div>

							<div class="thumbnailWrap">
								<div class="ptClassthumbnail">
									<div>
										<input id="mainImg" type="radio" name="imageCheck" value="customImage">
										<label for="mainImg" >
											<i class="iruri-check-no-icon"></i>
											<span>직접 이미지 올리기</span>
										</label>
									</div>
	
									<div>
										<input type="file" name="uploadFile" accept=".jpg, .png" id="upload">
										<label for="upload" class="file_upload">
											<i class="iruri-fileUpload-icon"></i>
										</label> 
									</div>
									
									<div>
										<span style="color: #999;">* 5MB 크기 이하의 jpg.png</span>
									</div>
								</div>

								<div class="defaultThumbnail">
									<input id="defaultImg" type="radio" name="imageCheck" value="defaultImage" checked>
									<label for="defaultImg" >
										<i class="iruri-check-yes-icon"></i>
										<span>기본 이미지 사용</span>
									</label>
								</div>

							</div>
						</div>

						<div class="button">
							<button class="c_make_button_cancle" type="reset">
								클래스 등록 취소
							</button>
							<button class="c_make_button_submit" type="submit">
								클래스등록
							</button>
						</div>


					</form>

				</div>

		</main>

		<%@ include file="../include/footerTemplate.jsp"%>

	</div>

</body>
</html>
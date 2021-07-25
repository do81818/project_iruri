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
<%@ include file="../include/static.jsp"%><!-- 경로를 확인해 주세요 -->
<title>챌린지 개설 폼</title>
<!-- 페이지 이름을 적어주세요 -->

<script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); 


	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

		<main>
			<div class="c_container">
				<div class="c_makeForm_insert">


					<form:form class="c_makeForm" method="POST"
						action="insert_challenge">
						<!--accept-charset="utf-8" name="c_make_form" method="GET"-->
						<h2 class="c_makeForm_title">챌린지 개설</h2>

						<div class="c_name">
						
							<p>챌린지명</p>
							<input type="text" class="inputbox_size1" name="classTitle">

						</div>


						<!--    <div class="c_kind">
                    <p>운동종류</p>
                    <input type="checkbox" id="cb1" name="exerciseKind[]" value="헬스"><label for="cb1" class="cb_label">헬스</label>
                    <input type="checkbox" id="cb2" name="exerciseKind[]" value="필라테스"><label for="cb2" class="cb_label">필라테스</label>
                    <input type="checkbox" id="cb3" name="exerciseKind[]" value="요가"><label for="cb3" class="cb_label">요가</label>
                    <input type="checkbox" id="cb4" name="exerciseKind[]" value="바디프로필"><label for="cb4" class="cb_label">바디프로필</label>
                    <input type="checkbox" id="cb5" name="exerciseKind[]" value="댄스"><label for="cb5" class="cb_label">댄스</label>
                </div> -->


						<div class="c_strength">
							<p>운동강도</p>
							<input type="radio" name="classLevel" id="easy" value="easy"><label
								for="easy" class="rd_label">easy</label> <input type="radio"
								name="classLevel" id="normal" value="normal"><label
								for="normal" class="rd_label">normal</label> <input type="radio"
								name="classLevel" id="hard" value="hard"><label
								for="hard" class="rd_label">hard</label>
						</div>


						<div class="c_period">
							<p>운동기간</p>
							<input type="date" name="classStartDate"> &nbsp - &nbsp <input
								type="date" name="classEndDate"> <br>
						</div>

						<div class="c_exNum">
							<p></p>
							<input type="radio" name="classExerciseCount" id="all" value="7"><label
								for="all" class="rd_label">매일</label> <input type="radio"
								name="classExerciseCount" id="5days" value="5"><label
								for="5days" class="rd_label">주 5회이상</label> <input type="radio"
								name="classExerciseCount" id="3days" value="3"><label
								for="3days" class="rd_label">주 3회이상</label> <input type="radio"
								name="classExerciseCount" id="1day" value="1"><label
								for="1day" class="rd_label">주 1회이상</label>

						</div>


						<div class="c_person">
							<p>총모집인원</p>
							<input type="text" id="c_text" class="inputbox_size2"
								name="classTotalMember">&nbsp명&nbsp 
								
							<input type="checkbox" id="cb6" name="classTotalMember" value="9999999"
								onclick="c_person_limit(this.form)"><label for="cb6"
								class="cb_label">인원제한없음</label>
						</div>


						<div class="c_goal">
							<p>목표</p>
							<textarea cols="30" rows="50" class="goal_textarea"
								name="classGoal"></textarea>
						</div>



						<div class="c_img_direct">
							<p>대표이미지 설정</p>
							<input type="radio" name="classImage" id="direct"><label
								for="direct" class="rd_label">직접 이미지 올리기</label> <input
								type="file" name="classImage" accept=".jpg, .png" id="upload"><label
								for="upload" class="file_upload"></label> <span
								style="color: #999;">* 650x500px 크기의 jpg.png</span>
						</div>

						<div class="c_img_basic">
							<p></p>
							<input type="radio" name="classImage" id="basic"><label
								for="basic" class="rd_label">기본 이미지 사용</label>
						</div>


						<div class="c_img_list">
							<p></p>
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

							<p></p>

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


						<div class="button">
							<p></p>
							<button class="c_make_button_cancle" type="reset">챌린지등록
								취소</button>
							<button class="c_make_button_submit" type="submit">챌린지등록</button>
						</div>


					</form:form>

				</div>

			</div>
			%>
		</main>

		<%@ include file="../include/footerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
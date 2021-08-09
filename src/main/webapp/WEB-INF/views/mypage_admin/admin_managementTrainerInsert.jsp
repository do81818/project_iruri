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
<c:set var="CONTEXT_PATH_ADMIN"
	value="${pageContext.request.contextPath}/mypage/admin"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<!-- 경로를 확인해 주세요 -->
<title>관리자페이지</title>
<!-- 페이지 이름을 적어주세요 -->
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/admin/admin_main_trainerMemeber.css">
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
</head>
<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->
	</div>

	<div class="wrap">
		<div class="userInfoBox">
			<h2>관리자명</h2>
			<p>
				관리자명<br> iruri123@iruri.com
			</p>
		</div>
		<div id="admin_managementMenu">
			<ul>
				<li><a href="${CONTEXT_PATH_ADMIN}/main"> <span>회원관리</span><br>
						<span></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/trainer/list"><span
						class="admin_active">트레이너관리</span><br> <span
						class="under_line"></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/paylist"><span>수익관리</span><br>
						<span></span></a></li>
			</ul>
		</div>

		<!---------------------- 트레이너관리 하위 메뉴 -------------------------->
		<div id="admin_memberTabMenu">
			<input type="radio" id="tap1" name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/trainer/list'"
				value="1"> <label for="tap1">트레이너전체</label> <input
				type="radio" id="tap2" name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/trainer/blackList'"
				value="2"> <label for="tap2">블랙리스트</label> <input
				type="radio" id="tap3" name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/trainer/regist'"
				value="3" checked> <label for="tap3">트레이너등록</label>
		</div>

		<!---------------------- 트레이너등록 탭 -------------------------->
		<div class="management_trainerMember">
			<div class="insert_trainerMember">
				<form action="${CONTEXT_PATH_ADMIN}/trainer/regist/insert"
					name="trainerInsertForm" method="POST">
					<table>
						<tr>
							<td class="trainerMemberInsertLabel">이름(본명)</td>
							<td><input type="text" style="width: 100%"
								onkeyup="insertNameCheck(this)" name='userName'
								placeholder="실명 입력">
								<div class="admin_notice" id='trainerMemberInsert_name_result'>이름은
									한글로 입력하세요.</div></td>

						</tr>
						<tr>
							<td class="trainerMemberInsertLabel">email</td>
							<td><input id="trainerMemberInsert_email" type="text"
								style="width: 30%;" onkeyup="insertEmailCheck('email')" name="email1">
								<span style="width: 5.5%;">@</span> <input
								id="trainerMemberInsert_emailType" type="text"
								style="width: 30%;" onkeyup="insertEmailCheck('emailType')">
								<select style="width: 30%;" class="__box"
								onchange="javascript:insertEmail()"
								id="trainerMemberSelect_email" name="email2">
									<option value="0">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</select>
								<div class="admin_notice" id='trainerMemberInsert_email_result'>올바른
									형식으로 입력하세요.</div></td>
						</tr>
						<tr>
							<td class="trainerMemberInsertLabel">전화번호</td>
							<td><input type="text" style="width: 100%"
								placeholder="'-'을 제외한 숫자만 입력" name='userPhone'
								onkeyup="insertPhoneNumberCheck(this)" maxlength="11">
								<div class="admin_notice"
									id='trainerMemberInsert_PhoneNumber_result'>'-'를 제외한 숫자를
									형식에 맞게 입력하세요.</div></td>
						</tr>
						<tr>
							<td class="trainerMemberInsertLabel">임시비밀번호</td>
							<td><input type="text" style="width: 100%" name='userPw'
								onkeyup="insertPasswordCheck(this)">
								<div class="admin_notice"
									id='trainerMemberInsert_password_result'>영문자, 숫자,
									특수문자!#$를 8~16자리로 입력하세요.</div></td>
						</tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="button" id="trainerMemberInsert_final"
						onclick="insertFinalCheck()">트레이너등록</button>
				</form>
			</div>
		</div>
	</div>

	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
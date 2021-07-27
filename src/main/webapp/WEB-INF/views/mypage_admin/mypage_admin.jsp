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
	href="${RESOURCES_PATH}/src/css/admin/admin_main_normalMember.css">
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
				<a href="${CONTEXT_PATH_ADMIN}/main">
					<li class="admin_active">회원관리<br> <span
						class="under_line"></span></li>
				</a>
				<a href="${CONTEXT_PATH_ADMIN}/trainer/list">
					<li>트레이너관리<br> <span></span></li>
				</a>
				<a href="${CONTEXT_PATH_ADMIN}/paylist">
					<li>수익관리<br> <span></span></li>
				</a>
			</ul>
		</div>


		<!---------------------- 회원관리 하위 메뉴 -------------------------->
		<div id="admin_memberTabMenu">
			<input type="radio" id="tap1" name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/main'" checked>
			<label for="tap1">신고알림</label> <input type="radio" id="tap2"
				name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/member/list'">
			<label for="tap2">전체회원</label> <input type="radio" id="tap3"
				name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/member/blacklist'">
			<label for="tap3">블랙리스트</label>
		</div>

		<!---------------------- 신고알림 탭 -------------------------->
		<div class="report_memberList">
			<table class="admin_table">
				<tr>
					<th>No.</th>
					<th>회원분류</th>
					<th>닉네임</th>
					<th>신고사유</th>
					<th>게시글보기</th>
				</tr>
				<tr>
					<td class="table_No_date">"${reportList.reportId}"</td>
					<td class="table_indigo_text">일반회원</td>
					<td><a class="table_indigo_text" href="./관리자마이페이지메인_회원정보.html">닉네임</a></td>
					<td class="table_blue_text">부적절한 게시글입니다.</td>
					<td><a class="a_buttonBox" href="#" target="_blank">댓글보기</a> <a
						class="a_buttonBox" href="#" target="_blank">게시글보기</a></td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_indigo_text">일반회원</td>
					<td><a class="table_indigo_text" href="#">닉네임</a></td>
					<td class="table_blue_text">부적절한 게시글입니다.</td>
					<td><a class="a_buttonBox" href="#" target="_blank">댓글보기</a> <a
						class="a_buttonBox" href="#" target="_blank">게시글보기</a></td>
				</tr>
			</table>

			<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
			<div class="page_nation">
				<a class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
				<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a class="arrow next" href="#"></a>
			</div>

		</div>
	</div>

	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
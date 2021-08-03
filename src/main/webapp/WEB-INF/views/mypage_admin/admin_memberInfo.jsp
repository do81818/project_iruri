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
<c:set var="CONTEXT_PATH_ADMIN"	value="${pageContext.request.contextPath}/mypage/admin"
	scope="application" />
	
	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<!-- 경로를 확인해 주세요 -->
<title>관리자페이지</title>
<!-- 페이지 이름을 적어주세요 -->
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/admin/admin_main_memberInfo.css">
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
</head>
<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->
	</div>

	<div class="wrap">
		<div class="admin_memberInfo_title">
			<a href="#" onclick="history.back()"><img
				src="${RESOURCES_PATH}/src/img/icon/arrow_red_left.png"></a>
			<h3>회원정보</h3>
		</div>

		<div id="admin_managementMenu">
			<ul>
				<li><a href="${CONTEXT_PATH_ADMIN }/member/info">기본정보<br>
					<span class="under_line"></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN }/member/exerciseinfo">운동정보<br>
					<span></span></a></li>
			</ul>
		</div>
		<!------------------------ 기본정보 --------------------------->
		<table class="admin_memberInfo_basic">
			<tr>
				<td>회원번호</td>
				<td>${info.userId }</td>
			</tr>
			<tr>
				<td>회원분류</td>
				<td>일반회원</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>루리</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>iruri012345@iruri.com</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>01012345678</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>2021.07.06</td>
			</tr>
			<tr>
				<td>블랙리스트여부</td>
				<td>
					<form class="memberInfo_balackListForm">
						<input id="memberInfo_balackList" type="checkbox"> <label
							for="memberInfo_balackList"> <sapn></sapn>블랙리스트
						</label>
						<div>
							<textarea id="memberInfo_balackList_reason"
								onkeyup="fn_checkByte(this,3000)" placeholder="블랙리스트 사유작성"></textarea>
							<span id="nowByte" class="table_blue_text">0</span> <span
								class="table_gray_text"> / 3000byte</span>
							<button>입력</button>
						</div>
					</form>
				</td>
			</tr>
		</table>

		<!---------------------- 포인트 적립/사용 테이블 -------------------------->
		<div class="admin_memberInfo_point">
			<div class="admin_memberInfo_pointTitle">
				<h3>포인트</h3>
				<p>
					현재보유포인트<span>3,000</span>
				</p>
				<form>
					<input type="radio" id="memberInfo_point_rd1"
						name="memberInfo_point_rds"> <label
						for="memberInfo_point_rd1">적립</label> <input type="radio"
						id="memberInfo_point_rd2" name="memberInfo_point_rds"> <label
						for="memberInfo_point_rd2">사용</label> <input type="number"
						maxlength="10">
					<button>포인트등록</button>
				</form>

			</div>
			<table class="memberInfo_pointTable admin_table">
				<tr>
					<th>날짜</th>
					<th>상태</th>
					<th>적립/사용내용</th>
					<th>포인트</th>
				</tr>
				<tr>
					<td class="table_No_date">0000.00.00</td>
					<td class="table_blue_text">적립</td>
					<td class="table_indigo_text">클래스 구매</td>
					<td class="table_blue_text">+100</td>

				</tr>
				<tr>
					<td class="table_No_date">0000.00.00</td>
					<td class="table_red_text">사용</td>
					<td class="table_indigo_text">클래스 구매</td>
					<td class="table_red_text">-100</td>

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
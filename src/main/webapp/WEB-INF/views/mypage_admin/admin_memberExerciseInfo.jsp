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
			<a href="${CONTEXT_PATH_ADMIN }/member/list?pageNum=${page}"><img
				src="${RESOURCES_PATH}/src/img/icon/arrow_red_left.png"></a>
			<h3>회원정보</h3>
		</div>
		<div id="admin_managementMenu">
			<ul>
				<li><a href="${CONTEXT_PATH_ADMIN }/member/info?userId=${userId}&pageNum=${page}">기본정보<br>
					<span></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN }/member/exerciseinfo?userId=${userId}&pageNum=${page}">운동정보<br>
					<span class="under_line"></span></a></li>
			</ul>
		</div>
		
		<!---------------------- 운동정보 하위 메뉴 -------------------------->
		<div id="admin_memberTabMenu">
			<input type="radio" id="tap1" name="taps" onclick="display_click()"
				value="1" checked> <label for="tap1">전체</label> <input
				type="radio" id="tap2" name="taps" onclick="display_click()"
				value="2"> <label for="tap2">PT클래스</label> <input
				type="radio" id="tap3" name="taps" onclick="display_click()"
				value="3"> <label for="tap3">챌린지</label>
		</div>

		<!---------------------- 전체 탭 -------------------------->
		<div class="list1">
			<table class="admin_table memberInfo_exerciseTable">
				<tr>
					<th>No.</th>
					<th>진행현황</th>
					<th>분류</th>
					<th>챌린지/PT클래스명</th>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지</td>
				</tr>

			</table>
			<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
			<div class="page_nation">
				<a class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
				<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a class="arrow next" href="#"></a>
			</div>
		</div>

		<!---------------------- PT클래스 탭 -------------------------->
		<div class="list2">
			<table class="admin_table memberInfo_exerciseTable">
				<tr>
					<th>No.</th>
					<th>진행현황</th>
					<th>분류</th>
					<th>챌린지/PT클래스명</th>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_gray_text">종료</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지</td>
				</tr>
			</table>
			<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
			<div class="page_nation">
				<a class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
				<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
				<a class="arrow next" href="#"></a>
			</div>
		</div>

		<!---------------------- 챌린지 탭 -------------------------->
		<div class="list3">
			<table class="admin_table memberInfo_exerciseTable">
				<tr>
					<th>No.</th>
					<th>진행현황</th>
					<th>분류</th>
					<th>챌린지/PT클래스명</th>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지, 플랭크 30일챌린지</td>
				</tr>
				<tr>
					<td class="table_No_date">500</td>
					<td class="table_blue_text">진행중</td>
					<td class="table_indigo_text">챌린지</td>
					<td class="table_blue_text">스쿼트, 런지, 플랭크 30일챌린지</td>
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
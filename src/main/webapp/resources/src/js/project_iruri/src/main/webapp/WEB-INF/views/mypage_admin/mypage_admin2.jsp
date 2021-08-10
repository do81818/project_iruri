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

<!-- ------------------------------------------------------------------------------------------- -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- ------------------------------------------------------------------------------------------- -->

<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->

<script>
	$(document).ready(function(){
		/* window.onload = function(){ */
		var actionForm = $("#actionForm");
        $(".pageNumLink").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
        
        $(".prev").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
        
        $(".next").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
	});
</script>

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
				<li><a href="${CONTEXT_PATH_ADMIN}/main"> <span
						class="admin_active">회원관리</span><br> <span class="under_line"></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/trainer/list"><span>트레이너관리</span><br>
						<span></span></a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/paylist"><span>수익관리</span><br>
						<span></span></a></li>
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
					<th>게시글</th>
				</tr>
				<c:forEach items="${reportList}" var="reportList">
					<tr>
						<td class="table_No_date"><c:out
								value="${reportList.reportId}" /></td>
						<td class="table_indigo_text"><c:set var="reportUserRoll"
								value="${reportList.reportUserRoll}" /> <c:choose>
								<c:when test="${reportUserRoll eq 'ROLE_USER'}">
						일반회원
						</c:when>
								<c:when test="${reportUserRoll eq 'ROLE_PAYUSER'}">
						유료회원
						</c:when>
							</c:choose></td>
						<td><a class="table_indigo_text"
							href="./관리자마이페이지메인_회원정보.html"> <c:out
									value="${reportList.reportUserNickName}" /></a></td>
						<td class="table_blue_text"><c:out
								value="${reportList.reportContent}" /></td>
						<td class="table_No_date"><a class="a_buttonBox" href="#"
							target="_blank">게시글보기</a></td>
					</tr>
				</c:forEach>
			</table>

			<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
			<div class="page_nation">
				<c:if test="${pageMaker.prev}">
					<a class="arrow prev" href="${pageMaker.startPage - 1}"></a>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage }">
				<a class="pageNumLink ${pageMaker.cri.pageNum == num ? "
					active":"" }" href="${num}">${num }</a>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<a class="arrow next" href="${pageMaker.endPage + 1}"></a>
				</c:if>
			</div>

			<form id="actionForm" action="${CONTEXT_PATH_ADMIN}/main"
				method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
		</div>
	</div>


	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>

</html>
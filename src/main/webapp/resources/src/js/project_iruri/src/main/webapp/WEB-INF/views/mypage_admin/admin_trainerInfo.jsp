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
        <div class="admin_trainerInfo_title">
            <a href="history.back()"><img src="${RESOURCES_PATH}/src/img/icon/arrow_red_left.png"></a>
            <h3>트레이너 정보</h3>
        </div>

        <!------------------------ 기본정보 --------------------------->
        <table class="admin_memberInfo_basic">
            <tr>
                <td>회원번호</td>
                <td>
                    <form>
                        <input type="text" disabled value="1"></input>
                        <button>탈퇴회원으로 전환</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>트레이너 실명</td>
                <td>홍길동</td>
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
                <td>평점</td>
                <td>4.3</td>
            </tr>
            <tr>
                <td>블랙리스트여부</td>
                <td>
                    <form class="memberInfo_balackListForm">
                        <input id="memberInfo_balackList" type="checkbox">
                        <label for="memberInfo_balackList">
                            <sapn></sapn>블랙리스트
                        </label>
                        <div>
                            <textarea id="memberInfo_balackList_reason" onkeyup="fn_checkByte(this,3000)" placeholder="블랙리스트 사유작성"></textarea>
                            <span id="nowByte" class="table_blue_text">0</span>
                            <span class="table_gray_text"> / 3000byte</span>
                            <button>입력</button></div>
                    </form>
                </td>
            </tr>
        </table>

        <!---------------------- 수익관리 테이블 -------------------------->
        <div class="admin_trainerInfo_money">
            <div class="admin_trainerInfo_moneyTitle">
                <div>
                    <h3>수익관리</h3>
                    <a href="#"><img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_left.png"></a>
                    <p>1월</p>
                    <a href="#"><img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_right.png"></a>
                </div>
                <form>
                    <p>출금예상금액
                    <input type="hidden" value="1,200,000" disable><span>1,200,000</span>원</p>
                    <button>지급</button>
                </form>

            </div>
            <table class="trainerInfo_moneyTable admin_table">
                <tr>
                    <th>날짜</th>
                    <th>구분</th>
                    <th>내용</th>
                    <th>잔금</th>
                </tr>
                <tr>
                    <td class="table_No_date">0000.00.00</td>
                    <td class="table_blue_text" >구매</td>
                    <td class="table_indigo_text">클래스 구매</td>
                    <td class="table_blue_text">+90,000</td>

                </tr>
                <tr>
                    <td class="table_No_date">0000.00.00</td>
                    <td class="table_red_text">환불</td>
                    <td class="table_indigo_text">클래스 환불</td>
                    <td class="table_red_text">-90,000</td>

                </tr>

            </table>
            <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
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
    </div>

	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
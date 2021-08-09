<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="${RESOURCES_PATH}/src/css/admin/admin_main_memberInfo.css">
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	defer></script>

<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
</head>
<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->
	</div>

	<div class="wrap">
		<div class="admin_trainerInfo_title">
			<a href="#" onclick="history.back()"><img
				src="${RESOURCES_PATH}/src/img/icon/arrow_red_left.png"></a>
			<h3>트레이너 정보</h3>
		</div>

		<!------------------------ 기본정보 --------------------------->
		<table class="admin_memberInfo_basic">
			<tr>
				<td>회원번호</td>
				<td>
					<form>
						<input type="text" disabled value="${info.iuserVo.userId}"></input>
						<button>탈퇴회원으로 전환</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>트레이너 실명</td>
				<td>${info.iuserVo.userName}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${info.iuserVo.userNickname }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${info.iuserVo.userEmail }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${info.iuserVo.userPhone }</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><fmt:formatDate value="${info.iuserVo.userSigndate }"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td>평점</td>
				<td><c:choose>
						<c:when test="${grade} == null">0.0</c:when>
						<c:otherwise>${grade}</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td>블랙리스트여부</td>
				<td>
					<form class="memberInfo_balackListForm">
						<c:choose>
							<c:when test="${info.iuserVo.userBlackList == true }">
								<input id="memberInfo_balackList" type="checkbox" checked>
								<label for="memberInfo_balackList"> <span></span>블랙리스트
								</label>
							</c:when>
							<c:otherwise>
								<input id="memberInfo_balackList" type="checkbox">
								<label for="memberInfo_balackList"> <span></span>블랙리스트
								</label>
							</c:otherwise>
						</c:choose>

						<div>
							<c:choose>
								<c:when test="${info.iuserVo.userBlaskListReason eq null }">
									<textarea id="memberInfo_balackList_reason"
										onkeyup="fn_checkByte(this,3000)" placeholder="블랙리스트 사유작성"></textarea>
								</c:when>
								<c:otherwise>
									<textarea id="memberInfo_balackList_reason"
										onkeyup="fn_checkByte(this,3000)" placeholder="블랙리스트 사유작성"
										value="${info.iuserVo.userBlaskListReason}"></textarea>
								</c:otherwise>
							</c:choose>

							<span id="nowByte" class="table_blue_text">0</span> <span
								class="table_gray_text"> / 3000byte</span>
							<button>입력</button>
						</div>
					</form>
				</td>
			</tr>
		</table>

		<!---------------------- 수익관리 테이블 -------------------------->
		<div class="admin_trainerInfo_money">
			<div class="admin_trainerInfo_moneyTitle">
				<%-- <div>
                    <h3>수익관리</h3>
                    <a><img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_left.png"></a>
                    <p>1월</p>
                    <a><img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_right.png"></a>
                </div>
                <form>
                    <p>출금예상금액
                    <input type="hidden" value="1,200,000" disable><span>1,200,000</span>원</p>
                    <button>지급</button>
                </form> --%>

			</div>
			<table class="trainerInfo_moneyTable admin_table">

				<!-- ajax로 수익 리스트 구현 -->

			</table>

			<div class="page_nation">
				<!-- ajax로 페이지 구현 -->
			</div>


		</div>
	</div>

	<script>
	$(document).ready(function() {
	    console.log( "ready!" );
        getlist(1,0);
    });
	
	function getlist(page, month) {
	    
	    $.ajax({
            url : '${CONTEXT_PATH_ADMIN}/ajax/trainer/info',
            type : 'GET',
            cache : false,
            dataType : 'json',
            data : {
                 pageNum : page,
                 userId: ${info.iuserVo.userId},
                 month: month,
             },
            success : function(result) {
                console.log(result);
                var list = result['list'];
                var pagination = result['pageMaker'];
                var monthTotal = result['monthTotal']
                month = result['month'];
                var htmls = "";
                var htmls1 = "";
                var htmls2 = "";
                let todayMonth = new Date().getMonth() + 1;
                
                
                htmls += '<div>'
	                + '<h3>수익관리</h3>'
	                + '<a class="prevMonth" href="javascript:getlist('+ pagination['startPage'] + ',' + (month-1) +')">'
	                + '<img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_left.png"></a>'
	                + '<p>'
	                + (todayMonth + month)
	                + '월</p>';
               htmls += '<a class="nextMonth" href="javascript:getlist('+ pagination['endPage'] + ',' + (month+1) +')">';
			   		+ '<img src="${RESOURCES_PATH}/src/img/icon/arrow_red_bold_right.png"></a>';
                htmls += '</div>'
	                + '<form><p>출금예상금액'
	                + '<input type="hidden" value="' + monthTotal + '" disable><span>'+ monthTotal + '</span>원</p>'
	                + '<button>지급</button>'
	                + '</form>';

               htmls1 += "<tr><th>날짜</th><th>구분</th><th>내용</th><th>금액</th></tr>";
	
               /* --------------------- 포인트 리스트 -------------------- */
				    /* console.log(list.length); */
				if (list.length < 1) {
                             htmls1 += '<tr>';
                             htmls1 += '<td colspan="4" class="table_No_date">'
                                     + '수익 내역이 없습니다.' + '</td>';
                             htmls1 += '</tr>'
                         } else {
                             $(list).each(
	                                 function() {
	                                     
		                 				var moneyInput = this.moneyVo.moneyInput + this.buyVo.buyPoint;
		                 				var moneyOutput = this.moneyVo.moneyOutput + this.buyVo.buyPoint;
		                 				
                              			htmls1 += '<tr>'
		                 					+ '<td class="table_No_date">'
		                 					+ moment(this.moneyVo.moneyDate).format('YYYY.MM.DD')
		                 					+ '</td>';
		                 					if(this.payVo.payState == 'pay') {
		                 						htmls1 += '<td class="table_blue_text">구매</td>';  
		                 						htmls1 += '<td td class="table_indigo_text">'
				                 					+ this.iclassVo.classTitle
				                 					+ ' 구매</td>';
		                 						htmls1 += '<td class="table_blue_text">+' + priceToString(moneyInput) + '</td>';
		                 					} else if(this.payVo.payState == 'cancle'){
		                 					   htmls1 += '<td class="table_red_text">환불</td>';
		                 					   htmls1 += '<td td class="table_indigo_text">'
				                 					+ this.iclassVo.classTitle
				                 					+ ' 구매취소</td>';
		                 					  htmls1 += '<td class="table_red_text">-' + priceToString(moneyOutput) + '</td>';
		                 					}
		                 				
	                 					htmls1 += '</tr>'
	                                 });
                             
                             
                             /* ------------------ 페이징 부분 --------------------- */
                             if (pagination['prev']) {
                                 htmls2 += '<a class="arrow prev" href="javascript:getlist('+ (pagination['startPage']-1, month) +')"></a>';
             				} 

             				// 번호를 표시하는 부분
             				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
             					if (page !== idx) {
             					   htmls2 += '<a class="pageNumLink" href="javascript:getlist('+ idx + ')">' + (idx, month) + "</a>";
             					} else {
             					   htmls2 += '<a class="pageNumLink active" href="javascript:getlist('+ idx + ')">' + (idx, month) + "</a>";
             					}
             				}

             				if (pagination['next']) {
                                htmls2 += '<a class="arrow next" href="javascript:getlist('+ (pagination['endPage']+1, month) +')"></a>';
            						
            				}			
             			}	// if(list.length < 1) else 끝
							$(".admin_trainerInfo_moneyTitle").html(htmls);                         
                            $(".admin_table").html(htmls1);
             				$(".page_nation").html(htmls2);
                         }	

                     });
                }
	
	$(document).ready(function(){
	$(".nextMonth").onlick(function(){
        if(month > 0){
            $(".nextMonth").css('display', 'none');
        } else {
            $(".nextMonth").css('display', 'inline');
        }
    });
    
    $(".prevMonth").onlick(function(){
        if(month < 0){
            $(".nextMonth").css('display', 'inline');
        }
    });
	})
    
	
	
	</script>


	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
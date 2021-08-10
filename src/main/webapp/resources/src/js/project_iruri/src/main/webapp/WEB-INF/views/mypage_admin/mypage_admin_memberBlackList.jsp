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
				onclick="location.href='${CONTEXT_PATH_ADMIN}/main'"> <label
				for="tap1">신고알림</label> <input type="radio" id="tap2" name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/member/list'">
			<label for="tap2">전체회원</label> <input type="radio" id="tap3"
				name="taps"
				onclick="location.href='${CONTEXT_PATH_ADMIN}/member/blacklist'"
				checked> <label for="tap3">블랙리스트</label>
		</div>

		<!---------------------- 트레이너회원 탭 -------------------------->
		<div class="report_totalMemberList">
			<table class="admin_table">
				<!-- ajax로 블랙리스트 구현 -->
			</table>
			
			<div class="page_nation">

				<!-- ajax 페이징 구현 -->
				
			</div>
		</div>
	</div>
	
	
	<script>
            function getlist(page) {
                $.ajax({
                     url : '${CONTEXT_PATH_ADMIN}/ajax/member/blacklist',
                     type : 'GET',
                     cache : false,
                     dataType : 'json',
                     data : {
                          pageNum : page,
                      },
                     success : function(result) {
                         console.log(result);
                         var list = result['list'];
                         var pagination = result['pageMaker'];
                         var htmls = "";
                         var htmls2 = "";

                         
                        htmls += "<tr><th>No.</th><th>회원분류</th><th>닉네임</th><th>이메일주소</th><th>가입일</th>";
                         
                        /* --------------------- 회원리스트 부분 --------------------- */
                    	
     					if (list.length < 1) {
    						htmls += '<tr>';
    						htmls += '<td colspan="5" class="table_No_date">'
    								+ '등록된 블랙리스트 회원이 없습니다.' + '</td>';
    						htmls += '</tr>'
    					} else {
    						$(list).each(
    							function() {
    								var url = "${CONTEXT_PATH_ADMIN}/member/info";
    								htmls += '<tr class="list_impact">';
    								htmls += '<td class="table_No_date">'
    										+ this.iuserVo.userId
    										+ '</td>';

    								htmls += '<td class="table_indigo_text">';
    								if (this.authVo.authContent == "ROLE_USER") {
    									htmls += '일반회원';
    								} else if (this.authVo.authContent == "ROLE_PAYUSER") {
    									htmls += '유료회원';
    								} else {
    									htmls += '00';
    								}
    								htmls += '</td>';

    								htmls += '<td class="table_indigo_text">'
    										+ '<a href="#" target="_blank">'
    										+ this.iuserVo.userNickname
    										+ '</td>';
    								htmls += '<td class="table_blue_text">'
    										+ this.iuserVo.userEmail
    										+ '</td>';

    								var date = moment(this.iuserVo.userSigndate).format('YYYY.MM.DD');
    								htmls += '<td class="table_No_date">'
    										+ date
    										+ '</td>' + '</tr>';
    						});
    	
                         
                         /* ------------------ 페이징 부분 --------------------- */
                         if (pagination['prev']) {
                             htmls2 += '<a class="arrow prev" href="javascript:getlist('+ (pagination['startPage']-1) +')"></a>';
         				} 

         				// 번호를 표시하는 부분
         				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
         					if (page !== idx) {
         					   htmls2 += '<a class="pageNumLink" href="javascript:getlist('+ idx + ')">' + (idx) + "</a>";
         					} else {
         					   htmls2 += '<a class="pageNumLink active" href="javascript:getlist('+ idx + ')">' + (idx) + "</a>";
         					}
         				}

         				if (pagination['next']) {
                            htmls2 += '<a class="arrow next" href="javascript:getlist('+ (pagination['endPage']+1) +')"></a>';
        						
        				}			
         			}	// if(list.length < 1) else 끝
                     
                        $(".admin_table").html(htmls);
         				$(".page_nation").html(htmls2);
                     }
                     

                 });
                             
                             
            }

            $(document).ready(function() {
                getlist(1);
            });
        </script>
        

	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
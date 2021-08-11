<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" defer></script>

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
				<li><a
					href="${CONTEXT_PATH_ADMIN }/member/info?userId=${info.iuserVo.userId}">기본정보<br>
						<span class="under_line"></span></a></li>
				<li><a
					href="${CONTEXT_PATH_ADMIN }/member/exerciseinfo?userId=${info.iuserVo.userId}">운동정보<br>
						<span></span></a></li>
			</ul>
		</div>
		<!------------------------ 기본정보 --------------------------->
		<table class="admin_memberInfo_basic">
			<tr>
				<td>회원번호</td>
				<td>${info.iuserVo.userId }</td>
			</tr>
			<tr>
				<td>회원분류</td>
				<td><c:choose>
						<c:when test="${info.authVo.authId eq '1' }">일반회원</c:when>
						<c:when test="${info.authVo.authId eq '2' }">유료회원</c:when>
						<c:when test="${info.authVo.authId eq '3' }">탈퇴회원</c:when>
					</c:choose></td>
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
				<td><fmt:formatDate value="${info.iuserVo.userSigndate }" pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td>블랙리스트여부</td>
				<td>
					<form name="memberInfo_balackListForm"
						class="memberInfo_balackListForm">
						<input type="hidden" name="userId" value="${info.iuserVo.userId}" />
						<c:set var="userBlackList" value="${info.iuserVo.userBlackList}"
							scope="session" />
						<c:choose>
							<c:when test="${userBlackList == true}">
								<input id="memberInfo_balackList" class="memberInfo_balackList" type="checkbox" checked
									name="number" value="noneBlack">
								<label for="memberInfo_balackList"><span></span>블랙리스트 </label>
							</c:when>
							<c:otherwise>
								<input id="memberInfo_balackList" class="memberInfo_balackList" type="checkbox" name="number"
									value="black">
								<label for="memberInfo_balackList"> <span></span>블랙리스트
								</label>
							</c:otherwise>
						</c:choose>
						<div>
							<textarea id="memberInfo_balackList_reason" name="reason"
								onkeyup="fn_checkByte(this,3000)" placeholder="블랙리스트 사유작성">${info.iuserVo.userBlaskListReason}</textarea>
							<span id="nowByte" class="table_blue_text">0</span> <span
								class="table_gray_text"> / 3000byte</span>
							<button id="memberInfo_balackListForm_button" type="button">입력</button>
						</div>
					</form>
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
	
		 $(document).ready(function(){
	     
	     document.getElementById("memberInfo_balackList").addEventListener("click", function() {
	         updateBlackList_number();
	   	    }, false); 
	   	 document.getElementById("memberInfo_balackListForm_button").addEventListener("click", function() {
	   	  updateBlackList_reason();
	   	    }, false);
		 
	   	
	   	function updateBlackList_number() {
	   	    
	   	let userId = ${info.iuserVo.userId};
	   	let number = $('input[name=number]').val();
	   	let reason = $('#memberInfo_balackList_reason').val();
	   	 
	   	 if(reason != "") {
	   	     
	   	 } else {
	   	     reason = 1;
	   	 }
	   	
	     console.log("updateBlackList()..");
	     console.log("userId", userId);
	     console.log("number", number);
	     console.log("reason", reason);
	     
	     const header = $('meta[name="_csrf_header"]').attr('th:content');
         const token = $('meta[name="_csrf"]').attr('th:content');
         
	     /* var formData = $('form[name="memberInfo_balackListForm"]').serialize(); 
	     
		 console.log(formData); */
		 
		 
		 $.ajax({
		     url: '${CONTEXT_PATH_ADMIN}/ajax/update/blacklist',
		     type: 'POST',
		     data: {
		         userId: userId,
		         number: number,
		         reason: reason,
		     },
		     dataType: 'json',
		     beforeSend: function(xhr) {
           		xhr.setRequestHeader(header, token);
       		 },
       		 success : function(result) {
       		  	console.log("성공");

       		 	if(number == 'noneBlack'){
              		 $('input[name=number]').val('black');
    		  	    alert('블랙리스트가 해지되었습니다.');
    		  	} else if (number == 'black') {
    		  	  $('input[name=number]').val('noneBlack');
    		  		alert('블랙리스트 처리되었습니다.');
    		  	}
       		 }
		 });
		 
	   	}
	   	
	   	function updateBlackList_reason() {
	   	    
		   	let userId = ${info.iuserVo.userId};
		   	let number = $('input[name=number]').val();
		   	let reason = $('#memberInfo_balackList_reason').val();
		   	 
		   	 if(reason != "") {
		   	     
		   	 } else {
		   	     reason = 1;
		   	 }
		   	
		     console.log("updateBlackList()..");
		     console.log("userId", userId);
		     console.log("number", number);
		     console.log("reason", reason);
		     
		     const header = $('meta[name="_csrf_header"]').attr('th:content');
	         const token = $('meta[name="_csrf"]').attr('th:content');
	         
		     /* var formData = $('form[name="memberInfo_balackListForm"]').serialize(); 
		     
			 console.log(formData); */
			 
			 
			 $.ajax({
			     url: '${CONTEXT_PATH_ADMIN}/ajax/update/blacklist',
			     type: 'POST',
			     data: {
			         userId: userId,
			         number: number,
			         reason: reason,
			     },
			     dataType: 'json',
			     beforeSend: function(xhr) {
	           		xhr.setRequestHeader(header, token);
	       		 },
	       		 success : function(result) {
	       		  	console.log("성공");
	       		  	
	       		  	if(reason !== '1') {
	       		  	    alert('블랙리스트 사유가 등록되었습니다.')
	       		  	}
	       		 }
			 });
			 
		   	}
	   	
	 })
	
	 
	</script>

		<!---------------------- 포인트 적립/사용 테이블 -------------------------->
		
		<div class="admin_memberInfo_point">
			<div class="admin_memberInfo_pointTitle">
				<h3>포인트</h3>
				<p>
					현재보유포인트<span>${point}</span>
				</p>
				<form>
					<input type="radio" id="memberInfo_point_rd1" name="memberInfo_point_rds"> 
						<label for="memberInfo_point_rd1">적립</label> 
						<input type="radio"	id="memberInfo_point_rd2" name="memberInfo_point_rds"> 
						<label for="memberInfo_point_rd2">사용</label> 
						<input type="number" maxlength="10">
					<button>포인트등록</button>
				</form>

			</div>
			<table class="memberInfo_pointTable admin_table">
			
			<!-- ajax로 포인트리스트 구현 -->

			</table>
			<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
			<div class="page_nation">
				<!-- ajax 페이지 구현 -->
			</div>


		</div>
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
	    console.log( "ready!" );
        getlist(1);
    });
	
	function getlist(page) {
	    $.ajax({
            url : '${CONTEXT_PATH_ADMIN}/ajax/member/info',
            type : 'GET',
            cache : false,
            dataType : 'json',
            data : {
                 pageNum : page,
                 userId: ${info.iuserVo.userId},
             },
            success : function(result) {
                console.log(result);
                var list = result['pointlist'];
                var pagination = result['pageMaker'];
                var htmls = "";
                var htmls2 = "";

                console.log(list);
                
               htmls += "<tr><th>날짜</th><th>상태</th><th>적립/사용내용</th><th>포인트</th></tr>";
	
               /* --------------------- 포인트 리스트 -------------------- */
				if (list.length < 1) {
                             htmls += '<tr>';
                             htmls += '<td colspan="4" class="table_No_date">'
                                     + '포인트 내역이 없습니다.' + '</td>';
                             htmls += '</tr>'
                         } else {
                             $(list).each(
	                                 function() {
	                                     
                              			htmls += '<tr>'
		                 					+ '<td class="table_No_date">'
		                 					+ moment(this.pointChangedate).format('YYYY.MM.DD')
		                 					+ '</td>';
		                 					if(this.pointState == 'save') {
		                 						htmls += '<td class="table_blue_text">적립</td>';    
		                 					} else if(this.pointState == 'use'){
		                 					   htmls += '<td class="table_red_text">사용</td>';
		                 					}
	                 					htmls += '</td>'
		                 					+ '<td class="table_indigo_text">'
		                 					+ this.pointContent
		                 					+ '</td>';
		                 					if(this.pointState == 'save') {
		                 						htmls += '<td class="table_blue_text">+' + priceToString(this.pointValue) + '</td>';    
		                 					} else if(this.pointState == 'use'){
		                 					   htmls += '<td class="table_red_text">-' + priceToString(this.pointValue) + '</td>';
		                 					}
	                 					htmls += '</tr>'
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
	
	
	
	</script>

	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
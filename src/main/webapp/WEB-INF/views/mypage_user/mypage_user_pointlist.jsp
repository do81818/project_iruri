<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
     <%@ include file="../include/static.jsp" %> 
    <title>마이페이지 포인트리스트</title> 
      <script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
  </head>
  <body>
    <div class="iruri__wrapper">

<%@ include file="../include/headerTemplate.jsp" %> 

      <main>

		    <!-- 콘텐츠 -->
      <!-- 회원정보 -->
    <div class="container content">
        <div class="m_information_box">
          <div id = "m_userinformation_box">
            <div id="m_nickname"><p>${user.userNickname}</p>
            <button class ="m_information_change">정보수정</button>
            
                 </div>
          <div id="m_useremail">       
          <c:if test="${user.authList[0].authContent eq 'ROLE_USER'}">
			<div>일반회원</div>
		</c:if>
		<br>${user.userEmail}</div>
          </div>
      <div id = "m_userboard_box">
        <div id="m_userboard"><a href="/ex/mypage/boardlist">작성글</a></div>
        <div id ="m_userboard_number">${boardcount}</div>
      </div>
      <div id = "m_userpoint_box">
        <div id="m_userpoint"><a href="/ex/mypage/pointlist">보유포인트</a></div>
        <div id ="m_userpoint_number">${totalpoint}</div>
      </div>
      <div id = "m_userchanllenge_box">
        <div id="m_userchanllenge"><a href="/ex/mypage/challengelist">참여중인챌린지</a></div>
        <div id="m_userchanllenge_number">${userchallengecount}</div>
      </div>
      <div id = "m_userclass_box">
        <div id="m_userclass"><a href="/ex/mypage/classlist">참여중인클래스</a></div>
        <div id="m_userclass_number">${userclasscount} </div>
      </div>
        </div>
         
                 <!-- 포인트리스트박스 -->

                 <div class="m_point_box">
                    <div id="m_now_pointlist_box">
                           <div id="m_now_pointlist">현재포인트</div>
                           <div id="m_now_pointlistnb">${savepoint}</div>
                       
                   </div>
                   <div id="m_pre_pointlist_box">
                       <div id="m_pre_pointlist">적립예정포인트</div>
                        <div id="m_pre_pointlistnb">${appointedpoint}</div>
                   </div>
                   <div id="m_use_pointlist_box">
                       <div id="m_use_pointlist">사용포인트</div>
                       <div id="m_use_pointlistnb">${usepoint}</div>
                   </div>
                </div>


				
				<c:forEach var="point" items="${pointlist}" varStatus = "status">
				<c:if test="${point.pointState eq 'save'}">
				 <!--  적립된포인트 -->
                <div class="m_userpoint_list">
                    <div id="m_point_type_save">적립</div>
                    <div id="m_point_content_box">
                    
                        <div id="m_point_date">
                        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <fmt:formatDate pattern ="yyyy-MM-dd" value="${point.pointSavedate}"/></div>
                        <div id="m_point_content">${point.pointContent}</div>
                    </div>
                    <div id="m_point_price">${point.pointValue}</div>
                     
                 </div>
                 <p class="border1"></p>
				
				</c:if>
				
				<c:if test="${point.pointState eq 'appointed'}">
				 <!--  적립예정포인트 -->
                 <div class="m_userpoint_list">
                    <div id="m_point_type_pre">적립예정</div>
                    <div id="m_point_content_box">
                        <div id="m_point_date">
                         <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <fmt:formatDate pattern ="yyyy-MM-dd" value="${point.pointSavedate}"/></div>
                        <div id="m_point_content">${point.pointContent}</div>
                    </div>
                    <div id="m_point_price">${point.pointValue}</div>
                     
                 </div>
                 <p class="border1"></p>
				</c:if>
				
				
				<c:if test="${point.pointState eq 'use'}">
				<div class="m_userpoint_list">
                <div id="m_point_type_use">사용</div>
                <div id="m_point_content_box">
                    <div id="m_point_date">
                     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <fmt:formatDate pattern ="yyyy-MM-dd" value="${point.pointSavedate}"/></div>
                    <div id="m_point_content">${point.pointContent}</div>
                </div>
                <div id="m_point_useprice">-${point.pointValue}</div>
                 
             </div>
             <p class="border1"></p>
				
				
				
				</c:if>
				</c:forEach>
				
				
				        <!--페이징-->
        <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
        <div class="page_nation">
        <c:if test="${pageMaker.prev}">
            <a class="prev" href="pointlist${pageMaker.makeQuery(pageMaker.startPage - 1) }"></a>
        </c:if>
        
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        	
            <%--  <a class="active" href="pointlist${pageMaker.makeQuery(num)}" >${num}</a>  --%>
         
         
       <c:choose>
          <c:when test="${pageMaker.cri.pageNum == num}">
             <a class="pageNumLink active" href="pointlist${pageMaker.makeQuery(num)}" >${num}</a>
          </c:when> 
          <c:otherwise>
          	<a class="pageNumLink" href="pointlist${pageMaker.makeQuery(num)}" >${num}</a>
          </c:otherwise>
          </c:choose> 
            
            
        </c:forEach>
        
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="next" href="pointlist${pageMaker.makeQuery(pageMaker.endPage +1) }"></a>
        </c:if>
        </div>
        
        <form id="actionForm" action="mypage_user/mypage_user_pointlist" method="get">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        </form> 
        
				
                 

      
    </div>

 
	
	    <!-- 팝업창  -->
    <div class="modal"  max-width: 400px;
    min-width: 500px;
    margin: 0 auto;
    background-color: #eee;>
      <div class="modal_content" 
           title="클릭하면 창이 닫힙니다.">
           <div class="alertWindow">
            <div class="alertWindow_close"><img src='http://localhost:8282/ex/resources/src/img/icon/close.png' width="20px" height="20px" > </div>
            <div class="alertWindow_insert">
              <h2 class="alertWindow_title">정보수정</h2>
              <form action="#">
                <p>비밀번호</p>
                <input class="inputbox_size1" type="text"  />
                
                <p>비밀번호 확인</p>
                <input class="inputbox_size1" type="text" />
                
                <p>닉네임</p>
                <input class="inputbox_size2" type="text">
                <p>전화번호</p>
                <input class="inputbox_size2" type="text">
        
                <button class="alertWindow_submit" type="submit">비밀번호 변경</button>
              </form>
            </div>
          </div>
    </div>
  </div>

<script type="text/javascript">

</script>
  
      </main>
      
   <%@ include file="../include/footerTemplate.jsp" %> 
    
    </div>    
  </body>
</html>
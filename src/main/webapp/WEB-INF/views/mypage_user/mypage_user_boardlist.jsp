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
    <title>마이페이지 보드리스트</title> 
      <script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
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
          <div id="m_userboard"><a href=".">작성글</a></div>
          <div id ="m_userboard_number">${boardcount}</div>
        </div>
        <div id = "m_userpoint_box">
          <div id="m_userpoint"><a href=".">보유포인트</a></div>
          <div id ="m_userpoint_number">${totalpoint}</div>
        </div>
        <div id = "m_userchanllenge_box">
          <div id="m_userchanllenge"><a href=".">참여중인챌린지</a></div>
          <div id="m_userchanllenge_number">${userchallengecount}</div>
        </div>
        <div id = "m_userclass_box">
          <div id="m_userclass"><a href=".">참여중인클래스</a></div>
          <div id="m_userclass_number"></div>
        </div>
      </div>
       
     

         <!-- 게시판리스트박스 -->

         <div class="m_board_box">
             <div id="m_boardlist_box">
                    <div id="m_now_boardlist">게시글</div>
                    <div id="m_now_boardlistnb">${myboardcount}</div>
                
            </div>
            <div id="m_confirmlist_box">
                <div id="m_now_confirmlist">인증글</div>
                 <div id="m_now_confirmlistnb">${confirmcount}</div>
            </div>
            <div id="m_commentlist_box">
                <div id="m_now_commentlist">댓글</div>
                <div id="m_now_commentlistnb">${commentcount}</div>
            </div>
         </div>
        
         <!-- 게시판 리스트 -->
<%-- ${sumList1[status.index].데이터명}
${sumList2[status.index].데이터명}
${sumList3[status.index].데이터명} --%>

	<c:forEach var="confirm" items="${commentlist}" varStatus="status">
	

		<c:if test="${confirm.categoryId == 5}">
		<div class="m_userboardlist">
           <div id="m_confirm_list_type">인증글</div>
           <div id="m_board_list_img"><img id="img" src="../img/icon/270-270.png"></div>
           <div id="m_board_list_content">
          <div id="m_board_list_title">  <c:out value="${confirm.boardTitle}" /></div>
            <div id="m_board_list_content">  <c:out value="${confirm.boardContent}" /></div>
            <div id="m_board_list_date">  <c:out value="${confirm.boardDate}" /></div>
            
         </div>
        </div>
        <p class="border1"></p> 
		</c:if>
                  

		<c:if test="${confirm.categoryId == 7}">
                  <div class="m_userboardlist">
          <div id="m_board_list_type">게시글</div>
          <div id="m_board_list_img"><img id="img" src="../img/icon/270-270.png"></div>
          <div id="m_board_list_content">
           <div id="m_board_list_title"><c:out value="${confirm.boardTitle}" /></div>
           <div id="m_board_list_content"><c:out value="${confirm.boardContent}" /></div>
           <div id="m_board_list_date"><c:out value="${confirm.boardDate}" /></div>
        </div>
       </div>
        <p class="border1"></p>  
		</c:if>


<c:if test="${confirm.categoryId == 6 or confirm.categoryId == 8}">
 		<div class="m_userboardlist">
      <div id="m_comment_list_type">댓글</div>
      <div id="m_board_list_content">
       <div id="m_board_list_content"><c:out value="${confirm.boardContent}" /></div>
       <div id="m_board_list_date"><c:out value="${confirm.boardDate}" /></div>
    </div>
   </div>
   <p class="border1"></p>
		</c:if>
	</c:forEach>


<!-- 인증글
http://localhost:8282/ex/resources/src/img/icon/270-270.png
 <div class="m_userboardlist">
  <div id="m_confirm_list_type">인증글</div>
  <div id="m_board_list_img"><img id="img" src="http://localhost:8282/ex/resources/src/img/icon/270-270.png"></div>
  <div id="m_board_list_content">
   <div id="m_board_list_title">인증글제목입니다</div>
   <div id="m_board_list_content">인증글의내용입니다. 아침에 적당히 땀흘리니까 기분이 좋더라구영</div>
   <div id="m_board_list_date">2021.07.15</div>
   
</div>
</div>
<p class="border1"></p>

게시글

<div class="m_userboardlist">
 <div id="m_board_list_type">게시글</div>
 <div id="m_board_list_img"><img id="img" src="http://localhost:8282/ex/resources/src/img/icon/270-270.png"></div>
 <div id="m_board_list_content">
  <div id="m_board_list_title">인증글제목입니다</div>
  <div id="m_board_list_content">인증글의내용입니다. 아침에 적당히 땀흘리니까 기분이 좋더라구영</div>
  <div id="m_board_list_date">2021.07.15</div>
</div>
</div>
<p class="border1"></p>

댓글

<div class="m_userboardlist">
<div id="m_comment_list_type">댓글</div>
<div id="m_board_list_content">
<div id="m_board_list_content">댓글의내용입니다. 아침에 적당히 땀흘리니까 기분이 좋더라구영</div>
<div id="m_board_list_date">2021.07.15</div>
</div>
</div>
<p class="border1"></p>
 --> 

        <!--페이징-->
        <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
        <div class="page_nation">
        <c:if test="${pageMaker.prev}">
            <a class="prev" href="boardlist${pageMaker.makeQuery(pageMaker.startPage - 1) }"></a>
        </c:if>
        
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        
            <a class="active" href="boardlist${pageMaker.makeQuery(num)}" >${num}</a>
        </c:forEach>
        
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="next" href="boardlist${pageMaker.makeQuery(pageMaker.endPage +1) }"></a>
        </c:if>
        </div>
        
        <form id="actionForm" action="mypage_user/mypage_user_boardlist" method="get">
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


  <div class="modal1"  max-width: 400px;
  min-width: 500px;
  margin: 0 auto;
  background-color: #eee;>
    <div class="modal_content" 
         title="클릭하면 창이 닫힙니다.">
         <div class="alertWindow">
          <div class="alertWindow_close"><img src="http://localhost:8282/ex/resources/src/img/icon/close.png" width="20px" height="20px" > </div>
          <div class="alertWindow_insert">
            <h2 class="alertWindow_title">신체정보수정</h2>
            <form action="#">
              <p>성별</p>
              <input class="inputbox_size1" type="text"  />
              
              <p>나이</p>
              <input class="inputbox_size1" type="text" />
              
              <p>키</p>
              <input class="inputbox_size2" type="text">
              <p>몸무게</p>
              <input class="inputbox_size2" type="text">
      
              <button class="alertWindow_submit" type="submit">비밀번호 변경</button>
            </form>
          </div>
        </div>
  </div>
</div>
  
      </main>
      
   <%@ include file="../include/footerTemplate.jsp" %> 
    
    </div>    
  </body>
</html>
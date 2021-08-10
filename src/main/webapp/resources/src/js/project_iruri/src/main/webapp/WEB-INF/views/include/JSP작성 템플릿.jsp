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
    <%-- <%@ include file="include/static.jsp" %> --%> <!-- 경로를 확인해 주세요 -->
    <title>이루리 메인</title> <!-- 페이지 이름을 적어주세요 -->
    <script src="" defer></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
  </head>
  <body>
    <div class="iruri__wrapper">

    <%-- <%@ include file="include/headerTemplate.jsp" %> --%> <!-- 경로를 확인해 주세요 -->

      <main>
        
    <div class="c_container">
        <div class="c_makeForm_insert">


            <form class="c_makeForm" action="#">
                <!--accept-charset="utf-8" name="c_make_form" method="GET"-->
                <h2 class="c_makeForm_title">게시판 글쓰기</h2>

                <div class="c_name">
                    <p>글 제목</p>
                    <input type="text" class="inputbox_size1">
                </div>




                <div class="c_goal">
                    <p>글 내용</p>
                    <textarea cols="30" rows="50" class="goal_textarea"></textarea>
                </div>



                <div class="c_img_direct">
                    <p>대표이미지 설정</p>
                    <input type="radio" name="img" id="direct"><label for="direct" class="rd_label">직접 이미지 올리기</label>
                    <input type="file" id="upload"><label for="upload" class="file_upload"></label>
                    <span style="color:#999 ;"><br>* 650x500px 크기의 jpg.png</span>
                </div>


                </div>



                <div class="button">
             
                    <button class="c_make_button_cancle" type="reset">글쓰기 취소</button>
                    <button class="c_make_button_submit" type="submit">글 등록</button>
                </div>


            </form>

        </div>

    </div>
      </main>
      
    <%-- <%@ include file="include/footerTemplate.jsp" %> --%> <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
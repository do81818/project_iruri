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
        <!-- 콘텐츠를 넣어주세요 -->
      </main>
      
    <%-- <%@ include file="include/footerTemplate.jsp" %> --%> <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
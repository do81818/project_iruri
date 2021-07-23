<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>이루리 메인</title>
    <link rel="stylesheet" href="${RESOURCES_PATH}/src/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous" defer></script>
    <script src="${RESOURCES_PATH}/src/js/bootstrap.bundle.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/headerHover.js" defer></script>
  </head>
<<<<<<< HEAD
<body>

<p>${user}</p>

<h1>${user.userNickname}</h1>
<h1>${user.userPhone}</h1>

  

=======
  <body>
  
<%--   <%@ include file="include/headerTemplate.jsp" %>
    <div class="iruri__wrapper">
      <h1>카카오 프로파일</h1>      
        <img class="profile_img" src="${user.kakao_account.profile.thumbnail_image_url}">
        <h2 class="profile_nickname">${user.kakao_account.profile.nickname}</h2>\
    </div>
    <%@ include file="include/footerTemplate.jsp" %> --%>
    
    

    
    
>>>>>>> d2caae091726b960e1ccc9f6cfe6a2d897896e53
</body>
</html>
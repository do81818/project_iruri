<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="include/static.jsp" %>
    <title>이루리 로그인</title>
    <script src="${RESOURCES_PATH}/src/js/loginPage.js" defer></script>
  </head>
  <body>
    <div class="iruri__wrapper">
    
    <%@ include file="include/headerTemplate.jsp" %>
      
      <main>
        <div class="login__wrap">
          <h3 class="login__title">로그인</h3>

          <c:url value="/login" var="loginUrl" />
          <form:form name="f" action="${loginUrl}" method="POST">
            <div class="login-email">
              <label for="email">이메일</label>
              <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요"/>
            </div>
      
            <div class="login-password">
              <label for="password">비밀번호</label>
              <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요"/>
            </div>
      
            <div class="login-remember">
              <input type="checkbox" id="auto-login" name="remember-me" />
              <label for="auto-login">
                <i class="iruri-check-no-icon"></i>
                자동 로그인
              </label>
      
              <input type="checkbox" id="remember-email" />
              <label for="remember-email">
                <i class="iruri-check-no-icon"></i>
                이메일 기억하기
              </label>
            </div>
      
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input class="login-submit" type="submit" value="로그인" />
          </form:form>
          
          <hr />
      
          <div class="social-login">
            <h4 class="social-login__title">간편한 로그인</h4>
            <a href="${kakaoUrl}">
              <i class="kakao-icon"></i>
              <span>카카오아이디로 로그인</span>
            </a>
            <a href="#">
              <i class="naver-icon"></i>
              <span>네이버아이디로 로그인</span>
            </a>
            <a href="#">
              <i class="google-icon"></i>
              <span>구글아이디로 로그인</span>
            </a>
          </div>
      
          <div class="login-find">
            <a href="">비밀번호 찾기</a> |
            <a href="${CONTEXT_PATH}/signUp"> 회원가입</a>
          </div>
        </div>
      </main>

    <%@ include file="include/footerTemplate.jsp" %>

    </div>
  </body>
</html>
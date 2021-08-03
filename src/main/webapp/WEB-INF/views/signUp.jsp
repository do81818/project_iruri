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
    <title>이루리 메인</title>
    <script src="${RESOURCES_PATH}/src/js/signUpPage.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_radio_check.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
  </head>
  <body>
    <div class="iruri__wrapper">
    <%@ include file="include/headerTemplate.jsp" %>
      
      <main class="iruri__signUp">
        <c:url value="/signUp/submit" var="signUpUrl" />
        <form:form name="iUserSignUp" action="${signUpUrl}" method="POST" class="signUp__wrap" accept-charset="UTF-8">
          <input type="hidden" name="kakaoId" value="${sessionScope.kakaoId}">
          <input type="hidden" name="naverId" value="${sessionScope.naverId}">
          <input type="hidden" name="googleId" value="${sessionScope.googleId}">
        
          <h3 class="signUp__title">회원 가입</h3>
          <div class="signUp__emailForm">
            <label for="userEmail1">email</label>
            <input type="text" id="userEmail1" autocomplete="off" />
            <span>@</span>
            <input type="text" id="userEmail2" autocomplete="off" />
            <input type="text" id="userEmail" name="userEmail" />
            <select class="email__select">
              <option value="">직접 입력하기</option>
              <option value="naver.com">naver.com</option>
              <option value="hanmail.com">hanmail.com</option>
              <option value="gmail.com">gmail.com</option>
            </select>
            <div class="validateCheck"></div>
          </div>
          
          <div class="signUp__emailAuthBtn">
            <input type="text" id="emailAuthKey">
            <input type="button" class="authBtn" value="인증하기">
            <span id="emailTimer"></span>
          </div>

          <div class="signUp__passwordForm">
            <label for="userPw">비밀번호</label>
            <input type="password" id="userPw" name="userPw" placeholder="8~16자리의 영문 대소문자, 숫자 및 특수문자 사용" autocomplete="off" />
            <div class="validateCheck"></div>
          </div>

          <div class="signUp__passwordCheckForm">
            <label for="userPasswordCheck">비밀번호 확인</label>
            <input type="password" id="userPasswordCheck" name="userPwCheck" autocomplete="off"/>
            <div class="validateCheck"></div>
          </div>

          <div class="signUp__nicknameForm">
            <label for="userNickname">닉네임</label>
            <input type="text" id="userNickname" name="userNickname" placeholder="10자 이내 한글, 영문 대소문자, 숫자 사용" autocomplete="off" />
            <div class="validateCheck"></div>
          </div>
          
          <div class="signUp__phoneForm">
            <label for="userPhone">전화번호</label>
            <input type="text" id="userPhone" name="userPhone" placeholder="'-'을 제외한 숫자만 입력" autocomplete="off" />
            <div class="validateCheck"></div>
          </div>

          <div class="signUp__terms">
            <h4>이용약관</h4>
            <textarea disabled></textarea>

            <div class="terms_agree">
              <input type="checkbox" id="terms_agree" name="agree"/>
              <label for="terms_agree">
                <i class="iruri-check-no-icon iruri-check-no-icon--signup"></i>
                <span>동의합니다</span>
              </label>
            </div>
          </div>

          <div>
            <input class="submitBtn" type="button" value="회원가입" />
          </div>
        </form:form>
        <a href="${CONTEXT_PATH}/" class="no__signUp">가입 취소</a>
      </main>
      
      <%@ include file="include/footerTemplate.jsp" %>
      
    </div>
    
    <div class="c_make_modal">
      <div class="c_make_modal_start">
          <div class="c_modal_close"><img class="signUp_modal_close" src="/ex/resources/src/img/icon/close.png" alt="" onclick=""></div>
          <h2 class="c_make_modal_title">필수 내용을 입력해주세요!</h2>
      </div>
      <div class="modal_layer"></div>
    </div>
  </body>
</html>

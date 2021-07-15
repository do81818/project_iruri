<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- 헤더 부분 -->
<header class="iruri__header">
  <div class="header__logo">
    <a href="${CONTEXT_PATH}/"><img src="${RESOURCES_PATH}/src/img/icon/irurilogo.png" alt="이루리 로고" /></a>
  </div>

  <nav class="header__gnb">
    <ul class="gnb__items">
      <li class="gnb__item">챌린지</li>
      <li class="gnb__item">이루리운동</li>
      <li class="gnb__item">커뮤니티</li>
      <li class="gnb__item">PT클래스</li>
    </ul>
  </nav>


  <div class="header__infoMenu">
    <!-- 비로그인 메뉴 -->
    <sec:authorize access="isAnonymous()">
      <div class="infoMenu-logout">
        <a class="infoMenu__item" id="searchMenu">
          <i class="iruri-search-icon"></i>
          <span>검색</span>
        </a>
        <a href="#" class="infoMenu__item">
          <i class="iruri-roulette-icon"></i>
          <span>출석룰렛</span>
        </a>
        <a href="${CONTEXT_PATH}/loginPage" class="infoMenu__item">
          <i class="iruri-login-icon"></i>
          <span>로그인</span>
        </a>
      </div>
    </sec:authorize>
    
    <!-- 로그인 메뉴 -->
    <sec:authorize access="isAuthenticated()">
      <form:form action="${CONTEXT_PATH}/logout" method="POST" class="infoMenu-login">
        <a href="#" class="infoMenu__item">
          <i class="iruri-search-icon"></i>
          <span>검색</span>
        </a>
        <a href="#" class="infoMenu__item">
          <i class="iruri-roulette-icon"></i>
          <span>출석룰렛</span>
        </a>
        <a href="#" class="infoMenu__item">
          <i class="iruri-mypage-icon"></i>
          <span>마이페이지</span>
        </a>
        <button class="infoMenu__item">
          <i class="iruri-logout-icon"></i>
          <span>로그아웃</span>
        </button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form:form>
    </sec:authorize>
  </div>
</header>
<div class="container search_window">
  <form:form action="${CONTEXT_PATH}" method="GET">
    <input class="search_area" placeholder="검색어를 입력하세요" />
    <button></button>
  </form:form>
</div>
<span class="gnbHoverTarget"></span>

<hr />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="include/static.jsp" %>
    <title>이루리 메인</title>
    <script src="${RESOURCES_PATH}/src/js/mainPage.js" defer></script>
  </head>
  <body>
    <div class="iruri__wrapper">
    
    <%@ include file="include/headerTemplate.jsp" %>
    
      <main class="iruri__mainPage">
        <article class="mainPage__banner">
          <div id="mainPage__banner__carousel" class="mainPage__banner__carousel carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-interval="3500">
              <a href="${CONTEXT_PATH}/iruri/ptClassList">
                <img src="${RESOURCES_PATH}/src/img/backgroundimg/main_slide_img1.jpg" class="d-block w-100" alt="배너이미지1" />
              </a>
              </div>
              <div class="carousel-item" data-interval="3500">
              <a href="${CONTEXT_PATH}/iruri/ptClassList">
                <img src="${RESOURCES_PATH}/src/img/backgroundimg/main_slide_img2.jpg" class="d-block w-100" alt="배너이미지2" />
              </div>
              <div class="carousel-item" data-interval="3500">
              <a href="${CONTEXT_PATH}/iruri/ptClassList">
                <img src="${RESOURCES_PATH}/src/img/backgroundimg/main_slide_img3.jpg" class="d-block w-100" alt="배너이미지3" />
              </a>
              </div>
            </div>
            <a class="carousel-control-prev" href="#mainPage__banner__carousel" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon banner" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#mainPage__banner__carousel" role="button" data-slide="next">
              <span class="carousel-control-next-icon banner" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </article>
      
        <article class="mainPage__challenge">
          <div class="challenge__info">
            <div class="challenge__title">
              <button id="challengePrev" class="challenge__btn prev"></button>
              <h3>챌린지</h3>
              <a href="#" class="title__plus"></a>
              <button id="challengeNext" class="challenge__btn next"></button>
            </div>
            <h4 class="challenge__subTitle">함께 하면 성공할 수 있어! 운동습관 만들기 챌린지!</h4>
          </div>
      
          <div class="challenge__wrap">
            <ul class="challenge__slides">
              <c:forEach var="challengeList" items="${challengeList}">
                <li class="cardConteiner">
                <div class="card__image">
                  <img src="/ex/iruri/display?fileName=${challengeList.classImage}" alt="이미지" />
                </div>
                <ul class="card__info">
                  <li class="info__title">
                    <h3>${challengeList.classTitle}</h3>
                  </li>
                  <li class="info__data">
                    <span class="data__term"><fmt:formatDate value="${challengeList.classStartDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${challengeList.classEndDate}" pattern="yyyy.MM.dd"/></span>
                    <div class="data__tags">
                      <div class="data__tag-blue">
                        <i class="iruri-level-icon"></i>
                        <span>${challengeList.classLevel}</span>
                      </div>
                      <div class="data__tag-blue">
                        <i class="iruri-time-icon"></i>
                        <span>${challengeList.classTime}분</span>
                      </div>
                    </div>
                  </li>
                  <li class="info__btn">
                    <a class="info__btn__join" href="${CONTEXT_PATH}/iruri/challengeJoinCheck?classId=${challengeList.classId}">
                      <span>참여하기</span>
                      <i class="iruri-arrow-yellow-icon"></i>
                    </a>
                  </li>
                </ul>
              </li>
              </c:forEach>
            </ul>
          </div>
        </article>
      
        <article class="mainPage__ptClass">
          <div class="ptClass__info">
            <div class="ptClass__title">
              <button id="ptClassPrev" class="ptClass__btn prev"></button>
              <h3>PT 클래스</h3>
              <a href="#" class="title__plus"></a>
              <button id="ptClassNext" class="ptClass__btn next"></button>
            </div>
            <h4 class="ptClass__subTitle">전문적인 트레이너와 함께 운동하기</h4>
          </div>
      
          <div class="ptClass__wrap">
            <ul class="ptClass__slides">
            
              <c:forEach var="ptClassList" items="${ptClassList}">
              <li class="cardConteiner">
                <div class="card__image">
                  <img src="/ex/iruri/display?fileName=${ptClassList.classImage}" alt="이미지" />
                </div>
                <ul class="card__info">
                  <li class="info__title">
                    <h4 class="info__title-trainer">트레이너 ${ptClassList.IUserVO.userNickname}</h4>
                    <h3>${ptClassList.classTitle}</h3>
                  </li>
                  <li class="info__data">
                    <span class="data__term"><fmt:formatDate value="${ptClassList.classStartDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ptClassList.classEndDate}" pattern="yyyy.MM.dd"/></span>
                    <div class="data__tags">
                      <div class="data__tag-blue">
                        <i class="iruri-level-icon"></i>
                        <span>${ptClassList.classLevel}</span>
                      </div>
                      <div class="data__tag-blue">
                        <i class="iruri-time-icon"></i>
                        <span>${ptClassList.classTime}분</span>
                      </div>
                    </div>
                    <div class="data__tags">
                      
                      <c:forEach var="ptExerciseKindList" items="${ptClassList.exerciseKindList}">
                      <div class="data__tag-red">${ptExerciseKindList.exerciseKind}</div>
                      </c:forEach>
                    </div>
                  </li>
                  <li class="info__btn">
                    <a class="info__btn__join" href="${CONTEXT_PATH}/iruri/ptClassDetails?classId=${ptClassList.classId}">
                      <span>참여하기</span>
                      <i class="iruri-arrow-yellow-icon"></i>
                    </a>
                  </li>
                </ul>
              </li>
              </c:forEach>
            </ul>
          </div>
        </article>
      </main>
      
      <%@ include file="include/footerTemplate.jsp" %>
      
    </div>
  </body>
</html>

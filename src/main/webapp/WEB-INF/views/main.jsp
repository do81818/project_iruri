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
                <img src="https://via.placeholder.com/1200x680" class="d-block w-100" alt="배너이미지1" />
              </div>
              <div class="carousel-item" data-interval="3500">
                <img src="https://via.placeholder.com/1200x680" class="d-block w-100" alt="배너이미지2" />
              </div>
              <div class="carousel-item" data-interval="3500">
                <img src="https://via.placeholder.com/1200x680" class="d-block w-100" alt="배너이미지3" />
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
            
              <li class="cardConteiner">
                <div class="card__image">
                  <img src="https://via.placeholder.com/356x270" alt="이미지" />
                </div>
                <ul class="card__info">
                  <li class="info__title">
                    <h3>러닝 전 5분 스트레칭 러닝 전 5분 스트레칭 러닝 전 5분 스트레칭 러닝 전 5분 스트레칭</h3>
                  </li>
                  <li class="info__data">
                    <span class="data__term">2021.03.01~2021.04.01</span>
                    <div class="data__tags">
                      <div class="data__tag-blue">
                        <i class="iruri-level-icon"></i>
                        <span>easy</span>
                      </div>
                      <div class="data__tag-blue">
                        <i class="iruri-time-icon"></i>
                        <span>50분</span>
                      </div>
                    </div>
                  </li>
                  <li class="info__btn">
                    <a class="info__btn__join">
                      <span>참여하기</span>
                      <i class="iruri-arrow-yellow-icon"></i>
                    </a>
                  </li>
                </ul>
              </li>
              
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
            <h4 class="ptClass__subTitle">함께 하면 성공할 수 있어! 운동습관 만들기 챌린지!</h4>
          </div>
      
          <div class="ptClass__wrap">
            <ul class="ptClass__slides">
            
              <li class="cardConteiner">
                <div class="card__image">
                  <img src="https://via.placeholder.com/356x270" alt="이미지" />
                </div>
                <ul class="card__info">
                  <li class="info__title">
                    <h4 class="info__title-trainer">트레이너 지오</h4>
                    <h3>몸치도 할 수 있는 복싱댄스!!</h3>
                  </li>
                  <li class="info__data">
                    <span class="data__term">2021.03.01~2021.04.01</span>
                    <div class="data__tags">
                      <div class="data__tag-blue">
                        <i class="iruri-level-icon"></i>
                        <span>easy</span>
                      </div>
                      <div class="data__tag-blue">
                        <i class="iruri-time-icon"></i>
                        <span>50분</span>
                      </div>
                    </div>
                    <div class="data__tags">
                      <div class="data__tag-red">댄스</div>
                      <div class="data__tag-red">피트니스</div>
                    </div>
                  </li>
                  <li class="info__btn">
                    <a class="info__btn__join">
                      <span>참여하기</span>
                      <i class="iruri-arrow-yellow-icon"></i>
                    </a>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>
        </article>
      
        <article class="mainPage__exerciseVideo">
          <div class="exerciseVideo__info">
            <div class="exerciseVideo__title">
              <button id="exerciseVideoPrev" class="exerciseVideo__btn prev"></button>
              <h3>운동영상</h3>
              <a href="#" class="title__plus"></a>
              <button id="exerciseVideoNext" class="exerciseVideo__btn next"></button>
            </div>
            <h4 class="exerciseVideo__subTitle">함께 하면 성공할 수 있어! 운동습관 만들기 챌린지!</h4>
          </div>
      
          <div class="exerciseVideo__wrap">
            <ul class="exerciseVideo__slides">
            
              <li class="cardConteiner">
                <div class="card__image">
                  <img src="https://via.placeholder.com/356x270" alt="이미지" />
                </div>
                <ul class="card__info">
                  <li class="info__title">
                    <h3>몸치도 할 수 있는 복싱댄스!!</h3>
                  </li>
                  <li class="info__data">
                    <div class="data__tags">
                      <div class="data__tag-red">전신</div>
                    </div>
                  </li>
                  <li class="info__btn">
                    <a class="info__btn__join">
                      <span>참여하기</span>
                      <i class="iruri-arrow-yellow-icon"></i>
                    </a>
                  </li>
                </ul>
              </li>
      
            </ul>
          </div>
        </article>
      </main>
      
      <%@ include file="include/footerTemplate.jsp" %>
      
    </div>
  </body>
</html>

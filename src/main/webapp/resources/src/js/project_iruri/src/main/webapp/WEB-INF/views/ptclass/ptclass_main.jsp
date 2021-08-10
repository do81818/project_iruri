<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp"%>
    <title>이루리 PT클래스 - 메인</title>
  </head>
  <body>
    <div class="iruri__wrapper">
      <%@ include file="../include/headerTemplate.jsp"%>

      <main>
        <div class="ptClassWrap">
          <h3 class="ptClassTitle">PT 클래스</h3>

          <div class="ptClassSuggest">
            <span class="suggestTitle">추천클래스</span>

            <div class="suggestWrap">
              <div class="suggestImg">
                <div class="suggestPtPerson">1 : 1</div>
                <div class="suggestMetaData">
                  <span>트레이너 지오</span>
                  <h5>스쿼트, 런지, 플랭크 30일 챌린지</h5>
                  <div class="suggestData">
                    <span>2021.03.01 ~ 2021.04.01</span>
                    <i class="iruri-heart-gray-icon"></i>
                  </div>
                </div>
              </div>

              <div class="suggestImg">
                <div class="suggestPtPerson">1 : 1</div>
                <div class="suggestMetaData">
                  <span>트레이너 지오</span>
                  <h5>러닝 전 5분 스트레칭</h5>
                  <div class="suggestData">
                    <span>2021.03.01 ~ 2021.04.01</span>
                    <i class="iruri-heart-gray-icon"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <ul class="ptClassNav">
            <li>
              <a href="#"> 전체 클래스 </a>
            </li>
            <li>
              <a href="#"> 구매한 클래스 </a>
            </li>
            <li>
              <a href="#"> 관심 클래스 </a>
            </li>
            <li>
              <a href="#"> 지난 클래스 </a>
            </li>
          </ul>

          <div class="ptClassFilter">
            <div>
              <span class="ptClassFilter-label">강사성별</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" class="iruri-check-no-icon" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>남성</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>여성</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동종류</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>헬스</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>필라테스</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>요가</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>바디프로필</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>댄스</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">가격대</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>10만원 이하</span></label
                >
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>20만원 이하</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>30만원 이하</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>30만원 이상</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동기간</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>1개월</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>2개월</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>3개월</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>3개월 이상</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동요일</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>월</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>화</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>수</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>목</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>금</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>토</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>일</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동강도</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>easy</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>normal</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>hard</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동인원</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 1</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 2</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 4</span>
                </label>
                <input type="checkbox" />
                <label for="">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 6</span>
                </label>
              </div>
            </div>
          </div>

          <!-- 나래님이 만드신 필터랑 챌린지 개설 버튼 -->
          <div class="ptClassSelect" id="select_wrap">
            <div id="select" class="select ptSelect">
              <div>
                <span>인기순</span>
                <i class="iruri-selectBox-arrow-icon"></i>
              </div>
              <ul id="ul" class="select_ul">
                <li data-value="value 1">인기순</li>
                <li data-value="value 2">시작일순</li>
                <li data-value="value 3">평점순</li>
              </ul>
            </div>

            <!--챌린지개설버튼-->
            <button class="c_make_button">챌린지개설</button>
          </div>

          <!-- 클래스 리스트 -->
          <div class="ptClassList">
            <div class="c_list_detail">
              <div class="c_list_img">
                <div class="ptListPerson">1:1</div>
                <img src="/ex/resources/src/img/icon/360-250.png" />
              </div>

              <div class="ptListSubTitle">트레이너 지오</div>
              <div class="c_list_title ptListTitle">스쿼트, 런지, 플랭크 <br />30일 챌린지30일 챌린지30일 챌린지</div>

              <div class="c_list_date">2021.03.01 ~ 2021.04.01</div>

              <div class="data__tags">
                <div class="data__tag-blue">
                  <i class="iruri-time-icon"></i>
                  <span>EASY</span>
                </div>

                <div class="data__tag-blue">
                  <i class="iruri-level-icon"></i>
                  <span>월수금/50분</span>
                </div>
              </div>
              <div class="data__tags">
                <div class="data__tag-red">댄스</div>
                <div class="data__tag-red">피트니스</div>
              </div>

              <div class="ptListBuyData">
                <div class="ptListPrice">\ 59,000</div>
                <i class="iruri-heart-gray-icon"></i>
              </div>
            </div>
          </div>
        </div>
      </main>

      <%@ include file="../include/footerTemplate.jsp"%>
    </div>
  </body>
</html>

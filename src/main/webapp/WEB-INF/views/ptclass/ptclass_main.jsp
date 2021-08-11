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
              <c:forEach var="recommend" items="${recommendList}">
                <div class="suggestImg" style="background: url(${CONTEXT_PATH}/iruri/display?fileName=${recommend.classImage}) no-repeat">
                  <div class="suggestPtPerson">1 : ${recommend.classTotalMember}</div>
                  <div class="suggestMetaData">
                    <span>트레이너 ${recommend.IUserVO.userNickname}</span>
                    <h5>${recommend.classTitle}</h5>
                    <div class="suggestData">
                      <span>${recommend.classStartDate} ~ ${recommend.classEndDate}</span>
                      <i class="iruri-heart-gray-icon"></i>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>

          <ul class="ptClassNav">
            <li>
              <a href="#" id="all" onclick="ajaxClassList(1, 'all')"> 전체 클래스 </a>
            </li>
            <li>
              <a href="#" id="buy" onclick="ajaxClassList(1, 'buy')"> 구매한 클래스 </a>
            </li>
            <li>
              <a href="#" id="interest" onclick="ajaxClassList(1, 'interest')"> 관심 클래스 </a>
            </li>
            <li>
              <a href="#" id="past" onclick="ajaxClassList(1, 'past')"> 지난 클래스 </a>
            </li>
          </ul>

          <script>
            const ptClassNavList = document.querySelectorAll(".ptClassNav a");
            ptClassNavList.forEach(item => {
              item.addEventListener("click", function (e) {
                e.preventDefault();
              });
            });
          </script>

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
          <div class="ptClassList"></div>

          <div class="page_nation"></div>

          <script>
            function ajaxClassList(page, type) {
              $.ajax({
                url: "${CONTEXT_PATH}/ajax/class",
                type: "GET",
                cache: false,
                dataType: "json",
                data: {
                  pageNum: page,
                  type: type,
                },
                success: function (result) {
                  console.log(result);

                  const list = result["list"];
                  const pagination = result["pageMaker"];
                  let listHtmls = "";
                  let pagingHtmls = "";

                  if (list.length < 1) {
                    alert("현재 등록된 챌린지가 없습니다.");
                  } else {
                    $(list).each(function () {
                      listHtmls +=
                        //
                        `<div class="c_list_detail">
                            <div class="c_list_img">
                              <div class="ptListPerson">1:${"${this.classTotalMember}"}</div>
                              <img src="${CONTEXT_PATH}/iruri/display?fileName=${"${this.classImage}"}" />
                            </div>

                            <div class="ptListSubTitle">트레이너 ${"${this.iuserVO.userNickname}"}</div>
                            <div class="c_list_title ptListTitle">${"${this.classTitle}"}</div>

                            <div class="c_list_date">${"${this.classStartDate}"} ~ ${"${this.classEndDate}"}</div>

                            <div class="data__tags">
                              
                              <div class="data__tag-blue">
                                <i class="iruri-time-icon"></i>
                                <span>${"${this.classLevel}"}</span>
                              </div>

                              <div class="data__tag-blue">
                                <i class="iruri-level-icon"></i>`;

                      let dateStr = "";
                      for (let date in this.exerciseDateList) {
                        dateStr += this.exerciseDateList[date].exerciseDate;
                      }

                      listHtmls += `<span>${"${dateStr}"}/${"${this.classTime}분"}</span>`;

                      listHtmls +=
                        //
                        `</div>
                            </div>
                            <div class="data__tags">`;

                      for (let kind in this.exerciseKindList) {
                        listHtmls += `<div class="data__tag-red">${"${this.exerciseKindList[kind].exerciseKind}"}</div>`;
                      }

                      listHtmls +=
                        //
                        `</div>

                            <div class="ptListBuyData">
                              <div class="ptListPrice">\ ${"${this.classPrice}"}</div>
                              <i class="iruri-heart-gray-icon"></i>
                            </div>
                          </div>`;
                    });

                    if (pagination["prev"]) {
                      pagingHtmls += '<a class="arrow prev" href="javascript:ajaxClassList(' + (pagination["startPage"] - 1) + "," + type + ')"></a>';
                    }
                    // 번호를 표시하는 부분
                    for (var idx = pagination["startPage"]; idx <= pagination["endPage"]; idx++) {
                      if (page !== idx) {
                        pagingHtmls += '<a class="pageNumLink" href="javascript:AllClass(' + idx + "," + type + ')">' + idx + "</a>";
                      } else {
                        pagingHtmls += '<a class="pageNumLink active" href="javascript:AllClass(' + idx + "," + type + ')">' + idx + "</a>";
                      }
                    }

                    if (pagination["next"]) {
                      pagingHtmls += '<a class="arrow next" href="javascript:AllClass(' + (pagination["endPage"] + 1) + "," + type + ')"></a>';
                    }
                  }

                  $(".ptClassList").html(listHtmls);
                  $(".page_nation").html(pagingHtmls);
                },
              });
            }

            $(document).ready(() => {
              ajaxClassList(1, "all");
            });
          </script>
        </div>
      </main>

      <%@ include file="../include/footerTemplate.jsp"%>
    </div>
  </body>
</html>

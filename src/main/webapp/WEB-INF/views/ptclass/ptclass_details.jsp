<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp"%>
    <title>이루리 PT클래스 - 상세보기</title>
  </head>
  <body>
    <div class="iruri__wrapper">
      <%@ include file="../include/headerTemplate.jsp"%>

      <main>
        <div class="ptClassDetailWrap">
          <article class="ptDetail__info"></article>

          <ul class="ptDetail__nav">
            <li>
              <a href="#trainerInfo">상세정보</a>
            </li>
            <li>
              <a href="#certify">인증하기</a>
            </li>
            <li>
              <a href="#reply">커뮤니티</a>
            </li>
            <span class="ptDetailNavHover"></span>
          </ul>

          <div class="ptDetail__infoDescription" id="trainerInfo">
            <h6>클래스소개</h6>
            <p>아침에 눈을 뜨면 지난밤이 궁금해</p>

            <h6>트레이너소개</h6>
            <p>아침에 눈을 뜨면 지난밤이 궁금해</p>
          </div>

          <div class="ptDetail__certify" id="certify"></div>

          <!-- 댓글 입력창 -->
          <div class="c_reply_insert" id="reply">
            <form class="c_reply_insertBox" action="">
              <textarea placeholder="글을 작성하세요."></textarea>
              <button>입력</button>
            </form>
          </div>

          <!--댓글리스트-->
          <div class="c_reply"></div>

          <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
          <div class="ptClassPaging"></div>
        </div>
      </main>

      <%@ include file="../include/footerTemplate.jsp"%>
    </div>
    <script>
      const classQuery = new URLSearchParams(location.search).get("classId");

      function detailsInfoAjax() {
        const ajaxOption = {
          url: "/ex/iruri/ptClassJoinCheck",
          type: "GET",
          cache: false,
          data: {
            classId: classQuery,
          },
          dataType: "json",
        };

        $.ajax(ajaxOption) //
          .then(result => {
            // 클래스 인포
            console.warn(result);
            const classVO = result["classVO"][0];
            const userVO = result["classVO"][0]["iuserVO"];

            let titleInfoHtml =
              //
              `<div class="ptDetail__img" style="background: url(/ex/iruri/display?fileName=${"${classVO.classImage}"})">
            <div class="ptDetail__person">1:${"${classVO.classTotalMember}"}</div>
              </div>
              <div class="ptDetail__infoData">
                <div class="infoData__subTitle">클래스</div>
                <h4 class="infoData__title">${"${classVO.classTitle}"}</h4>
                <h5 class="infoData__trainer">${"${userVO.userNickname}"} 트레이너</h5>
                <div class="infoData__count">
                  <i class="iruri_heart_icon"></i>
                  <span>${"${classVO.classLike}"}</span>
                </div>

                <div class="infoData__goal">${"${classVO.classGoal}"}</div>

                <dl class="infoData__detailData">
                  <div>
                    <dt>운동종류</dt>
                    <dd>`;

            const exerciseKindList = classVO.exerciseKindList;
            for (let i = 0; i < exerciseKindList.length; i++) {
              titleInfoHtml += exerciseKindList[i].exerciseKind;
              if (i < exerciseKindList.length - 1) titleInfoHtml += ", ";
            }

            titleInfoHtml +=
              //
              `</dd>
                  </div>
                  <div>
                    <dt>운동강도</dt>
                    <dd>${"${classVO.classLevel}"}</dd>
                  </div>
                  <div>
                    <dt>운동기간</dt>
                    <dd>${"${classVO.classStartDate}"}~${"${classVO.classEndDate}"}</dd>
                  </div>
                  <div>
                    <dt>월동요일</dt>
                    <dd>`;

            const exerciseDateList = classVO.exerciseDateList;
            for (let i = 0; i < exerciseDateList.length; i++) {
              titleInfoHtml += exerciseDateList[i].exerciseDate;
              if (i < exerciseDateList.length - 1) titleInfoHtml += ", ";
            }

            titleInfoHtml += `</dd>
                  </div>
                  <div>
                    <dt>운동시간</dt>
                    <dd>${"${classVO.classTime}"}분</dd>
                  </div>
                  <div>
                    <dt>참여인원</dt>
                    <dd>${"${result.classPerson}"} / ${"${classVO.classTotalMember}"}</dd>
                  </div>
                </dl>

                <div class="infoData__buyData">
                  <span class="buyData__price">${"${classVO.classPrice}"}</span>`;

            if (classVO.classTotalMember <= result.classPerson) {
              titleInfoHtml += `<button class="buyData__buyBtn" disabled>인원초과된 클래스입니다.</button>`;
            } else if (result.joinCheck === 1) {
              titleInfoHtml += `<button class="buyData__buyBtn" disabled>이미 참여한 클래스입니다.</button>`;
            } else if (result.joinCheck === 0) {
              titleInfoHtml += `<button class="buyData__buyBtn" onclick="requestPay()">구매하기</button>`;
            } else {
              titleInfoHtml += `<button class="buyData__buyBtn" disabled>지난 클래스입니다.</button>`;
            }

            titleInfoHtml += `</div>
              </div>`;

            const ptDetail__info = document.querySelector(".ptDetail__info");
            const ptDetail__infoDescription = document.querySelector(".ptDetail__infoDescription");

            ptDetail__info.innerHTML = titleInfoHtml;
            ptDetail__infoDescription.innerHTML = `<h6>클래스 소개</h6>
              <p>${"${classVO.classContent}"}</p>
              <h6>트레이너 소개</h6>
              <p>${"${classVO.classTrainerInfo}"}</p>`;

            return result;
          });
      } // detailsInfoAjax End

      function detailsCertifyAjax(page) {
        const ajaxOption = {
          url: "/ex/iruri/ptClassCertifyList",
          type: "GET",
          cache: false,
          data: {
            pageNum: page,
            classId: classQuery,
          },
          dataType: "json",
        };

        $.ajax(ajaxOption) //
          .then(result => {
            console.log("result", result);
            const list = result.list;
            const pageMaker = result.pageMaker;

            const total = pageMaker.total;

            certifyHtmls = `
              <div class="ptDetail__certifyContents">
                <div class="ptDetail_certify__total">총 ${"${total}"} 개</div>
                <div class="ptDetail_certify__images">`;

            for (let certify in list) {
              certifyHtmls += `
                <div class="images__image" onclick="certify_details_modal(${"${list[certify].boardId}"})">
                  <img src="/ex/iruri/display?fileName=${"${list[certify].boardFile}"}" />
                </div>
              `;
            }

            certifyHtmls += `</div>
              <div class="page_nation_certify">`;

            // 인증글 페이징
            if (pageMaker.prev) {
              certifyHtmls += '<a class="arrow prev" href="javascript:detailsCertifyAjax(' + (pageMaker.startPage - 1) + '"></a>';
            }

            for (var idx = pageMaker.startPage; idx <= pageMaker.endPage; idx++) {
              if (page !== idx) {
                certifyHtmls += '<a class="pageNumLink" href="javascript:detailsCertifyAjax(' + idx + ')">' + idx + "</a>";
              } else {
                certifyHtmls += '<a class="pageNumLink active" href="javascript:detailsCertifyAjax(' + idx + ')">' + idx + "</a>";
              }
            }

            if (pageMaker.next) {
              certifyHtmls += '<a class="arrow next" href="javascript:detailsCertifyAjax(' + (pagination["endPage"] + 1) + ')"></a>';
            }

            certifyHtmls += `
              </div>
              <button class="ptDetail_certify__btn">인증하기</button>
              </div>
            </div>
            `;

            const ptDetail__certify = document.querySelector(".ptDetail__certify");
            ptDetail__certify.innerHTML = certifyHtmls;
          });
      }

      function detailsReplyAjax(page) {
        const ajaxOption = {
          url: "/ex/iruri/ptClassReplyList",
          type: "GET",
          cache: false,
          data: {
            pageNum: page,
            classId: classQuery,
          },
          dataType: "json",
        };

        $.ajax(ajaxOption) //
          .then(result => {
            console.log("reply", result);
            const list = result.list;
            const pageMaker = result.pageMaker;

            let replyHtmls = `
              <div class="reply_count">총 ${"${pageMaker.total}"} 개</div>
              <table class="reply_table">
              
              `;
            for (let reply in list) {
              replyHtmls +=
                //
                `<tr>
                <td class="reply_nickname">${"${list[reply].iuserVO.userNickname}"}</td>
                <td>
                  <p class="reply_content">${"${list[reply].boardContent}"}</p>
                  <p class="reply_date">${"${list[reply].boardDate}"}</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>`;
            }

            replyHtmls += `</table>`;
            const c_reply = document.querySelector(".c_reply");
            c_reply.innerHTML = replyHtmls;

            let pagingHtmls = `<div class="page_nation">`;
            if (pageMaker.prev) {
              pagingHtmls += '<a class="arrow prev" href="javascript:detailsReplyAjax(' + (pageMaker.startPage - 1) + '"></a>';
            }

            for (var idx = pageMaker.startPage; idx <= pageMaker.endPage; idx++) {
              if (page !== idx) {
                pagingHtmls += '<a class="pageNumLink" href="javascript:detailsReplyAjax(' + idx + ')">' + idx + "</a>";
              } else {
                pagingHtmls += '<a class="pageNumLink active" href="javascript:detailsReplyAjax(' + idx + ')">' + idx + "</a>";
              }
            }

            if (pageMaker.next) {
              pagingHtmls += '<a class="arrow next" href="javascript:detailsReplyAjax(' + (pagination["endPage"] + 1) + ')"></a>';
            }

            pagingHtmls += `</div>`;

            const ptClassPaging = document.querySelector(".ptClassPaging");
            ptClassPaging.innerHTML = pagingHtmls;
          });
      }

      $(document).ready(function () {
        detailsInfoAjax();
        detailsCertifyAjax(1);
        detailsReplyAjax(1);
      });
    </script>

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <script>
      var IMP = window.IMP;
      IMP.init("imp50068834");

      function requestPay() {
        // 주문번호(merchant_uid) 미리 생성하기 (변질된 값과 비교를 위해서)

        IMP.request_pay(
          {
            name: "물마시기 챌린지",
            amount: 64900,
          },
          function (rsp) {
            if (rsp.success) {
              // 결제 성공시
              const header = $('meta[name="_csrf_header"]').attr("th:content");
              const token = $('meta[name="_csrf"]').attr("th:content");
              $.ajax({
                url: "/ex/iruri/ptClassBuy",
                type: "POST",
                beforeSend: function (xhr) {
                  xhr.setRequestHeader(header, token);
                },
                dataType: "json",
                data: {
                  imp_uid: rsp.imp_uid, // 결제 번호
                  merchant_uid: rsp.merchant_uid, // 주문번호 (IMP.request_pay 를 호출하기전에 DB에서 먼저 주문 레코드를 생성하며 해당 주문 번호를 merchant_uid 에 저장해야함)
                },
              }).done(function (data) {
                console.log("data", data);
                // 서버 api 성공시 로직
              });
            } else {
              console.log("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
          }
        );
      }
    </script>
  </body>
</html>

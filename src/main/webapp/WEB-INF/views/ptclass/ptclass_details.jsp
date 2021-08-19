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
            <li>
              <a href="#" onclick="runExercise()">운동하기</a>
            </li>
            <span class="ptDetailNavHover"></span>
          </ul>
          <script type="text/javascript">
          	function runExercise() {
          		window.open("https://192.168.0.38:8182/", 'a', "width=1000px, height=600px, status=no, menubar=no, toolbar=no, resizable=no, location=no");
          	}
          </script>

          <div class="ptDetail__infoDescription" id="trainerInfo">
            <h6>클래스소개</h6>
            <p>아침에 눈을 뜨면 지난밤이 궁금해</p>

            <h6>트레이너소개</h6>
            <p>아침에 눈을 뜨면 지난밤이 궁금해</p>
          </div>

          <div class="ptDetail__certify" id="certify"></div>

          <!-- 댓글 입력창 -->
          <div class="c_reply_insert" id="reply">
            <div class="c_reply_insertBox">
              <textarea placeholder="글을 작성하세요."></textarea>
              <button>입력</button>
            </div>
          </div>

          <script>
            document.querySelector(".c_reply_insert button").addEventListener("click", function () {
              const content = document.querySelector(".c_reply_insertBox textarea");
              const userId = '<sec:authentication property="principal.currentUser.userId"/>';

              console.log("classQuery", classQuery);
              console.log("boardContent", content);
              console.log("boardContent", content.value);
              console.log("userId", userId);
              $.ajax({
                url: "/ex/iruri/insertReply",
                type: "GET",
                cache: false,
                data: {
                  boardGroupId: classQuery,
                  boardContent: content.value,
                  userId: userId,
                },
                dataType: "json",
              })
              .always(function() {
            	  detailsReplyAjax(1);
              });
            });
          </script>

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
                <div class="images__image" data-boardId="${"${list[certify].boardId}"}">
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

            const ptDetail_certify__btn = document.querySelector(".ptDetail_certify__btn");
            console.log(ptDetail_certify__btn);
            ptDetail_certify__btn.addEventListener("click", function () {
              $("#pt_certify_modal").fadeIn();

              // 파일명 안내
              let inputFile = document.querySelector('input[name="uploadFile"]');
              console.log("inputFile", inputFile);
              inputFile.addEventListener("change", function () {
                let fileName = inputFile.files[0].name;
                console.log("fileName", fileName);
                inputFile.files[0].name = encodeURIComponent(inputFile.files[0].name);
                $(".uploadResult").html(fileName);
              });

              $(".pt_certify_modal_title + form").submit(function (e) {
                e.preventDefault();
              });

              var maxSize = 5242880;

              function checkExtension(fileSize) {
                if (fileSize >= maxSize) {
                  alert("파일 사이즈 초과");
                  return false;
                }
                return true;
              }

              $(".pt_certify_modal_submit").on("click", function (e) {
                const boardTitle = document.querySelector('input[name="boardTitle"]');
                const boardContent = document.querySelector('textarea[name="boardContent"]');

                const formData = new FormData();
                const inputFile = document.querySelector('input[name="uploadFile"]');
                const files = inputFile.files;

                if (!checkExtension(files[0].size)) {
                  return false;
                }

                formData.append("uploadFile", files[0]);
                formData.append("boardTitle", boardTitle.value);
                formData.append("boardContent", boardContent.value);
                formData.append("boardGroupId", classQuery);

                const header = $('meta[name="_csrf_header"]').attr("th:content");
                const token = $('meta[name="_csrf"]').attr("th:content");
                $.ajax({
                  url: "${CONTEXT_PATH}/iruri/ptClassUpload",
                  type: "POST",
                  beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                  },
                  processData: false,
                  contentType: false,
                  data: formData,
                  dataType: "json",
                  success: function (result) {
                    showUploadedFile(result);
                  },
                }).always(function() {
                	detailsCertifyAjax(1);
                	$("#pt_certify_modal").fadeOut();
                });
              });

              $(".pt_modal_close img").on("click", function () {
                $("#pt_certify_modal").fadeOut();
              });
            });

            const certifies = document.querySelectorAll(".images__image");
            certifies.forEach(certify => {
              const boardId = certify.dataset.boardid;

              certify.addEventListener("click", function () {
                certifyDetails(boardId);
              });
            });
          });
      }

      // certify Details 함수
      function certifyDetails(boardId) {
        $(".c_myCertify_modal").fadeIn();

        $.ajax({
          url: "/ex/iruri/getCertifySelectOne",
          type: "GET",
          cache: false,
          data: {
            boardId: boardId,
          },
          dataType: "json",
        }).then(result => {
          console.log("board", result);
          let htmls =
            //
            `
          <div class="c_myCertify_modal_start">
          <div>
            <div class="myCertify_img">
              <img src="/ex/iruri/display?fileName=${"${result.boardFile}"}" alt="" />
            </div>
            <div class="myCertify_myInfo"><span class="myCertify_date"> ${"${result.boardDate}"} </span> <span class="myCertify_nickname"> ${"${result.iuserVO.userNickname}"} </span></div>
            <div class="myCertify_title">${"${result.boardTitle}"}</div>
            <div class="myCertify_content">${"${result.boardContent}"}</div>

            <div class="modal_button">
              <button class="c_myCertify_modal_submit2 ptModifyBtn">수정</button>
              <button class="c_myCertify_modal_submit2">삭제</button>
              <button class="c_myCertify_modal_submit">확인</button>
            </div>
          </div>
        </div>

        <div class="modal_layer"></div>
        `;

          $(".c_myCertify_modal").html(htmls);

          $(".c_myCertify_modal_submit").on("click", function () {
            $(".c_myCertify_modal").fadeOut();
          });

          $(".ptModifyBtn").on("click", function () {
            $(".c_myCertify_modal").hide();
            $("#pt_certify_modal").show();

            let modifyHtmls = ``;
          });
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

    <!--인증하기 모달창-->
    <div id="pt_certify_modal">
      <div class="pt_certify_modal_start">
        <div class="pt_modal_close">
          <img src="/ex/resources/src/img/icon/close.png" alt="" />
        </div>
        <h2 class="pt_certify_modal_title">인증글 작성</h2>
        <form action="#">
          <ul class="pt_certify_modal_ul">
            <li>- 인증글 작성 시 포인트가 누적됩니다.</li>
            <li>- 누적된 포인트는 챌린지 종료 후 3일 이내 자동 적립됩니다.</li>
            <li>- 챌린지 종료 전에 인증글을 삭제하면 누적된 포인트가 회수됩니다.</li>
            <li>- 챌린지가 종료되기 전까지는 수정 및 삭제가 가능합니다.</li>
          </ul>
          <div class="pt_certify_name">
            <p>제목</p>
            <input type="text" class="inputbox_cetify1" name="boardTitle" />
          </div>

          <div class="pt_certify_content">
            <p>내용</p>
            <textarea cols="30" rows="50" class="inputbox_certify2" name="boardContent"></textarea>
          </div>

          <div class="pt_certify_img_button">
            <p>사진첨부</p>
            <input type="file" name="uploadFile" accept=".jpg, .png" id="certify_upload" /><label for="certify_upload" class="pt_certify_file_upload"></label> <span style="color: #999">* 650x500px 크기의 jpg.png</span>

            <div class="uploadResult"></div>
          </div>

          <div class="modal_button">
            <button class="pt_certify_modal_submit" type="submit">인증글 올리기</button>
          </div>
        </form>
      </div>
      <div class="modal_layer"></div>
    </div>

    <!--내 인증글 모달창-->
    <div class="c_myCertify_modal"></div>

    <!-- 결제모듈 -->
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

    <script>
      var IMP = window.IMP;
      IMP.init("imp50068834");

      function requestPay() {
        // DB에 주문번호(merchant_uid) 미리 생성하기 (변질된 값과 비교를 위해서)
        const userId = '<sec:authentication property="principal.currentUser.userId"/>';
        console.log("classQuery", classQuery);
        const infoData__title = document.querySelector(".infoData__title").innerText;
        const buyData__price = document.querySelector(".buyData__price").innerText;

        $.ajax({
          url: "/ex/iruri/getBuyId",
          type: "GET",
          dataType: "json",
          cache: false,
          data: {
            userId: userId,
            classId: classQuery,
            buyRealPay: buyData__price,
          },
        }) //
          .then(result => {
            console.log("result", result);
            IMP.request_pay(
              {
                name: infoData__title,
                amount: buyData__price,
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
                      merchant_uid: result, // 주문번호
                      buyId: parseInt(result),
                    },
                  }).done(function (data) {
                    console.log("data", data);
                    if (data === "success") {
                      location.reload(true);
                    }
                  });
                } else {
                  console.log("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                }
              }
            );
          });
      }
    </script>
  </body>
</html>

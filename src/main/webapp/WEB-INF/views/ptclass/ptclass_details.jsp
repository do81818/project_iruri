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
          <div class="c_reply">
            <div class="reply_count">총 77 개</div>
            <table class="reply_table">
              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo
                    excepturi.
                  </p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_modify">수정</button> <button class="reply_complain">신고</button></td>
              </tr>

              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo
                    excepturi.
                  </p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>

              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo
                    excepturi.
                  </p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>

              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo
                    excepturi.
                  </p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>

              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo
                    excepturi.
                  </p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>

              <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                  <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate explicabo excepturi.</p>
                  <p class="reply_date">2021.07.03</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
              </tr>
            </table>
          </div>

          <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
          <div class="page_nation">
            <a class="arrow prev" href="#"></a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
            <a class="arrow next" href="#"></a>
          </div>

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
          <div class="c_myCertify_modal">
            <div class="c_myCertify_modal_start">
              <form action="#">
                <div class="myCertify_img">
                  <img src="/ex/resources/src/img/icon/616-300.png" alt="" />
                </div>
                <div class="myCertify_myInfo"><span class="myCertify_date"> 2021.07.04 </span> <span class="myCertify_nickname"> 닉네임 </span></div>
                <div class="myCertify_title">제목입니다</div>
                <div class="myCertify_content">아침에 눈을 뜨면 개운한 느낌 보다는 늘 피곤한 상태로 맞이하는 경우가 많아요~ 그렇게 하루가 흘러가면 그 피로함이 밤까지 쌓여서 만성 피로가 될 수 있어요!</div>

                <div class="modal_button">
                  <button class="c_myCertify_modal_submit2" type="submit">수정</button>
                  <button class="c_myCertify_modal_submit2" type="submit">삭제</button>
                  <button class="c_myCertify_modal_submit" type="submit">확인</button>
                </div>
              </form>
            </div>

            <div class="modal_layer"></div>
          </div>

          <!--댓글 신고 모달-->
          <div class="c_complain_modal">
            <div class="c_complain_modal_start">
              <h4 class="c_complain_modal_title">신고사유 선택</h4>
              <form action="#">
                <ul class="c_complain_modal_ul">
                  <li><input type="radio" name="c_complain" id="complain1" /><label for="complain1" class="c_complain_modal_label" onclick="radio_click(this)"> 욕설, 비방, 차별, 혐오 </label></li>

                  <li><input type="radio" name="c_complain" id="complain2" /><label for="complain2" class="c_complain_modal_label" onclick="radio_click(this)"> 홍보, 영리목적 </label></li>

                  <li><input type="radio" name="c_complain" id="complain3" /><label for="complain3" class="c_complain_modal_label" onclick="radio_click(this)"> 음란, 청소년 유해 </label></li>

                  <li><input type="radio" name="c_complain" id="complain4" /><label for="complain4" class="c_complain_modal_label" onclick="radio_click(this)"> 도배, 스팸 </label></li>
                </ul>

                <div class="modal_button">
                  <button class="c_complain_modal_cancle" type="reset" onclick="radio_cancle_click(this)">취소</button>
                  <button class="c_complain_modal_submit" type="submit" disabled="disabled">신고하기</button>
                </div>
              </form>
            </div>
            <div class="modal_layer"></div>
          </div>

          <!-- 댓글 수정 확인 모달 -->
          <div class="reply_modify_modal">
            <div class="reply_modify_modal_start">
              <h4 class="reply_modify_modal_title">댓글 수정</h4>
              <form action="#">
                <div class="reply_modify_content">
                  <textarea cols="30" rows="50" class="inputbox_certify2"></textarea>
                </div>

                <div class="modal_button">
                  <button class="reply_modify_modal_cancle" type="reset">취소</button>
                  <button class="reply_modify_modal_submit" type="submit">등록하기</button>
                </div>
              </form>
            </div>
            <div class="modal_layer"></div>
          </div>
        </div>
      </main>

      <%@ include file="../include/footerTemplate.jsp"%>
    </div>
    <script>
      // 1 이미 참여한 클래스
      // 0 참여 가능한 클래스
      // -1 참여 불가능한 클래스
      function detailsAjax(cPageNum, rPageNum) {
        const classQuery = new URLSearchParams(location.search).get("classId");
        $.ajax({
          url: "/ex/iruri/ptClassJoinCheck",
          type: "GET",
          cache: false,
          data: {
            classId: classQuery,
            cPageNum: cPageNum,
            rPageNum: rPageNum,
          },
          dataType: "json",
          success: function (result) {
            const classVO = result["classVO"][0];
            const userVO = result["classVO"][0]["iuserVO"];

            let titleInfoHtml = `<div class="ptDetail__img" style="background: url(/ex/iruri/display?fileName=${"${classVO.classImage}"})">
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
              titleInfoHtml += `<button class="buyData__buyBtn">구매하기</button>`;
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

            // 인증글
            const total = result.certifyCri.total;
            const certifyList = result.certifyList;
            certifyHtmls = `
              <div class="ptDetail__certifyContents">
              <div class="ptDetail_certify__total">총 ${"${total}"} 개</div>
              <div class="ptDetail_certify__images">`;

            for (let list in certifyList) {
              certifyHtmls += `
                <div class="images__image" onclick="certify_details_modal(${"${list.boardId}"})">
                  <img src="/ex/resources/src/img/icon/${"${list.boardFile}"}" />
                </div>
              `;
            }

            // 인증글 페이징 // 보드 페이지넘 추가
            const cPagination = result.certifyCri;
            if (cPagination.prev) {
              certifyHtmls += '<a class="arrow prev" href="javascript:detailsAjax(' + (cPagination["startPage"] - 1) + "," + rPageNum + '"></a>';
            }

            for (var idx = cPagination["startPage"]; idx <= cPagination["endPage"]; idx++) {
              if (cPageNum !== idx) {
                certifyHtmls += '<a class="pageNumLink" href="javascript:detailsAjax(' + idx + "," + rPageNum + ')">' + idx + "</a>";
              } else {
                certifyHtmls += '<a class="pageNumLink active" href="javascript:detailsAjax(' + idx + "," + rPageNum + ')">' + idx + "</a>";
              }
            }

            if (cPagination.next) {
              certifyHtmls += '<a class="arrow next" href="javascript:detailsAjax(' + (pagination["endPage"] + 1) + "," + rPageNum + ')"></a>';
            }

            certifyHtmls += `
            </div>
            <button class="ptDetail_certify__btn">인증하기</button>
              </div>
            `;

            const ptDetail__certify = document.querySelector(".ptDetail__certify");
            ptDetail__certify.innerHTML = certifyHtmls;

            const ptDetail_certify__btn = $(".ptDetail_certify__btn");
            ptDetail_certify__btn.on("click", function () {
              const pt_certify_modal = $("#pt_certify_modal");
              pt_certify_modal.fadeIn();
            });

            const closeIcon = document.querySelector("#pt_certify_modal .pt_modal_close img");
            closeIcon.addEventListener("click", function () {
              const pt_certify_modal = $("#pt_certify_modal");
              pt_certify_modal.fadeOut();
            });

            var inputFile = document.querySelector('input[name="uploadFile"]');
            $(inputFile).on("change", function () {
              var fileName = inputFile.files[0].name;
              inputFile.files[0].name = encodeURIComponent(inputFile.files[0].name);
              $(".uploadResult").html(fileName);
            });

            $("#pt_certify_modal form").submit(function (e) {
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
              top.window.location.reload(true);

              var boardTitle = document.querySelector('input[name="boardTitle"]');
              var boardContent = document.querySelector('textarea[name="boardContent"]');

              var formData = new FormData();
              var inputFile = document.querySelector('input[name="uploadFile"]');
              var files = inputFile.files;

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
                url: "${CONTEXT_PATH}/ptClassUpload",
                type: "POST",
                beforeSend: function (xhr) {
                  xhr.setRequestHeader(header, token);
                },
                processData: false,
                contentType: false,
                data: formData,
                dataType: "json",
              });

              window.opener.parent.location.reload(); // 부모창 새로고침
              window.self.close(); // 현재 팝업 닫기
            });
          },
        });
      }

      $(document).ready(function () {
        detailsAjax(1, 1);
      });
    </script>
  </body>
</html>

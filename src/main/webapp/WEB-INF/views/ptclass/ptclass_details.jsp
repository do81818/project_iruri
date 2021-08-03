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
          <article class="ptDetail__info">
            <div class="ptDetail__img">
              <div class="ptDetail__person">1:1</div>
            </div>
            <div class="ptDetail__infoData">
              <div class="infoData__subTitle">클래스</div>
              <h4 class="infoData__title">스쿼트, 런지, 플랭크 30일 챌린지 클래스</h4>
              <h5 class="infoData__trainer">공공 트레이너</h5>
              <div class="infoData__count">
                <i class="iruri_heart_icon"></i>
                <span>006</span>
              </div>

              <div class="infoData__goal"></div>

              <dl class="infoData__detailData">
                <div>
                  <dt>운동종류</dt>
                  <dd>헬스</dd>
                </div>
                <div>
                  <dt>운동강도</dt>
                  <dd>EASY</dd>
                </div>
                <div>
                  <dt>운동기간</dt>
                  <dd>2021.03.01~2021.04.01</dd>
                </div>
                <div>
                  <dt>월동요일</dt>
                  <dd>월수금</dd>
                </div>
                <div>
                  <dt>운동시간</dt>
                  <dd>50분</dd>
                </div>
                <div>
                  <dt>참여인원</dt>
                  <dd>00 / 20</dd>
                </div>
              </dl>

              <div class="infoData__buyData">
                <span class="buyData__price">\150,000</span>
                <button class="buyData__buyBtn">구매하기</button>
              </div>
            </div>
          </article>

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
            <h6>트레이너소개</h6>
            <p>아침에 눈을 뜨면 지난밤이 궁금해</p>
          </div>

          <div class="ptDetail__certify" id="certify">
            <div class="ptDetail_certify__total">총 77 개</div>
            <div class="ptDetail_certify__images">
              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>

              <div class="images__image">
                <img src="/ex/resources/src/img/icon/270-270.png" />
              </div>
            </div>

            <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
            <div class="page_nation_certify">
              <a class="arrow prev" href="#"></a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
              <a class="arrow next" href="#"></a>
            </div>

            <div class="c_certify_button_div">
              <button class="c_certify_button">인증하기</button>
            </div>
          </div>

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
          <div id="c_certify_modal">
            <div class="c_certify_modal_start">
              <div class="c_modal_close">
                <img src="/ex/resources/src/img/icon/close.png" alt="" />
              </div>
              <h2 class="c_certify_modal_title">인증글 작성</h2>
              <form action="#">
                <ul class="c_certify_modal_ul">
                  <li>- 인증글 작성 시 포인트가 누적됩니다.</li>
                  <li>- 누적된 포인트는 챌린지 종료 후 3일 이내 자동 적립됩니다.</li>
                  <li>- 챌린지 종료 전에 인증글을 삭제하면 누적된 포인트가 회수됩니다.</li>
                  <li>- 챌린지가 종료되기 전까지는 수정 및 삭제가 가능합니다.</li>
                </ul>
                <div class="c_certify_name">
                  <p>제목</p>
                  <input type="text" class="inputbox_cetify1" />
                </div>

                <div class="c_certify_content">
                  <p>내용</p>
                  <textarea cols="30" rows="50" class="inputbox_certify2"></textarea>
                </div>

                <div class="c_certify_img">
                  <p>사진첨부</p>
                  <input type="file" accept=".jpg, .png" id="certify_upload" /><label for="certify_upload" class="certify_file_upload"></label> <span style="color: #999">* 650x500px 크기의 jpg.png</span>
                </div>

                <div class="modal_button">
                  <button class="c_certify_modal_submit" type="submit">인증글 올리기</button>
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
  </body>
</html>

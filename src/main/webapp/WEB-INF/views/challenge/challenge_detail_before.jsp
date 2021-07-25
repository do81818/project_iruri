<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp" %> <!-- 경로를 확인해 주세요 -->
    <title>챌린지 상세(참여 전)</title> <!-- 페이지 이름을 적어주세요 -->
    <script src="${RESOURCES_PATH}/src/js/challenge/c_menu_hover.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_sticky.js" defer></script>
  </head>
  <body>
    <div class="iruri__wrapper">

    <%@ include file="../include/headerTemplate.jsp" %> <!-- 경로를 확인해 주세요 -->

      <main>
         <div class="c_container">

        <!--챌린지상세-->
        <article class="c_detail_main">
            <!--챌린지 상세 대표이미지-->
            <div class="c_detail_start">

                <div class="c_detail_img">
                </div>

                <!--오른쪽 위 정보-->
                <div class="c_detail_info1">
                    <div class="c_mini_subject">
                        챌린지
                    </div>
                    <div class="c_subject">
                        스쿼트, 런지, 플랭크 30일 챌린지
                    </div>
                    <div class="c_heart_count">
                        <i class="iruri_heart_icon"></i> 001
                    </div>

                    <div class="c_detail_goal">
                        하체부종, 힙업, 종아리알, 하체비만<br> 다리 관리의 모든 것
                    </div>
                </div>

                <!--오른쪽 아래 정보-->
                <div class="c_detail_info2">
                    <div class="info_ul">
                        <ul>
                          
                            <li class="c_mini_info1">운동강도</li>
                            <li class="c_mini_info1">운동기간</li>
                            <li class="c_mini_info1">운동횟수</li>
                            <li class="c_mini_info1">참여인원</li>
                            <li class="c_mini_info1">개설자</li>
                        </ul>
                    </div>

                    <div class="info_ul">
                        <ul>
                     
                            <li class="c_mini_info2">EASY</li>
                            <li class="c_mini_info2">2021.03.01~2021.04.01</li>
                            <li class="c_mini_info2">주 3일</li>
                            <li class="c_mini_info2">00 / 20</li>
                            <li class="c_mini_info2">루리</li>
                        </ul>
                    </div>

                    <div class="c_join_button_div">
                        <button class="c_join_button">챌린지 참여하기</button>
                    </div>


                    <!--챌린지 참여 누르고 확인 나오는 모달창-->
                    <div id="c_parti_modal">
                        <div class="c_parti_modal_start">
                            <div class="c_parti_modal_content">
                                <form action="#" class="c_parti_modal_form">
                                    <ul>
                                        <li>챌린지에 참여 하시겠습니까?</li>
                                        <li>챌린지 시작일 전 까지만 취소가 가능합니다.</li>
                                        <li>챌린지 시작일 후에는 취소하실 수 없습니다.</li>

                                    </ul>



                                    <div class="c_parti_modal_button">

                                        <button class="c_parti_modal_cancle" type="reset">취소</button>
                                        <button class="c_parti_modal_submit" type="submit">참여</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal_layer"></div>
                    </div>
                </div>
            </div>

        </article>



    </div>


    <!--상세정보, 인증하기, 커뮤니티 메뉴바-->


    <nav class="c_menu">
				<ul>
					<li><a href="#info">상세정보</a></li>
					<li><a href="#certify">인증하기</a></li>
					<li><a href="#reply">커뮤니티</a></li>
				</ul>

			</nav>

    <!--밑줄 효과-->
    <span class="c_menu_hover"></span>





    <!--챌린지 상세 정보-->
    <div class="c_detail_maininfo" id="info">


        <div class="c_main_info">

            아침에 눈을 뜨면 개운한 느낌 보다는 늘 피곤한 상태로 맞이하는 경우가 많아요~ 그렇게 하루가 흘러가면 그 피로함이 밤까지 쌓여서 만성 피로가 될 수 있어요!
            <br><br> 모닝 필라테스 수업은 잠을 자는 동안 굳어있는 척추와 관절들을 부드러운 움직임으로 깨워주고, 천천히 호흡과 몸의 움직임을 이어주기 때문에 아침을 좋은 컨디션으로 시작할 수 있는 활력을 넣어줍니다.
            <br><br> 아침에 눈을 뜨면 개운한 느낌 보다는 늘 피곤한 상태로 맞이하는 경우가 많아요~ 그렇게 하루가 흘러가면 그 피로함이 밤까지 쌓여서 만성 피로가 될 수 있어요!
            <br><br> 모닝 필라테스 수업은 잠을 자는 동안 굳어있는 척추와 관절들을 부드러운 움직임으로 깨워주고, 천천히 호흡과 몸의 움직임을 이어주기 때문에 아침을 좋은 컨디션으로 시작할 수 있는 활력을 넣어줍니다. 아침에 눈을 뜨면 개운한 느낌 보다는 늘 피곤한 상태로 맞이하는 경우가 많아요~ 그렇게 하루가 흘러가면 그 피로함이 밤까지 쌓여서 만성 피로가 될 수 있어요!
            <br><br> 모닝 필라테스 수업은 잠을 자는 동안 굳어있는 척추와 관절들을 부드러운 움직임으로 깨워주고, 천천히 호흡과 몸의 움직임을 이어주기 때문에 아침을 좋은 컨디션으로 시작할 수 있는 활력을 넣어줍니다.

        </div>
    </div>


    <!--인증사진 리스트-->
    <div class="c_certify" id="certify">
        <div class="c_container">
            <div class="c_certify_total">
                총 77 개
            </div>


            <div class="c_certify_img_list">
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
                <div class="c_certify_img">
                    <img src="/ex/resources/src/img/icon/270-270.png" alt="">
                </div>
            </div>

        </div>

        <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
        <div class="page_nation_certify">
            <a class="arrow prev" href="#"></a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a class="arrow next" href="#"></a>
        </div>


    </div>



    </div>
    <!--댓글리스트-->
    <div class="c_before_reply" id="reply">



        <div class="reply_count">총 77 개</div>
        <table class="reply_table">
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>

            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>

            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>

            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum consequatur explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>

            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate explicabo excepturi.</p>
                    <p class="reply_date">2021.07.03</p>
                </td>

            </tr>

        </table>
    </div>

    <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
    <div class="page_nation">
        <a class="arrow prev" href="#"></a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a class="arrow next" href="#"></a>
    </div>




      </main>
      
    <%@ include file="../include/footerTemplate.jsp" %> <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
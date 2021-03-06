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
    <%@ include file="include/static.jsp" %> <!-- 경로를 확인해 주세요 -->
    <title>이루리 운동영상</title> <!-- 페이지 이름을 적어주세요 -->
    <script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_select.js" defer></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  	<script src="${RESOURCES_PATH}/src/js/challenge/c_radio_check.js" defer></script>
  	<script src="${RESOURCES_PATH}/src/js/stopwatch.js" defer></script>
  
  </head>
  <body>
    <div class="iruri__wrapper">

     <%@ include file="include/headerTemplate.jsp" %> <!-- 경로를 확인해 주세요 -->

      <main>
        
    <div class="ex_container">

        <div class="ex_category">
            이루리운동 > 운동영상
        </div>




        <!--운동영상-->
        <div class="ex_video">
            <div class="ex_video_img">
            </div>
            <div class="ex_title">
                제목입니다
            </div>
            <span class="ex_views">
                조회수 152,621회
            </span>
            <div class="ex_heart">
                <input type="checkbox" id="heart"><label for="heart" class="heart_label"></label>
            </div>
            <button class="ex_start_button">시작하기</button>
        </div>



        <!--운동시작하기 모달-->
        <div class="ex_start_modal">
            <div class="ex_video_start">
                <div class="alertWindow_close"><img src='../images/images/icon/close.png'> </div>

                <div class="ex_viedo_start_img"></div>

                <div class="ex_viedo_timer">
                    <div id="time" class="time">5</div>
                </div>
                <div class="btnBox">
                    <i id="startbtn" class="fa fa-play" aria-hidden="true"></i>
                    <i id="pausebtn" class="fa fa-pause" aria-hidden="true"></i>
                    <i id="stopbtn" class="fa fa-stop" aria-hidden="true"></i>
                </div>
            </div>
            <div class="modal_layer"></div>
        </div>







        <!-- 댓글 입력창 -->
        <form class="reply_insertBox" action="">
            <table>
                <tr>
                    <td class="reply_textarea"><textarea placeholder="글을 작성하세요."></textarea></td>
                    <td class="reply_insertButton"><button>입력</button></td>
                </tr>
            </table>
        </form>

        <table class="reply_table">
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_modify">수정</button><button class="reply_delete">삭제</button></td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button>감추기</button></td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>
            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>

            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>

            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>

            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>

            <tr>
                <td class="reply_nickname">닉네임</td>
                <td>
                    <p class="reply_content">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                </td>
                <td class="reply_button"><button class="reply_complain">신고</button></td>
            </tr>

        </table>



        <!--댓글 신고 모달-->
        <div class="c_complain_modal">
            <div class="c_complain_modal_start">
                <h4 class="c_complain_modal_title">신고사유 선택</h4>
                <form action="#">

                    <ul class="c_complain_modal_ul">
                        <li>
                            <input type="radio" name="c_complain" id="complain1"><label for="complain1" class="c_complain_modal_label" onclick="radio_click(this)">
                        욕설, 비방, 차별, 혐오
                    </label>
                        </li>

                        <li>
                            <input type="radio" name="c_complain" id="complain2"><label for="complain2" class="c_complain_modal_label" onclick="radio_click(this)">
                        홍보, 영리목적
                    </label>
                        </li>

                        <li>
                            <input type="radio" name="c_complain" id="complain3"><label for="complain3" class="c_complain_modal_label" onclick="radio_click(this)">
                    음란, 청소년 유해
                    </label>
                        </li>

                        <li>
                            <input type="radio" name="c_complain" id="complain4"><label for="complain4" class="c_complain_modal_label" onclick="radio_click(this)">
                        도배, 스팸
                     </label>
                        </li>

                    </ul>

                    <div class="modal_button">

                        <button class="c_complain_modal_cancle" type="reset" onclick="radio_cancle_click(this)">취소</button>
                        <button class="c_complain_modal_submit" type="submit" disabled="disabled">신고하기</button>
                    </div>
                </form>

            </div>
            <div class="modal_layer"></div>
        </div>

        <!-- 댓글 삭제 확인 모달 -->
        <div class="reply_delete_modal">
            <div class="reply_delete_modal_start">
                <h4 class="reply_delete_modal_title">댓글 삭제</h4>
                <form action="#">

                    <ul class="reply_delete_modal_ul">
                        <li>
                            해당 댓글을 정말로 삭제하시겠습니까?
                        </li>

                    </ul>

                    <div class="modal_button">

                        <button class="reply_delete_modal_cancle" type="reset">취소</button>
                        <button class="reply_delete_modal_submit" type="submit">댓글삭제</button>
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



        <!--페이징-->
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



    </div>
      </main>
      
    <%@ include file="include/footerTemplate.jsp" %> <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
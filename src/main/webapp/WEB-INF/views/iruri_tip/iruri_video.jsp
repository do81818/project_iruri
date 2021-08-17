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
  </head>
  <body>
    <div class="iruri__wrapper">

     <%@ include file="include/headerTemplate.jsp" %> <!-- 경로를 확인해 주세요 -->

      <main>
        
    <div class="ex_container">

        <div class="ex_category">
            이루리운동 > 운동영상
        </div>

        <div class="ex_text">
            추천운동
        </div>


        <!--추천챌린지 이미지 2개-->
        <div class="ex_recommend">
            <div class="ex_recommend_img">
                <div class="ex_recommend_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <span class="ex_recommend_date">
                    2021.03.01~2021.04.01
                </span>


                <div class="ex_heart">
                    <input type="checkbox" id="heart1"><label for="heart1" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_recommend_img">
                <div class="ex_recommend_title">
                    러닝 전 5분 스트레칭
                </div>


                <span class="ex_recommend_date">
                    2021.03.01~2021.04.01
                </span>


                <div class="ex_heart">
                    <input type="checkbox" id="heart2"><label for="heart2" class="heart_label"></label>
                </div>

            </div>
        </div>



        <div class="ex_main_tab">
            <p class="ex_like_last1">
                <a href="">전체</a>
                <a href="">상체</a>
                <a href="">하체</a>
                <a href="">전신</a>
            </p>
            <p class="ex_like_last2">
                <a href="">관심영상</a>
            </p>
        </div>





        <!--정렬(셀렉트박스)-->
        <div id="select_wrap">
            <div id="select" class="select">최신순</div>
            <ul id="ul" class="select_ul">

                <li data-value="value 1">최신순</li>
                <li data-value="value 2">조회수순</li>
                <li data-value="value 3">관심순</li>
            </ul>
        </div>












        <!--챌린지 리스트-->
        <div class="ex_list">
            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                    <div class="ex_mark">AI</div>
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart3"><label for="heart3" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart4"><label for="heart4" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart5"><label for="heart5" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart6"><label for="heart6" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart7"><label for="heart7" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart8"><label for="heart8" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart9"><label for="heart9" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart10"><label for="heart10" class="heart_label"></label>
                </div>
            </div>


            <div class="ex_list_detail">
                <div class="ex_list_img">
                    <img src="../images/images/icon/360-250.png" alt="">
                </div>
                <div class="ex_list_title">
                    스쿼트, 런지, 플랭크<br> 30일 챌린지
                </div>

                <div class="ex_list_date">
                    2021.03.01~2021.04.01
                </div>

                <div class="ex_list_person">
                    참여중인 인원 00명 (최대인원 20명)
                </div>

                <div class="ex_list_heart">
                    <input type="checkbox" id="heart11"><label for="heart11" class="heart_label"></label>
                </div>
            </div>

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
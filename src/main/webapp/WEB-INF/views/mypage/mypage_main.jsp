<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"  />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"  />
<!DOCTYPE html>
<html lang="ko">
  <head>
     <%@ include file="../include/static.jsp" %> 
    <title>마이페이지 메인</title> 
    <script src="${RESOURCES_PATH}/src/js/mypage_main.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/mypage_chart.js" defer></script>
  	
       <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  </head>
  <body>
    <div class="iruri__wrapper">

<%@ include file="../include/headerTemplate.jsp" %> <!-- 경로를 확인해 주세요 -->


	    <!-- 콘텐츠 -->
  <!-- 회원정보 -->
  <div class="container content">
    <div class="m_information_box">
      <div id = "m_userinformation_box">
        <div id="m_nickname">루리
        <button class ="m_information_change">정보수정</button>
        
      </div>
        <div id="m_useremail">일반회원<br>eeeee@naver.com</div>
        </div>
      <div id = "m_userboard_box">
        <div id="m_userboard"><a href="">작성글</a></div>
        <div id ="m_userboard_number">10</div>
      </div>
      <div id = "m_userpoint_box">
        <div id="m_userpoint"><a href="">보유포인트</a></div>
        <div id ="m_userpoint_number">4,500</div>
      </div>
      <div id = "m_userchanllenge_box">
        <div id="m_userchanllenge"><a href="">참여중인챌린지</a></div>
        <div id="m_userchanllenge_number">2</div>
      </div>
      <div id = "m_userclass_box">
        <div id="m_userclass"><a href=".">참여중인클래스</a></div>
        <div id="m_userclass_number">2</div>
      </div>
    </div>
         <p class="border1"></p>
         <!-- 신체정보 -->
        <div class="m_body_box">
          <div class="m_userbody_box">
            <div id="m_title">신체정보 보기
              <button class="m_update">업데이트</button>
              <ul>
                <li class="m_gender">성별 </li>
                <li class="m_gender">나이</li>
                <li class="m_gender">키 </li>
                <li class="m_gender">몸무게 </li>
              
                <li class="m_usergender">여자</li>
                <li class="m_usergender">26세</li>
                <li class="m_usergender">168.4</li>
                <li class="m_usergender">54kg</li>
              </ul>
            </div>
          </div>
          <div class="m_height_box">
            <ul>
              <li id="m_monthheight"><button id="addData">이번달체중변화</button></li>
              <li id="m_yearheight"><button id="addData1">올해체중변화</button></li>
                <!-- <a href="#">올해 체중변화</a></li>  -->
            </ul>
            <canvas id="myChart" width="350" height="160"></canvas>
          </div>

          <div class="m_bmi_box">
            <div id=m_bmi>비만도/BMI지수</div>
            <div id="m_bminumber">25</div>
            <div id="m_bmicontent">정상체중</div>
            <div  id="m_bmiimage">여기 사람몸뚱아리 이미지</div>

          </div>
        </div>
        <p class="border1"></p>
        
        <!-- 캘린더 부분 -->
        <div class="cal_top">
          <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
          <!-- <span id="cal_top_year"></span> -->
          <span id="cal_top_month"></span>
          <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
      </div>
      <div class="m_myschedule">일정보기</div>


        <div class="m_myschedule_ch">챌린지</div>
        <div class="m_myschedule_cl">클래스</div>


      <div id="cal_tab" class="cal">
      </div>
      


    </div>

	
	
	    <!-- 팝업창  -->
    <div class="modal"  max-width: 400px;
    min-width: 500px;
    margin: 0 auto;
    background-color: #eee;>
      <div class="modal_content" 
           title="클릭하면 창이 닫힙니다.">
           <div class="alertWindow">
            <div class="alertWindow_close"><img src='http://localhost:8282/ex/resources/src/img/icon/close.png' width="20px" height="20px" > </div>
            <div class="alertWindow_insert">
              <h2 class="alertWindow_title">정보수정</h2>
              <form action="#">
                <p>비밀번호</p>
                <input class="inputbox_size1" type="text"  />
                
                <p>비밀번호 확인</p>
                <input class="inputbox_size1" type="text" />
                
                <p>닉네임</p>
                <input class="inputbox_size2" type="text">
                <p>전화번호</p>
                <input class="inputbox_size2" type="text">
        
                <button class="alertWindow_submit" type="submit">비밀번호 변경</button>
              </form>
            </div>
          </div>
    </div>
  </div>


  <div class="modal1"  max-width: 400px;
  min-width: 500px;
  margin: 0 auto;
  background-color: #eee;>
    <div class="modal_content" 
         title="클릭하면 창이 닫힙니다.">
         <div class="alertWindow">
          <div class="alertWindow_close"><img src="http://localhost:8282/ex/resources/src/img/icon/close.png" width="20px" height="20px" > </div>
          <div class="alertWindow_insert">
            <h2 class="alertWindow_title">신체정보수정</h2>
            <form action="#">
              <p>성별</p>
              <input class="inputbox_size1" type="text"  />
              
              <p>나이</p>
              <input class="inputbox_size1" type="text" />
              
              <p>키</p>
              <input class="inputbox_size2" type="text">
              <p>몸무게</p>
              <input class="inputbox_size2" type="text">
      
              <button class="alertWindow_submit" type="submit">비밀번호 변경</button>
            </form>
          </div>
        </div>
  </div>
</div>
     
     <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
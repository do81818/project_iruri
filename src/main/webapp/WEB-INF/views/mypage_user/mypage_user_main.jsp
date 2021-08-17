<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
		prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<title>마이페이지 메인</title>
<script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/mypage_user_chart.js" defer></script>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
		<div class="iruri__wrapper">

				<%@ include file="../include/headerTemplate.jsp"%>
				<!-- 경로를 확인해 주세요 -->


				<!-- 콘텐츠 -->
				<!-- 회원정보 -->
				<div class="container content">
						<div class="m_information_box">
								<div id="m_userinformation_box">
										<div id="m_nickname">
												<p>${user.userNickname}</p>
												<button class="m_information_change">정보수정</button>

										</div>
										<div id="m_useremail">
												<c:if test="${user.authList[0].authContent eq 'ROLE_USER'}">
														<div>일반회원</div>
												</c:if>
												<c:if
														test="${user.authList[0].authContent eq 'ROLE_PAYUSER'}">
														<div>프리미엄 회원</div>
												</c:if>
												<br>${user.userEmail}</div>
								</div>
								<div id="m_userboard_box">
										<div id="m_userboard">
												<a href="/ex/mypage/boardlist">작성글</a>
										</div>
										<div id="m_userboard_number">${boardcount}</div>
								</div>
								<div id="m_userpoint_box">
										<div id="m_userpoint">
												<a href="/ex/mypage/pointlist">보유포인트</a>
										</div>
										<div id="m_userpoint_number">${totalpoint}</div>
								</div>
								<div id="m_userchanllenge_box">
										<div id="m_userchanllenge">
												<a href="/ex/mypage/challengelist">참여중인챌린지</a>
										</div>
										<div id="m_userchanllenge_number">${userchallengecount}</div>
								</div>
								<div id="m_userclass_box">
										<div id="m_userclass">
												<a href="/ex/mypage/classlist">참여중인클래스</a>
										</div>
										<div id="m_userclass_number">${userclasscount}</div>
								</div>
						</div>
						<p class="border1"></p>
						<!-- 신체정보 -->
						<div class="m_body_box">
								<div class="m_userbody_box">
										<div id="m_title">
												신체정보 보기
												<button class="m_update">업데이트</button>
												<ul>
														<li class="m_gender">성별</li>
														<li class="m_gender">나이</li>
														<li class="m_gender">키</li>
														<li class="m_gender">몸무게</li>

														<li class="m_usergender">${userinfo[0].userGender}</li>
														<li class="m_usergender">${userinfo[0].userBirth}</li>
														<li class="m_usergender">${userinfo[0].userHeight}cm</li>
														<li class="m_usergender">${userinfo[0].userWeight}kg</li>
												</ul>
										</div>
								</div>
								<div class="m_height_box">
										<ul>
												<li id="m_monthheight"><button id="addData">이번달체중변화</button></li>
												<li id="m_yearheight"><button id="addData1">올해체중변화</button></li>
												<!-- <a href="#">올해 체중변화</a></li>  -->
										</ul>
										<canvas id="myChart" width="280" height="140"></canvas>
								</div>

								<div class="m_bmi_box">
										<div id=m_bmi></div>
										<div id="m_bmititle">BMI 수치</div>
										<div id="m_bminumber">${userbmi}</div>
										<div id="m_bmiimage">
												<c:if test="${userbmi <18.5}">
														<div>당신은<Br>저체중 입니다</div>
												</c:if>
												<c:if test="${18.5 <userbmi || userbmi > 23}">
														<div>당신은 <br>정상체중 입니다</div>
												</c:if>
												<c:if test="${userbmi > 23}">
														<div>당신은<br>과체중 입니다.</div>
												</c:if>



										</div>
										<!-- <div id="m_bmiimage">여기 사람몸뚱아리 이미지</div> -->

								</div>

						</div>
						<p class="border1"></p>

						<!-- 캘린더 부분 -->
						<div class="cal_top">
								<a href="#" id="movePrevMonth"><span id="prevMonth"
										class="cal_tit">&lt;</span></a>
								<!-- <span id="cal_top_year"></span> -->
								<span id="cal_top_month"></span> <a href="#" id="moveNextMonth"><span
										id="nextMonth" class="cal_tit">&gt;</span></a>
						</div>
						<div class="m_myschedule">일정보기</div>


						<div class="m_myschedule_ch">챌린지</div>
						<div class="m_myschedule_cl">클래스</div>


						<div id="cal_tab" class="cal">
								<div></div>
						</div>



				</div>



				<!-- 팝업창  -->
				<div class="modal"max-width: 400px;
    min-width: 500px;
    margin: 0 auto;
    background-color:#eee;>
						<div class="modal_content" title="클릭하면 창이 닫힙니다.">
								<div class="alertWindow">
										<div class="alertWindow_close">
												<img
														src='http://localhost:8282/ex/resources/src/img/icon/close.png'
														width="20px" height="20px">
										</div>
										<div class="alertWindow_insert">
												<h2 class="alertWindow_title">정보수정</h2>
												<form action="update" method="GET">
														<p>비밀번호</p>
														<input class="inputbox_size1" name="userPw" type="text" placeholder="8~16자리의 영문 대소문자, 숫자 및 특수문자 사용" autocomplete="off"  />

														<p>비밀번호 확인</p>
														<input class="inputbox_size1" type="text" placeholder="8~16자리의 영문 대소문자, 숫자 및 특수문자 사용" autocomplete="off" />

														<p>닉네임</p>
														<input class="inputbox_size2" name="userNickname"
																type="text" autocomplete="off">
														<p>전화번호</p>
														<input class="inputbox_size2" name="userPhone" type="text" autocomplete="off">
														<button class="alertWindow_submit" type="submit">회원정보
																변경</button>
												</form>
										</div>
								</div>
						</div>
				</div>


				<div class="modal1"max-width: 400px;
  min-width: 500px;
  margin: 0 auto;
  background-color:#eee;>
						<div class="modal_content" title="클릭하면 창이 닫힙니다.">
								<div class="alertWindow">
										<div class="alertWindow_close">
												<img
														src="http://localhost:8282/ex/resources/src/img/icon/close.png"
														width="20px" height="20px">
										</div>
										<div class="alertWindow_insert">
												<h2 class="alertWindow_title">신체정보수정</h2>
												<form action="infoupdate" method="GET">
														<p>성별</p>
														<input class="inputbox_size1" name="userGender"
																type="text" placeholder="'여' 혹은 '남' " autocomplete="off"/>

														<p>나이</p>
														<input class="inputbox_size1" name="userBirth" type="text" placeholder="YYYY-MM-DD 형식으로 작성" autocomplete="off"/>

														<p>키</p>
														<input class="inputbox_size2" name="userHeight"
																type="text" autocomplete="off">
														<p>몸무게</p>
														<input class="inputbox_size2" name="userWeight"
																type="text" autocomplete="off">

														<button class="alertWindow_submit" type="submit">신체정보
																변경</button>
												</form>
										</div>
								</div>
						</div>
				</div>

				<%@ include file="../include/footerTemplate.jsp"%>
				<!-- 경로를 확인해 주세요 -->

		</div>
</body>


<!--  몸무게 변화 차트 -->
<script type="text/javascript">
//차트 설정 1번
var config1 = {
  type: 'line',
  data: {
    labels: [ '5일', '10일','15일','20일','30일'],
    datasets: [{
      label: 'Weight changed',
      data: [
    	  <c:forEach items="${usermonthweight}" var="item">
			"${item.userWeight}",
			</c:forEach>
    	 
      ],
      backgroundColor: [
        'rgba(239,239,239)',
        
      ],
      borderColor: [
        'rgba(24,90,219)',
        
      ],
      borderWidth: 2
    }]
  },
  options: {
    responsive: false,
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    },
  }
}
//차트 설정 2번
var config2 = {
  type: 'line',
  data: {
    labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월','8월','9월','10월','11월','12월'],
    datasets: [{
      label: 'Weight changed',
      data: [
    	  <c:forEach items="${useryearweight}" var="item">
			"${item.userWeight}",
			</c:forEach>
			],
      backgroundColor: [
        'rgba(239,239,239)',
        
      ],
      borderColor: [
        'rgba(24,90,219)',
        
      ],
      borderWidth: 2
    }]
  },
  options: {
    responsive: false,
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    },
  }
}
//차트 요소 선택
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, config1);
//클릭했을때 변경
document.getElementById('addData').onclick = function(){
  
  config1.data.labels = ['1일', '5일', '10일','15일','20일','30일'];
  //데이터셋 수 만큼 반복
  var dataset = config1.data.datasets;
  // for(var i=0; i<dataset.length; i++){
  //  console.log(dataset);
  //  //데이터 갯수 만큼 반복
  //  var data = dataset[i].data;
  //  for(var j=0 ; j < data.length ; j++){
  //    data[j] = Math.floor(Math.random() * 50);
  //  }
  // }
  
  console.log("이번달체중변화")
  myChart.update(); //차트 업데이트
}
//클릭했을때 변경
document.getElementById('addData1').onclick = function(){
  
  config1.data.labels = config2.data.labels;
  //데이터셋 수 만큼 반복
  var dataset = config2.data.datasets;
  // for(var i=0; i<dataset.length; i++){
  //  console.log(dataset);
  //  //데이터 갯수 만큼 반복
  //  var data = dataset[i].data;
  //  for(var j=0 ; j < data.length ; j++){
  //    data[j] = Math.floor(Math.random() * 50);
  //  }
  // }
  
  config1.data.datasets = dataset;
  console.log("올해체중변화")
  myChart.update(); //차트 업데이트
}
  </script>


<script>
  
//캘린더 부분//
  var today = null;
  var year = null;
  var month = null;
  var firstDay = null;
  var lastDay = null;
  var $tdDay = null;
  var $tdSche = null;
  var jsonData = null;

  $(document).ready(function() {
      drawCalendar();
      initDate();
      drawDays();
      drawSche();
      $("#movePrevMonth").on("click", function(){movePrevMonth();});
      $("#moveNextMonth").on("click", function(){moveNextMonth();});
  });

  //Calendar 그리기
  function drawCalendar(){
    var setTableHTML = "";
          setTableHTML+='<table class="calendar" >';
          setTableHTML+='<th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th>';
              //
          for(var i=0;i<6;i++){

              setTableHTML+='<tr height="100">';

              for(var j=0;j<7;j++){
                  setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                  setTableHTML+='    <div class="cal-day"></div>';
                  setTableHTML+='    <div class="cal-schedule">';
                    //
                  setTableHTML+='    </div>';
                  setTableHTML+='</td>';
                 
              }

              setTableHTML+='</tr>';
          }
              //
          setTableHTML+='</table>';

          $("#cal_tab").html(setTableHTML);
          
          
       // -- 스타트 데이트의 월이 다르면 월 첫날 부터 엔드 데이트까지 색칠
       $.ajax({
         url: "${CONTEXT_PATH}/calendar",
         type: 'GET',
         cache: false,
         dataType: 'json',
         success: function(result) {
           
           var table = document.querySelector("#cal_tab");
           
           var days = document.querySelectorAll(".rd");
           console.log('days',days);
           
           var month = document.querySelector('#cal_top_month').innerHTML;
            
           result.forEach(todo => {

              const todo_start_date = todo.classStartDate
              
              const todo_month = todo_start_date.substring(5,7);
              
              // -- 스타트 데이트의 월이 같으면 스타트데이트 부터 월 마지막날까지 색칠
              if(month === todo_month) {

                var todo_start_day = todo_start_date.substring(8,10);
                var last_index = days.length - 1;
                var todo_last_dayEL = days[last_index];

                let arr;
                
                days.forEach(day => {
                  if(day.innerHTML === todo_start_day) {
                    todo_start_dayEL = day;
                  }
                });

                // 일정 시작 요소
                console.log('todo_start_dayEL', todo_start_dayEL);
                // 월 마지막날 요소
                console.log('todo_last_dayEL',todo_last_dayEL);
                
              
              }
              
            });
           
           // $("#cal_tab").append("안녕아녕반가워");
         }
       })
  }

  //날짜 초기화
  function initDate(){
      $tdDay = $("td div.cal-day")
      $tdSche = $("td div.cal-schedule");
      dayCount = 0;
      today = new Date();
      year = today.getFullYear();
      month = today.getMonth()+1;
      if(month < 10){month = "0"+month;}
      firstDay = new Date(year,month-1,1);
      lastDay = new Date(year,month,0);
  }

  //calendar 날짜표시
  function drawDays(){
      $("#cal_top_year").text(year)
      $("#cal_top_month").text(month)
      for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
          $tdDay.eq(i).text(++dayCount).css("margin","5px").addClass('rd');
      }
      for(var i=0;i<42;i+=7){
          $tdDay.eq(i).css("color","red").css("margin","5px");
      }
      for(var i=6;i<42;i+=7){
          $tdDay.eq(i).css("color","blue").css("margin","5px");
      }
    
  }

  //데이터 등록
  function setData(){
      jsonData = 
      {
          "2021":{
              "07":{
                  "17":"제헌절"
              }
              ,"08":{
                  "7":"칠석"
                  ,"15":"광복절"
                  ,"23":"처서"
                  ,"15":"탁구챌린지"
              }
              ,"09":{
                  "13":"추석"
                  ,"23":"추분"
              }
          }
      }
  }

  //calendar 월 이동
  function movePrevMonth(){
      month--;
      if(month<=0){
          month=12;
          year--;
      }
      if(month<10){
          month=String("0"+month);
      }
      getNewInfo();
      }

  function moveNextMonth(){
      month++;
      if(month>12){
          month=1;
          year++;
      }
      if(month<10){
          month=String("0"+month);
      }
      getNewInfo();
  }

  //정보갱신
  function getNewInfo(){
      for(var i=0;i<42;i++){
          $tdDay.eq(i).text("").removeClass('rd');
          $tdSche.eq(i).text("");
      }
      dayCount=0;
      firstDay = new Date(year,month-1,1);
      lastDay = new Date(year,month,0);
      drawDays();
      drawSche();
  }




  //스케줄 그리기
  function drawSche(){
      setData();
      var dateMatch = null;
      for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
          var txt = "";
          txt =jsonData[year];
          if(txt){
              txt = jsonData[year][month];
              if(txt){
                  txt = jsonData[year][month][i];
                  dateMatch = firstDay.getDay() + i -1; 
                  $tdSche.eq(dateMatch).text(txt);
              }
          }
      }
  }

  
  
  
  
  </script>
</html>
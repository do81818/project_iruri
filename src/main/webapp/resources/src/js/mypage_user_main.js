
// 캘린더 부분//
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
    for(var i=0;i<6;i++){
        setTableHTML+='<tr height="100">';
        for(var j=0;j<7;j++){
            setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
            setTableHTML+='    <div class="cal-day"></div>';
            setTableHTML+='    <div class="cal-schedule"></div>';
            setTableHTML+='</td>';
        }
        setTableHTML+='</tr>';
    }
    setTableHTML+='</table>';
    $("#cal_tab").html(setTableHTML);
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
        $tdDay.eq(i).text(++dayCount).css("margin","5px");;
    }
    for(var i=0;i<42;i+=7){
        $tdDay.eq(i).css("color","red").css("margin","5px");;
    }
    for(var i=6;i<42;i+=7){
        $tdDay.eq(i).css("color","blue").css("margin","5px");;
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
        $tdDay.eq(i).text("");
        $tdSche.eq(i).text("");
    }
    dayCount=0;
    firstDay = new Date(year,month-1,1);
    lastDay = new Date(year,month,0);
    drawDays();
    drawSche();
}

//2019-08-27 추가본

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
            }
            ,"09":{
                "13":"추석"
                ,"23":"추분"
            }
            ,"07":{
                "title":"hh",
                "start":"2021-07-01",
                "end":"2021-07-02"
            }
        }
    }
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


// ---------------------------------------------------//
// 정보수정모달 //

$(function(){ 
    $(".m_information_change").click(function(){
    $(".modal").fadeIn();
    });
    
    $("img").click(function(){
      $(".modal").fadeOut();
    });
    
});

// 신체정보 업데이트 모달//
    $(function(){ 
        $(".m_update").click(function(){
        $(".modal1").fadeIn();
        });
        
        $("img").click(function(){
          $(".modal1").fadeOut();
        });
        
        });

        // 클래스 취소//
    $(function(){ 
        $(".m_cl_cancel_class_bt").click(function(){
        $(".class_cancel").fadeIn();
        });
        
        $("img").click(function(){
          $(".class_cancel").fadeOut();
        });
        
        });


        // 챌린지 취소//
        $(function(){ 
            $(".m_cl_cancel_challenge_bt").click(function(){
            $(".challenge_cancel").fadeIn();
            });
            
            $("img").click(function(){
              $(".challenge_cancel").fadeOut();
            });
            
            });

 /*X 누를경우 모달창 초기화(체크박스)*/
$(document).ready(function() {
    $("img").click(function() {
        $("form").each(function() {
            this.reset();
        });
    });
});

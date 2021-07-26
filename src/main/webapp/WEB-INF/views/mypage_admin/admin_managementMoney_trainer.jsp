<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
	<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<div class="admin_sales_All">
	<div class="admin_sales_trainerChoice">
		<form>
			<input type="text">
			<button></button>
		</form>
		<ul class="a">
			<li>트레이너를 검색하세요</li>
		</ul>
		<ul class="admin_sales_trainerResultY">
			<li><span><img
					src="${RESOURCES_PATH}/src/img/icon/icon_page_arrow_right.png"></span> <span
				class="trainerChoice_id">000</span> <span class="trainerChoice_name">홍길동</span>
			</li>
			<li><span><img
					src="${RESOURCES_PATH}/src/img/icon/icon_page_arrow_right.png"></span> <span
				class="trainerChoice_id">000</span> <span class="trainerChoice_name">홍길동</span>
			</li>
			<li><span><img
					src="${RESOURCES_PATH}/src/img/icon/icon_page_arrow_right.png"></span> <span
				class="trainerChoice_id">000</span> <span class="trainerChoice_name">홍길동</span>
			</li>
		</ul>
	</div>
	<div class="admin_sales_dayAndMonth">
		<h2>홍길동 트레이너의 수익</h2>
		<div class="admin_today_sales">
			<h3>오늘의 매출</h3>
			<p>
				2,000,000<span>원</span>
			</p>
		</div>
		<div class="admin_monthly_sales">
			<h3>월별매출</h3>
			<div>그래프</div>
		</div>
	</div>

	<div class="admin_sales_inquiry">
		<form action="">
			<table>
				<tr class="inquiry_types">
					<td>
						<h3>조회구분</h3>
					</td>
					<td><input type="radio" name="inquiry_type" id="rd1" checked>
						<label for="rd1"><span></span>전체내역</label> <input type="radio"
						name="inquiry_type" id="rd2"> <label for="rd2"><span></span>입금내역</label>
						<input type="radio" name="inquiry_type" id="rd3"> <label
						for="rd3"><span></span>출금내역</label></td>
				</tr>
				<tr class="inquiry_period">
					<td>
						<h3>조회기간</h3>
					</td>
					<td>
						<form>
							<select id="inquiry_tr_startdate_year"
								class="inquiry_startdate_year"
								onchange="javascript:tr_start_lastday()"></select> <span>년</span> <select
								id="inquiry_tr_startdate_month" class="inquiry_startdate_month"
								onchange="javascript:tr_start_lastday()">
							</select> <span>월</span> <select id="inquiry_tr_startdate_day" class="inquiry_startdate_day">
							</select> <span>일</span>
							<p>~</p>

							<select id="inquiry_tr_enddate_year" class="inquiry_enddate_year"
								onchange="javascript:tr_end_lastday()">
							</select> <span>년</span> <select id="inquiry_tr_enddate_month" class="inquiry_enddate_month" 
								onchange="javascript:tr_end_lastday()">
								<option></option>
							</select> <span>월</span> 
							<select id="inquiry_tr_enddate_day" class="inquiry_enddate_day">
							</select> <span>일</span>
							<button type="button">검색</button>
						</form>
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="inquiry_quick_button">
						<button id="inquiry_tr_conditions_30">최근 30건</button>
						<button id="inquiry_tr_conditions_today">오늘</button>
						<button id="inquiry_tr_conditions_15ays">15일</button>
						<button id="inquiry_tr_conditions_1month">1개월</button>
						<button id="inquiry_tr_conditions_3month">3개월</button>
						<button id="inquiry_tr_conditions_6mmonth">6개월</button>
						<button id="inquiry_tr_conditions_1year">1년</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="admin_sales_table">
		<p>(수수료: 10%)</p>
		<table class="admin_table __trainer">
			<tr>
				<th>날짜</th>
				<th>분류</th>
				<th>내용</th>
				<th>입금</th>
				<th>원금</th>
				<th>입금</th>
				<th>출금</th>
				<th>잔금</th>
			</tr>
			<tr>
				<td class="table_No_date">0000.00.00</td>
				<td class="table_blue_text">구매</td>
				<td class="table_indigo_text">클래스 구매</td>
				<td class="table_indigo_text">닉네임</td>
				<td class="table_blue_text">50,000</td>
				<td class="table_blue_text">45,000</td>
				<td class="table_red_text"></td>
				<td class="table_blue_text">0,000,000</td>
			</tr>
			<tr>
				<td class="table_No_date">0000.00.00</td>
				<td class="table_red_text">환불</td>
				<td class="table_indigo_text">클래스 구매</td>
				<td class="table_indigo_text">닉네임</td>
				<td class="table_blue_text">50,000</td>
				<td class="table_blue_text"></td>
				<td class="table_red_text">45,000</td>
				<td class="table_blue_text">0,000,000</td>
			</tr>
		</table>
		<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
		<div class="page_nation">
			<a class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
			<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
			<a class="arrow next" href="#"></a>
		</div>
	</div>
</div>

<script>
var today = new Date();
var start_year = today.getFullYear() - 5; // 시작할 년도 
var today_year = today.getFullYear();


// 시작일 선택
var index = 1;
for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
    document.getElementById('inquiry_tr_startdate_year').options[index] = new Option(y, y);
    index++;
}
var index = 1;
for (var m = 1; m <= 12; m++) {
    document.getElementById('inquiry_tr_startdate_month').options[index] = new Option(m, m);
    index++;
}

function tr_start_lastday() { //년과 월에 따라 마지막 일 구하기 
    var Year = document.getElementById('inquiry_tr_startdate_year').value;
    var Month = document.getElementById('inquiry_tr_startdate_month').value;
    var lastday = 0;
    var dayindex_len = document.getElementById('inquiry_tr_startdate_day').length;

    if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8 || Month == 10 || Month == 12) {
        lastday = 31;
    } else if (Month == 4 || Month == 6 || Month == 9) {
        lastday = 30;
    } else if (Month == 2){
        if ((Year - 2016) % 4 == 0) {
            lastday = 29;
        } else {
            lastday = 28;
        }
    } else {
        lastday = 0;
    }

    index = 1;
    if (lastday < dayindex_len) {
        for (var d = 1; d <= dayindex_len; d++) {
            document.getElementById('inquiry_tr_startdate_day').options[index] = null;
            index++;
        }
    }

    index = 1;
    for (var d = 1; d <= lastday; d++) {
        document.getElementById('inquiry_tr_startdate_day').options[index] = new Option(d, d);
        index++;
    }
}

// 끝 날짜
index = 1;
for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
    document.getElementById('inquiry_tr_enddate_year').options[index] = new Option(y, y);
    index++;
}
index = 1;
for (var m = 1; m <= 12; m++) {
    document.getElementById('inquiry_tr_enddate_month').options[index] = new Option(m, m);
    index++;
}
end_lastday();

function tr_end_lastday() { //년과 월에 따라 마지막 일 구하기 
    var Year = document.getElementById('inquiry_tr_enddate_year').value;
    var Month = document.getElementById('inquiry_tr_enddate_month').value;
    var lastday = 0;
    var dayindex_len = document.getElementById('inquiry_tr_enddate_day').length;

    if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8 || Month == 10 || Month == 12) {
        lastday = 31;
    } else if (Month == 4 || Month == 6 || Month == 9) {
        lastday = 30;
    } else if (Month == 2){
        if ((Year - 2012) % 4 == 0) {
            lastday = 29;
        } else {
            lastday = 28;
        }
    }

    index = 1;
    if (lastday < dayindex_len) {
        for (var d = 1; d <= dayindex_len; d++) {
            document.getElementById('inquiry_tr_enddate_day').options[index] = null;
            index++;
        }
    }

    index = 1;
    for (var d = 1; d <= lastday; d++) {
        document.getElementById('inquiry_tr_enddate_day').options[index] = new Option(d, d);
        index++;
    }
}
</script>
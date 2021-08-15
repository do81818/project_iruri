<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>

<!------------------------ 트레이너 검색 --------------------------->
<div class="admin_sales_trainerChoice" style="margin-bottom: 30px;">
	<form>
		<input type="text" name="trainerSearch">
		<button type="button" id="trainerSearch_button"></button>
	</form>
	<div id="trainerNameSearch_result">
	<ul class="a">
		<li>트레이너를 검색하세요</li>
	</ul>
	</div>
</div>
<!---------------------- 전체수익 탭 -------------------------->
<div id="admin_sales_All" class="admin_sales_All">


	<div class="admin_sales_dayAndMonth">
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
					<td><input type="radio" name="inquiry_type" id="rd1"
						value="all" checked> <label for="rd1"><span></span>전체내역</label>
						<input type="radio" name="inquiry_type" id="rd2" value="input">
						<label for="rd2"><span></span>입금내역</label> <input type="radio"
						name="inquiry_type" id="rd3" value="output"> <label
						for="rd3"><span></span>출금내역</label></td>
				</tr>
				<tr class="inquiry_period">
					<td>
						<h3>조회기간</h3>
					</td>
					<td>
						<form>
							<select id="inquiry_startdate_year"
								class="inquiry_startdate_year" name="sy"
								onchange="javascript:start_lastday()"></select> <span>년</span> <select
								id="inquiry_startdate_month" class="inquiry_startdate_month"
								name="sm" onchange="javascript:start_lastday()">
							</select> <span>월</span> <select id="inquiry_startdate_day"
								class="inquiry_startdate_day" name="sd">
							</select> <span>일</span>

							<p>~</p>

							<select id="inquiry_enddate_year" class="inquiry_enddate_year"
								onchange="javascript:end_lastday()" name="ey">
							</select> <span>년</span> <select id="inquiry_enddate_month"
								class="inquiry_enddate_month" name="em"
								onchange="javascript:end_lastday()">
							</select> <span>월</span> <select id="inquiry_enddate_day"
								class="inquiry_enddate_day" name="ed">

							</select> <span>일</span>
							<button id="inquiry_period_button" type="button">검색</button>
						</form>

					</td>
				</tr>
				<tr>
					<td></td>
					<td class="inquiry_quick_button">
						<button type="button" onclick="simpleInquire('lately')">최근
							30건</button>
						<button type="button" onclick="simpleInquire('today')">오늘</button>
						<button type="button" onclick="simpleInquire('before15Days')">15일</button>
						<button type="button" onclick="simpleInquire('before1Month')">1개월</button>
						<button type="button" onclick="simpleInquire('before3Month')">3개월</button>
						<button type="button" onclick="simpleInquire('before6Month')">6개월</button>
						<button type="button" onclick="simpleInquire('before1Year')">1년</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="admin_sales_table">
		<table class="admin_table __all">

			<!-- ajax 수익 리스트 -->

		</table>

		<div class="page_nation">

			<!-- ajax 페이징 구현 -->

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		console.log("시작!");
		getlist(1, 987654321, 'all', 0, 0);
	})

	function trainerSearch(word) {

		const keyword = word;

		console.log("trainerSearch()..");
		console.log(keyword);
		$.ajax({
					url : '${CONTEXT_PATH_ADMIN}/ajax/trainerSearch',
					type : 'GET',
					cache : false,
					dataType : 'json',
					data : {
						'keyword' : keyword,
					},
					success : function(result) {
						console.log("트레이너 검색 성공");
						var list = result['list'];
						var htmls = "";

						if (list.length < 1) {
							htmls += '<ul class="a"><li>일치하는 이름의 트레이너가 없습니다.</li></ul>';
						} else {
							htmls += '<ul class="admin_sales_trainerResultY">';

							$(list).each(function() {
												htmls += '<input type="radio" style="cursor: point;" name="trainerChoice" id="trainerChoice_' 
													+ this.iuserVo.userId + '" value="'
													+ this.iuserVo.userId +'">'
													+ '<label style="width: 33%;" for="trainerChoice_'
													+ this.iuserVo.userId
													+ '">'
													+ '<li><span><img src="${RESOURCES_PATH}/src/img/icon/icon_page_arrow_right.png"></span>'
													+ '<span class="trainerChoice_id">'
													+ this.iuserVo.userId
													+ '</span> <span class="trainerChoice_name">'
													+ this.iuserVo.userName
													+ '</span>';

												if (this.authVo.authContent == 'ROLE_LEAVE') {
													htmls += '<span style="font-size: 12px; color: #999999;">(탈퇴회원';
													if (this.iuserVo.userBlackList == true) {
														htmls += ' / 블랙리스트';
													}
													htmls += ')</span>';
												}

												htmls += '</li></label>';

											});

							htmls += '</ul>';
						}

						htmls += '</div>';

						$("#trainerNameSearch_result").html(htmls);
					}

				});

	}

	function valueCheck() {

		let currentUserId = $('input[name=trainerChoice]:checked').val();
		let userId = 0;
		console.log("currentUserId :" + currentUserId);
		if (currentUserId == null) {
			userId = 987654321;
		} else {
			userId = currentUserId;
		}
		const tapsValue = $('input[name=taps]:checked').val();
		console.log("inputname :" + tapsValue);
		if (tapsValue == 1) {
			userId = 0;
		}
		console.log("userId :" + userId);

		const inquireType = $('input[name=inquiry_type]:checked').val();
		console.log("inquire: " + inquireType);

		if (inquireType != null) {
			var inquire = inquireType;
		} else {
			var inquire = 'all';
		}

		const sy = $('select[name=sy]').val();
		console.log("sy: " + sy);
		const sm = $('select[name=sm]').val();
		console.log("sm: " + sm);
		const sd = $('select[name=sd]').val();
		console.log("sd: " + sd);
		const ey = $('select[name=ey]').val();
		console.log("ey:" + ey);
		const em = $('select[name=em]').val();
		console.log("em: " + em);
		const ed = $('select[name=ed]').val();
		console.log("ed: " + ed);

		if ((sy != null && sy != "") && (sm != null && sm != "")
				&& (sd != null && sd != "") && (ey != null && ey != "")
				&& (em != null && em != "") && (ed != null && ed != "")) {

			let today = new Date();
			let todayStr = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			let periodStartDate = sy + dateCheck(sm) + dateCheck(sd);
			let periodEndDate = ey + dateCheck(em) + dateCheck(ed);

			console.log("today: " + todayStr);
			console.log("periodStartDate: " + periodStartDate);
			console.log("periodEndDate: " + periodEndDate);

			if ((periodStartDate < todayStr && periodEndDate <= periodEndDate)
					&& (periodStartDate < periodEndDate)) {

				getlist(1, userId, inquire, periodStartDate, periodEndDate);

			} else {
				alert("기간을 다시 입력하세요.");
			}
		} else if ((sy == null || sy == "") && (sm == null || sm == "")
				&& (sd == null || sd == "") && (ey == null || ey == "")
				&& (em == null || em == "") && (ed == null || ed == "")) {
			getlist(1, userId, inquire, 0, 0);
		} else {
			alert("기간을 다시 입력하세요.");
		}

	}

	function dateCheck(number) {
		number = Number(number).toString();
		if (Number(number) < 10 && number.length == 1)
			number = "0" + number;
		return number;
	}

	function getlist(page, userId, inquire, periodStartDate, periodEndDate) {

		$
				.ajax({
					url : '${CONTEXT_PATH_ADMIN}/ajax/paylist',
					type : 'GET',
					cache : false,
					dataType : 'json',
					data : {
						'pageNum' : page,
						'userId' : userId,
						'inquire' : inquire,
						'periodStartDate' : periodStartDate,
						'periodEndDate' : periodEndDate,
					},
					success : function(result) {
						console.log("성공");

						var list = result['list'];
						var pagination = result['pageMaker'];
						var htmls = "";
						var htmls2 = "";

						htmls += '<tr><th>날짜</th><th>내용</th><th>이름</th><th>입금</th><th>출금</th><th>잔금</th></tr>';

						if (list.length < 1) {
							htmls += '<tr>';
							htmls += '<td colspan="6" class="table_No_date" style="padding: 100px; text-align: center;">'
									+ '입금/출금 내역이 없습니다.' + '</td>';
							htmls += '</tr>';

						} else {

							$(list)
									.each(
											function() {
												htmls += '<tr>'
														+ '<td class="table_No_date">'
														+ moment(
																this.moneyVo.moneyDate)
																.format(
																		'YYYY.MM.DD')
														+ '</td>'
														+ '<td class="table_indigo_text">'
														+ this.iclassVo.classTitle
														+ '</td>'
														+ '<td class="table_indigo_text">'
														+ this.iuserVo.userNickname
														+ '</td>'
														+ '<td class="table_blue_text">'
														+ priceToString(this.moneyVo.moneyInput)
														+ '</td>'
														+ '<td class="table_red_text">'
														+ priceToString(this.moneyVo.moneyOutput)
														+ '</td>'
														+ '<td class="table_blue_text">'
														+ priceToString(this.totalMoney)
														+ '</td>' + '</tr>';

											});

							console.log(page + ',' + userId + ',' + inquire
									+ ',' + periodStartDate + ','
									+ periodEndDate);

							/* ------------------ 페이징 부분 --------------------- */
							if (pagination['prev']) {
								htmls2 += '<a class="arrow prev" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
										+ (pagination['startPage'] - 1)
										+ '\',\''
										+ userId
										+ '\',\''
										+ inquire
										+ '\',\''
										+ periodStartDate
										+ '\',\''
										+ periodEndDate + '\');"></a>';
							}

							// 번호를 표시하는 부분
							for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
								if (page != idx) {
									htmls2 += '<a class="pageNumLink" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
											+ idx
											+ '\',\''
											+ userId
											+ '\',\''
											+ inquire
											+ '\',\''
											+ periodStartDate
											+ '\',\''
											+ periodEndDate
											+ '\');">'
											+ idx
											+ "</a>";
								} else {
									htmls2 += '<a class="pageNumLink active" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
											+ idx
											+ '\',\''
											+ userId
											+ '\',\''
											+ inquire
											+ '\',\''
											+ periodStartDate
											+ '\',\''
											+ periodEndDate
											+ '\');">'
											+ idx
											+ "</a>";
								}
							}

							if (pagination['next']) {
								htmls2 += '<a class="arrow next" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
										+ (pagination['endPage'] + 1)
										+ '\',\''
										+ userId
										+ '\',\''
										+ inquire
										+ '\',\''
										+ periodStartDate
										+ '\',\''
										+ periodEndDate + '\');"></a>';

							}
						} // if(list.length < 1) else 끝

						$(".admin_table").html(htmls);
						$(".page_nation").html(htmls2);

					}
				});

	}

	function simpleInquire(type) {

		const tapsValue = $('input[name=taps]:checked').val();
		console.log("inputname :" + tapsValue);
		
		let userId = $('input[name=trainerChoice]:checked').val();
		if (userId == null) {
			userId = 987654321;
		}
		
		if (tapsValue == 1) {
			userId = 0;
		}
		
		console.log("userId :" + userId);

		const inquireType = $('input[name=inquiry_type]:checked').val();
		console.log("inquire: " + inquireType);
		console.log("type: " + type);

		$('select[name=sy]').val('');
		$('select[name=sm]').val('');
		$('select[name=sd]').val('');
		$('select[name=ey]').val('');
		$('select[name=em]').val('');
		$('select[name=ed]').val('');

		let today = new Date();

		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let day = today.getDate();

		if (type == 'lately') {
			console.log(inquireType);
			getlist(1, userId, inquireType, '30', 0);

		} else if (type == "today") {
			let periodStartDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);

		} else if (type == "before15Days") {
			let periodStartDate = String(today.getFullYear())
					+ dateCheck(today.getMonth() + 1)
					+ dateCheck(today.getDate() - 15);
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);

		} else if (type == "before1Month") {
			let periodStartDate = String(today.getFullYear())
					+ dateCheck(today.getMonth()) + dateCheck(today.getDate());
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);

		} else if (type == "before3Month") {
			let periodStartDate = String(today.getFullYear())
					+ dateCheck(today.getMonth() - 2)
					+ dateCheck(today.getDate());
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);

		} else if (type == "before6Month") {
			let periodStartDate = String(today.getFullYear())
					+ dateCheck(today.getMonth() - 5)
					+ dateCheck(today.getDate());
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);

		} else if (type == "before1Year") {
			let periodStartDate = String(today.getFullYear() - 1)
					+ dateCheck(today.getMonth() + 1)
					+ dateCheck(today.getDate());
			let periodEndDate = String(today.getFullYear())
					+ dateCheck((today.getMonth() + 1))
					+ dateCheck(today.getDate());
			getlist(1, userId, inquireType, periodStartDate, periodEndDate);
		}

	}

	document.getElementById("rd1").addEventListener("click", function() {
		valueCheck();
	}, false);
	document.getElementById("rd2").addEventListener("click", function() {
		valueCheck();
	}, false);
	document.getElementById("rd3").addEventListener("click", function() {
		valueCheck();
	}, false);
	document.getElementById("inquiry_period_button").addEventListener("click",
			function() {
				valueCheck();
			}, false);

	document.getElementById("trainerSearch_button").addEventListener("click",
			function() {
				console.log("trainerSearch_button()..");
				const word = $("input[name=trainerSearch]").val();
				trainerSearch(word);
			}, false);

	document.getElementById("trainerNameSearch_result").addEventListener(
			"click", function() {
				valueCheck();
			}, false);
</script>


<script>
	var today = new Date();
	var start_year = today.getFullYear() - 5; // 시작할 년도 
	var today_year = today.getFullYear();

	// 시작일 선택
	var index = 1;
	for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
		document.getElementById('inquiry_startdate_year').options[index] = new Option(
				y, y);
		index++;
	}
	var index = 1;
	for (var m = 1; m <= 12; m++) {
		document.getElementById('inquiry_startdate_month').options[index] = new Option(
				m, m);
		index++;
	}

	function start_lastday() { //년과 월에 따라 마지막 일 구하기 
		var Year = document.getElementById('inquiry_startdate_year').value;
		var Month = document.getElementById('inquiry_startdate_month').value;
		var lastday = 0;
		var dayindex_len = document.getElementById('inquiry_startdate_day').length;

		if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8
				|| Month == 10 || Month == 12) {
			lastday = 31;
		} else if (Month == 4 || Month == 6 || Month == 9) {
			lastday = 30;
		} else if (Month == 2) {
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
				document.getElementById('inquiry_startdate_day').options[index] = null;
				index++;
			}
		}

		index = 1;
		for (var d = 1; d <= lastday; d++) {
			document.getElementById('inquiry_startdate_day').options[index] = new Option(
					d, d);
			index++;
		}
	}

	// 끝 날짜
	index = 1;
	for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
		document.getElementById('inquiry_enddate_year').options[index] = new Option(
				y, y);
		index++;
	}
	index = 1;
	for (var m = 1; m <= 12; m++) {
		document.getElementById('inquiry_enddate_month').options[index] = new Option(
				m, m);
		index++;
	}
	end_lastday();

	function end_lastday() { //년과 월에 따라 마지막 일 구하기 
		var Year = document.getElementById('inquiry_enddate_year').value;
		var Month = document.getElementById('inquiry_enddate_month').value;
		var lastday = 0;
		var dayindex_len = document.getElementById('inquiry_enddate_day').length;

		if (Month == 1 || Month == 3 || Month == 5 || Month == 7 || Month == 8
				|| Month == 10 || Month == 12) {
			lastday = 31;
		} else if (Month == 4 || Month == 6 || Month == 9) {
			lastday = 30;
		} else if (Month == 2) {
			if ((Year - 2012) % 4 == 0) {
				lastday = 29;
			} else {
				lastday = 28;
			}
		}

		index = 1;
		if (lastday < dayindex_len) {
			for (var d = 1; d <= dayindex_len; d++) {
				document.getElementById('inquiry_enddate_day').options[index] = null;
				index++;
			}
		}

		index = 1;
		for (var d = 1; d <= lastday; d++) {
			document.getElementById('inquiry_enddate_day').options[index] = new Option(
					d, d);
			index++;
		}
	}
</script>

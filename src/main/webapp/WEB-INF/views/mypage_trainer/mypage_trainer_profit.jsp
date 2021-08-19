<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<title>트레이너 마이페이지 수익관리</title>
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- 수익리스트 페이징 -->
<script type="text/javascript">
	$(document).ready(function() {
		profit(1);
	});
	function profit(page) {
		$.ajax({
					url : 'http://localhost:8282/ex/ajax/mypage/trainerProfit.json',
					type : 'GET',
					cache : false,
					dataType : 'json',
					data : {
						pageNum : page,
					},
					success : function(result) {
						var profitList = result['profitList'];
						console.log(profitList);
						var pagination = result['pageMaker'];
						var htmls = '';
						var htmls2 = '';

						if (profitList.length < 1) {
							htmls = '현재 트레이너님의 수익은 없습니다.';
						} else {

							$(profitList)
									.each(
											function() {
												htmls += '<table class="pt_class_profit">';
												htmls += '<tr>';
												htmls += '<td class="pt_class_profit_date">'
														+ this.buyDate
														+ '</td>';
												htmls += '<td>';
												htmls += '<a class="pt_class_profit_title" href="#">'
														+ this.classTitle
														+ '</a>';
												htmls += '</td>';
												htmls += '<td class="pt_class_profit_money">'
														+ this.buyProfit
														+ '</td>';
												htmls += '</tr>';
												htmls += '</table>';

											});
							if (pagination['prev']) {
								htmls2 += '<a class="arrow prev" href="javascript:profit('
										+ (pagination['startPage'] - 1)
										+ ')"></a>';
							}
							// 번호를 표시하는 부분
							for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
								if (page !== idx) {
									htmls2 += '<a class="pageNumLink" href="javascript:profit('
											+ idx + ')">' + (idx) + "</a>";
								} else {
									htmls2 += '<a class="pageNumLink active" href="javascript:profit('
											+ idx + ')">' + (idx) + "</a>";
								}
							}

							if (pagination['next']) {
								htmls2 += '<a class="arrow next" href="javascript:profit('
										+ (pagination['endPage'] + 1)
										+ ')"></a>';

							}
							$(".pt_class_profit_list").html(htmls);
							$(".page_nation").html(htmls2);
						}
					}
				});

	};
</script>

<!--월별수익 페이징-->
<script>
	$(document).ready(function() {
		MonthProfit(0);
	});

	function MonthProfit(index) {
		$.ajax({
					url : 'http://localhost:8282/ex/ajax/mypage/monthProfit.json',
					type : 'GET',
					cache : false,
					dataType : 'json',
					data : {

					},
					success : function(result) {
						var monthProfitList = result['monthProfitList'];
						console.log("jsp:monthProfitList");
						console.log(monthProfitList);
						//var pagination = result['pageMaker'];
						var htmls = '';
						var htmls2 = '';
						var htmls3 = '';
						var htmls4 = '';

						var month = new Date().getMonth() + 1;
						var length = monthProfitList.length;

						console.log("month: " + month + ',' + 'length: '
								+ length);

						let monthArr = [];
						let valueArr = [];

						var vindex = 0;
						for (let i = month; i > 0; i--) {
							monthArr.push(i);
							for (let j = 0; j < monthProfitList.length; j++) {
								if (i == monthProfitList[j].mm) {
									valueArr.push(monthProfitList[j].profit);
									vindex = 1;
								}
							}
							if (vindex != 1) {
								valueArr.push('0');
							}
							vindex = 0;
						}

						console.log("monthArr:" + monthArr + ',' + "valueArr: "
								+ valueArr);

						if (monthProfitList.length < 1) {
							htmls = '현재 트레이너님의 수익은 없습니다.';
						} else {

							htmls += monthArr[index]
									+ '월의 수익'
									+ '<input type="hidden" name = "pt_month_text" value="'
						+ monthArr[index]
						+ '">';
							htmls2 += valueArr[index] + '원';

							console.log("monthArr[index]: " + monthArr[index]);
							console.log("index: " + index);

							/* 	
								
								
								if (index < month) {
									index++;
									htmls3 += '<span>이전달</span><a href="javascript:MonthProfit('+ index +')"><img src="../image/arrow_red_right.png" alt="up" class="arrow_width_up_down"></a>';
								} 
								if(index > 0) {
									index--;
									htmls4 += '<span>다음달</span><a href="javascript:MonthProfit('+ index +')"><img src="../image/arrow_red_left.png" alt="up" class="arrow_width_up_down"></a>';
								} */

							$('.pt_month_text').html(htmls);
							$('.pt_won').html(htmls2);
							/* $('.pt_next_month').html(htmls3);
							$('.pt_pre_month').html(htmls4); */

							
							
							chart(monthArr,valueArr);
						}
					}
				});

	};

	function indexCheck(num) {
		console.log("num: " + num);
		let month = new Date().getMonth() + 1;
		let numi = Number($('input[name=pt_month_text]').val());
		console.log("month: " + month);
		console.log("numi: " + numi);
		if (num == 1) {
			let index = month - numi + 1;
			if (index < month) {
				console.log("index: " + index);
				MonthProfit(index);
			}
		} else if (num == 2) {
			let index = month - numi - 1;
			if (index > -1) {
				console.log("index: " + index);
				MonthProfit(index);
			}
		}
	}
	
	
	/* 차트 */
	function chart(monthArr,valueArr) {
		const ctx = document.getElementById('myChart').getContext('2d');
		console.log(monthArr);
		console.log(monthArr.length);

		var reMonthArr = monthArr.reverse();
		var reValueArr = valueArr.reverse();
		
		let max = 0;
		
		for(let i = 0; i < length; i++){
			if(max < reValueArr[i].totalMoney) {
				max = reValueArr[i].totalMoney;
			}
		}
		
		let maxVal = (Math.ceil(max/5000000)+1) * 5000000;
		
		/* for(let i = 0 ; i < monthArr.length; i++) {
			reMonthArr[i].push(monthArr[index-i]);
			reValueArr[i].push(valueArr[index-i]);
		} */
		console.log(reMonthArr);
		console.log(reValueArr);
		
		reMonthArr.push(monthArr.length + 1);
		reValueArr.push(0);
	
		var myChart = new Chart(ctx, {
	
			type: 'line',
	        data: {
	        	 labels: reMonthArr,
	             datasets: [{
	            	// label: '# of Votes',
              		// 해당 달의 금액
		              data: reValueArr,
		              fill: false,
		
		              borderColor: 'rgba(255, 0, 0, 1)',
		              borderWidth: 1,
		              
		              pointBackgroundColor : 'rgba(255, 0, 0, 1)',
	             }]
	        },
	        
	        options: {
            	legend: {
                    display: false,
                },

                // responsive: false,
                tooltips: {
                    enabled: false,
                },
                hover: {
                    animationDuration: 0,
                },
                animation: {
                    // duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                            ctx = chartInstance.ctx;
                        ctx.font = Chart.helpers.fontString(Chart.defaults.global
                            .defaultFontSize, Chart
                            .defaults.global.defaultFontStyle, Chart.defaults.global
                            .defaultFontFamily);
                       
                        ctx.fillStyle = 'rgba(24, 90, 189, 1)';
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'center';
                        ctx.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';

                        this.data.datasets.forEach(function (dataset, i) {
                            var meta = chartInstance.controller.getDatasetMeta(
                                i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar
                                    ._model
                                    .y - 5);
                            });
                        });
                    }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            fontSize: 8,
                            stepSize: 500000,
                            max: maxVal,
                            callback: function(value,index) {
                            	if(value.toString() > 3){
                            		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
                            	}
                            }
                        }
                    }],
                    xAxes: [{
                        ticks: {
                            fontSize: 10,
                            callback: function(value) {
                            	
                            		return value.toString() + '월';
                            	}
                            }
                    }]
                },
            }
	        
		})
	}
		
</script>
</head>
<body>
	<div class="iruri__wrapper">
		<%@ include file="../include/headerTemplate.jsp"%>
		<main>
			<!-- 콘텐츠를 넣어주세요 -->
			<div class="container content">
				<!-- 마이페이지 기본 탭 -->
				<div class="imformation_box">
					<div id="user_info">
						<div class="nickname">
							<!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button"
								onclick="location.href='/ex/iruri/ptClassMakeForm'">클래스
								개설</button>
						</div>
						<div class="user_detail">
							<c:if test="${user.authList[0].authContent eq 'ROLE_TRAINER'}">
								<div>나는 이루리의 자랑스러운 <span class = "mypagetrainer_bold">트레이너!</span></div>
							</c:if>
							<div>${user.userEmail}</div>

						</div>
					</div>

					<div id="challenge">
						운영중인 클래스
						<div class="count">${countMypageTrainerClass}</div>
					</div>

					<div id="buy">
						수익금
						<div class="count">
							${trainerProfitMan}
							<div class="buy_text">만원</div>
						</div>
					</div>
				</div>
				<!-- 관리메뉴 -->
				<div class="class_MenuBar">
					<ul>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer">클래스관리</a></li>
						<li class="class_MenuBar_text"><a
							href="/ex/mypage/trainer/userManagement">회원관리</a></li>
						<li class="class_MenuBar_text"><a
							href="/ex/mypage/trainer/classReply">클래스댓글조회</a></li>
						<li class="class_MenuBar_text_now"><a
							href="/ex/mypage/trainer/profit">수익관리</a></li>
					</ul>
				</div>

				<!-- 수익관리 -->
				<div class="display_flex">
					<div class="pt_profit">
						<!-- 에이젝스 처리하기 -->
						<table>
							<tr>
								<td colspan="3""><span class="pt_month_text">이달의 수익</span></td>
							</tr>
							<tr>
								<td class="pt_month_number"><span class="pt_won"></span></td>
								<td class="pt_pre_month"><span>이전달</span> <a
									onclick="indexCheck(1)"><img
										src="/ex/resources/src/img/icon/arrow_red_left.png" alt="up"
										class="arrow_width_up_down" /></a></td>
								<td class="pt_next_month"><span>다음달</span> <a
									onclick="indexCheck(2)"><img
										src="/ex/resources/src/img/icon/arrow_red_right.png" alt="up"
										class="arrow_width_up_down" /></a></td>
							</tr>
						</table>




						<!-- <div class="month_profit_list"></div>
             
                <div class="month_page_nation">
                </div> -->
						<div class="pt_class_profit_list"></div>

						<div class="page_nation"></div>

					</div>
					<div class="pt_profit_graph">
						<!-- <img src="../image/360-250.png" alt="수익그래프"> -->
						<canvas id="myChart"></canvas>

					</div>



					<!--         
         <button type="button" id="btn">버튼</button> 

			<div id="column_chart_div1" style="width: 900px; height: 500px;"></div> -->
					<!-- <div id="myChart"></div> -->
				</div>

			</div>
		</main>

		<%@ include file="../include/footerTemplate.jsp"%>

	</div>
</body>
</html>
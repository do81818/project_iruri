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
<title>마이페이지 클래스리스트</title>
<script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer="defer"></script>

<script>
	$(document).ready(function() {
		/* window.onload = function(){ */
		var actionForm = $("#mactionForm");
		$(".pageNumLink").on("click", function(e) {
			e.preventDefault();
			var targetPage = $(this).attr("href");

			actionForm.find("input[name='pageNum']").val(targetPage);
			actionForm.submit();
		});

		$(".prev").on("click", function(e) {
			e.preventDefault();
			var targetPage = $(this).attr("href");

			actionForm.find("input[name='pageNum']").val(targetPage);
			actionForm.submit();
		});

		$(".next").on("click", function(e) {
			e.preventDefault();
			var targetPage = $(this).attr("href");

			actionForm.find("input[name='pageNum']").val(targetPage);
			actionForm.submit();
		});
	});
</script>

</head>
<body>
		<div class="iruri__wrapper">

				<%@ include file="../include/headerTemplate.jsp"%>

				<main>
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
														<c:if
																test="${user.authList[0].authContent eq 'ROLE_USER'}">
																<div>일반회원</div>
														</c:if>
														<br>${user.userEmail}</div>
										</div>
										<div id="m_userboard_box">
												<div id="m_userboard">
														<a href=".">작성글</a>
												</div>
												<div id="m_userboard_number">${boardcount}</div>
										</div>
										<div id="m_userpoint_box">
												<div id="m_userpoint">
														<a href=".">보유포인트</a>
												</div>
												<div id="m_userpoint_number">${totalpoint}</div>
										</div>
										<div id="m_userchanllenge_box">
												<div id="m_userchanllenge">
														<a href=".">참여중인챌린지</a>
												</div>
												<div id="m_userchanllenge_number">${userchallengecount}</div>
										</div>
										<div id="m_userclass_box">
												<div id="m_userclass">
														<a href=".">참여중인클래스</a>
												</div>
												<div id="m_userclass_number">${userclasscount}</div>
										</div>
								</div>

								<!-- 클래스 리스트박스 -->

								<div class="m_point_box">
										<div id="m_now_pointlist_box">
												<div id="m_now_pointlist">신청클래스</div>
												<div id="m_now_pointlistnb">${userclasscount}</div>

										</div>
										<div id="m_pre_pointlist_box">
												<div id="m_pre_pointlist">관심클래스</div>
												<div id="m_pre_pointlistnb_class">${classlikecount}</div>
										</div>
										<div id="m_use_pointlist_box">
												<div id="m_use_pointlist">지난클래스</div>
												<div id="m_use_pointlistnb">${classendcount}</div>
										</div>
								</div>

								<!-- 신청한 챌린지 -->
								<div class="m_cl_text">신청클래스</div>



								<div class="m_cl_recommend">
										<img class="m_cl_left" role="button"
												src="/ex/resources/src/img/icon/arrow_blue_left.png">

									<div class="m_cl_slides">
									<ul>
										<c:forEach var="userclasslist" items="${userclasslist}"
												varStatus="status">

												<li class="m_cl_recommend_img">
														<button class="m_cl_cancel_class_bt" id="${userclasslist.classId}">클래스취소</button>
														<div class="m_cl_recommend_title">
																${userclasslist.classTitle}
																
														</div>

														<span class="m_cl_recommend_date">
																${userclasslist.classStartDate}~${userclasslist.classEndDate}
														</span>

														<div class="m_cl_heart">
																<input type="checkbox"
																		id="heart${userclasslist.classId}"> <label
																		for="heart${userclasslist.classId}"
																		class="m_r_heart_label"></label>
														</div>
												</li>

										</c:forEach>
									</ul>
									</div>

										<img class="m_cl_right" role="button"
												src="/ex/resources/src/img/icon/arrow_blue_right.png">
								</div>
								
								<script>
								$(document).ready(function hihi2(){
									$(".m_cl_cancel_class_bt").click(function(){
										var hihi2 = $(this).attr('id');
										console.log(hihi2);
										
										$('input[name="hihi2"]').attr('value',hihi2);
									
									});
								
								});
								
								
								</script>
								
								<script>
									$('.m_r_heart_label')
											.on(
													'click',
													function(e) {
														let forStr = e.currentTarget.htmlFor
														let classId = forStr
																.substring(5);

														$
																.ajax({
																	url : '${CONTEXT_PATH}/userclass/heart',
																	type : 'GET',
																	cache : false,
																	dateType : 'json',
																	data : {
																		classId : classId,
																	}
																});
													});

									const m_cl_recommend_img = document
											.querySelectorAll('.m_cl_recommend_img');
									console.log(m_cl_recommend_img);

									m_cl_recommend_img
											.forEach(function(item) {
												let heartClassId = item
														.querySelector('.m_cl_heart .m_r_heart_label').htmlFor
														.substring(5);
												;

												console.dir(heartClassId);

												$
														.ajax({
															url : '${CONTEXT_PATH}/userclass/heartList',
															type : 'GET',
															cache : false,
															dateType : 'json',
															data : {
																classId : heartClassId,
															},
															success : function(
																	result) {

																if (result !== 0) {
																	$(
																			'#heart'
																					+ heartClassId)
																			.attr(
																					'checked',
																					true);
																}
															}
														})

											});
								</script>


								<div class="m_cl_main_tab">
										<p class="m_cl_like_last">
												<a href="">관심클래스 </a>
										</p>
								</div>

								<p class="m_cl_like_last1">
										<a href="">지난클래스</a>
								</p>

								<!-- 관심챌린지 -->
								<div class="m_cl_list"></div>
								<div class="m_page_nation page_nation"></div>
								<form id="mactionForm" action="/ex/mypage/classlikelist"
										method="get">
										<input type="hidden" name="pageNum"
												value="${pageMaker.cri.pageNum}"> <input
												type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</form>

						</div>

						<div class="m_c_list1"></div>
						<div class="m_page_nation1 page_nation"></div>
						<form id="mactionForm" action="/ex/mypage/classendlist"
								method="get">
								<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum}"> <input type="hidden"
										name="amount" value="${pageMaker.cri.amount}">
						</form>

						<script>
							function classlikelist(page) {

								$.ajax({
											url : 'http://localhost:8282/ex/ajax/classlikelist.json',
											type : 'GET',
											cache : false,
											dateType : 'json',

											data : {
												pageNum : page
											},
											success : function(result) {
												console.log(result);
												var list = result['list'];
												var jebal = result['jebal'];
												var pagination = result['pageMaker'];
												var htmls = "";
												var htmls2 = "";

												for (let j = 0; j < list.length; j++) {
													for (let i = 0; i < jebal.length; i++) {
														if (list[j].classId === jebal[i].classId) {
															list[j] = jebal[i];
														}
													}
												}

												if (list.length < 1) {
													htmls += '<div class="m_cl_list_not">';
													htmls += '하트를 누른 챌린지가 없습니다.';
													htmls += '</div>';

												} else {
													$(list).each(
																	function() {
																		htmls += '<div class="m_cl_list_detail">';
																		htmls += '<div class="m_cl_list_img">';
																		htmls += '<img src="/ex/resources/src/img/icon/360-250.png">';
																		htmls += '</div>';

																		htmls += '<div class="m_cl_trainer_name">'
																		htmls += this.iuserVO.userNickname;
																		htmls += '</div>';

																		htmls += '<div class="m_cl_list_title">';
																		htmls += '<a href="c_detail_before?classId='
																				+ this.classId
																				+ '">';
																		htmls += this.classTitle;
																		htmls += '</a>';
																		htmls += '</div>';

																		htmls += '<div class=" m_cl_list_date">'
																				+ this.classStartDate
																				+ '~'
																				+ this.classEndDate
																				+ '</div>';

																		htmls += '<div class="m_cl_data_tags">';
																		htmls += '<div class="m_cl_data_tag_blue">';
																		htmls += '<i class="m_cl_iruri_time_icon"></i>';
																		htmls += this.classLevel;
																		htmls += '</div>';

																		htmls += '<div class="m_cl_data_tag_blue">';
																		for (var i = 0; i < this.exerciseDateList.length; i++) {
																			htmls += this.exerciseDateList[i].exerciseDate;
																					
																		}
																		htmls += '</div>';
																		
																		

																		/* 		htmls += '<div class="m_cl_data_tag_red">';	
																				for(var i = 0; i < this.exerciseKindList.length; i++) {
																					
																				
																				htmls += 	'<i class="m_cl_iruri_level_icon"></i>' + this.exerciseKindList[i].exerciseKind;																						
																				  }
																				htmls += '</div>'; */

																		htmls += '<div class="pt_icon">';
																		for (var i = 0; i < this.exerciseKindList.length; i++) {
																			htmls += '<div class="pt_icon-red">'
																					+ this.exerciseKindList[i].exerciseKind
																					+ '</div>';
																		}
																		htmls += '</div>';

																		htmls += '</div>';

																		htmls += '<div class="m_cl_list_price">₩';
																		htmls += +this.classPrice;
																		+'원)';
																		htmls += '</div>';

																		htmls += '<div class="m_cl_list_heart">';
																		htmls += '<input type="checkbox" id="heart' + this.classId + '"checked>';
																		htmls += '<label for="heart' + this.classId + '" class="m_heart_label"></label>';
																		htmls += '</div>';

																		htmls += '</div>';

																	});

													if (pagination['prev']) {
														htmls2 += '<a class="arrow prev" href="javascript:list('
																+ (pagination['startPage'] - 1)
																+ '"></a>';
													}

													// 번호를 표시하는 부분
													for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
														if (page !== idx) {
															htmls2 += '<a class="pageNumLink" href="javascript:classlikelist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														} else {
															htmls2 += '<a class="pageNumLink active" href="javascript:classlikelist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														}
													}

													if (pagination['next']) {
														htmls2 += '<a class="arrow next" href="javascript:list('
																+ (pagination['endPage'] + 1)
																+ ')"></a>';

													}

												}
												$(".m_cl_list").html(htmls);
												$(".m_page_nation")
														.html(htmls2);

												$('.m_heart_label')
														.on(
																'click',
																function(e) {
																	let forStr = e.currentTarget.htmlFor
																	let classId = forStr
																			.substring(5);

																	$
																			.ajax({
																				url : '${CONTEXT_PATH}/userclass/heart',
																				type : 'GET',
																				cache : false,
																				dateType : 'json',
																				data : {
																					classId : classId,
																				}
																			});
																});

											}

										});

							}

							$(document).ready(function() {
								classlikelist(1);
							});
						</script>

						<script>
							function classendlist(page) {

								$
										.ajax({
											url : 'http://localhost:8282/ex/ajax/classendlist.json',
											type : 'GET',
											cache : false,
											dateType : 'json',

											data : {
												pageNum : page
											},
											success : function(result) {
												console.log(result);
												var endlist = result['endlist'];
												var jebal = result['jebal'];
												var pagination1 = result['pageMaker'];
												var htmls = "";
												var htmls2 = "";

												for (let j = 0; j < endlist.length; j++) {
													for (let i = 0; i < jebal.length; i++) {
														if (endlist[j].classId === jebal[i].classId) {
															endlist[j] = jebal[i];
														}
													}
												}

												if (endlist.length < 1) {
													htmls += '<div class="m_cl_list1_not">하트를 누른 챌린지가 없습니다.</div>';

												} else {
													$(endlist)
															.each(
																	function() {
																		htmls += '<div class="m_cl_list_detail">';
																		htmls += '<div class="m_cl_list_img">';
																		htmls += '<img src="/ex/resources/src/img/icon/360-250.png">';
																		htmls += '</div>';

																		htmls += '<div class="m_cl_trainer_name">';
																		htmls += this.iuserVO.userNickname;
																		htmls += '</div>';

																		htmls += '<div class="m_cl_list_title">';
																		htmls += '<a href="c_detail_before?classId='
																				+ this.classId
																				+ '">';
																		htmls += this.classTitle;
																		htmls += '</a>';
																		htmls += '</div>';

																		htmls += '<div class=" m_cl_list_date">'
																				+ this.classStartDate
																				+ '~'
																				+ this.classEndDate
																				+ '</div>';

																		htmls += '<div class="m_cl_data_tags">';
																		htmls += '<div class="m_cl_data_tag_blue">';
																		htmls += '<i class="m_cl_iruri_time_icon"></i>';
																		htmls += this.classLevel;
																		htmls += '</div>';

																		htmls += '<div class="m_cl_data_tag_blue">';
																		for (var i = 0; i < this.exerciseDateList.length; i++) {
																			htmls += this.exerciseDateList[i].exerciseDate;
																					
																		}
																		htmls += '</div>';

																		/* 																		htmls += '<div class="m_cl_data_tag_red">';
																		 htmls += '<i class="m_cl_iruri_level_icon"></i>'; */

																		htmls += '<div class="pt_icon">';
																		for (var i = 0; i < this.exerciseKindList.length; i++) {
																			htmls += '<div class="pt_icon-red">'
																					+ this.exerciseKindList[i].exerciseKind
																					+ '</div>';
																		}
																		htmls += '</div>';

																		htmls += '</div>';

																		htmls += '<div class="m_cl_list_price">₩';
																		htmls += +this.classPrice;
																		+'원)';
																		htmls += '</div>';

																		htmls += '</div>';

																	});

													if (pagination1['prev']) {
														htmls2 += '<a class="arrow prev" href="javascript:endlist('
																+ (pagination1['startPage'] - 1)
																+ '"></a>';
													}
													// 번호를 표시하는 부분
													for (var idx = pagination1['startPage']; idx <= pagination1['endPage']; idx++) {
														if (page !== idx) {
															htmls2 += '<a class="pageNumLink" href="javascript:classendlist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														} else {
															htmls2 += '<a class="pageNumLink active" href="javascript:classendlist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														}
													}

													if (pagination1['next']) {
														htmls2 += '<a class="arrow next" href="javascript:endlist('
																+ (pagination1['endPage'] + 1)
																+ ')"></a>';

													}

												}
												$(".m_c_list1").html(htmls);
												$(".m_page_nation1").html(
														htmls2);

											}

										});

							}

							$(document).ready(function() {
								classendlist(1);
							});
						</script>
						
						
			
						
						
						<!-- <div class="m_cl_list_detail"> <div class="m_cl_list_img"> <div
                                                                            class="m_cl_list_mark">1:1</div> </div> <div class="m_cl_trainer_name"> 트레이너 보검
                                                                            </div> <div class="m_cl_list_title"> 스쿼트, 런지, 플랭크<br> 30일 챌린지 </div> <div
                                                                            class="m_cl_list_date"> 2021.03.01~2021.04.01 </div> <div
                                                                            class="m_cl_data_tags"> <div class="m_cl_data_tag_blue"> <i
                                                                            class="m_cl_iruri_level_icon"></i> easy </div> <div class="m_cl_data_tag_blue">
                                                                            <i class="m_cl_iruri_time_icon"></i> 주 5회 이상 </div> </div> <div
                                                                            class="m_cl_data_tags"> <div class="m_cl_data_tag_red"> <i
                                                                            class="m_cl_data_tag_red_content">댄스</i> <i
                                                                            class="m_cl_data_tag_red_content">필라테스</i> </div> </div> <div
                                                                            class="m_cl_list_price"> 59,000원 </div> <div class="m_cl_list_heart"> <input
                                                                            type="checkbox" id="heart4"><label for="heart4"
                                                                            class="m_cl_heart_label"></label> </div> </div> <div class="m_cl_list_detail">
                                                                            <div class="m_cl_list_img"> <div class="m_cl_list_mark">1:1</div> </div> <div
                                                                            class="m_cl_trainer_name"> 트레이너 보검 </div> <div class="m_cl_list_title"> 스쿼트, 런지,
                                                                            플랭크<br> 30일 챌린지 </div> <div class="m_cl_list_date"> 2021.03.01~2021.04.01 </div>
                                                                            <div class="m_cl_data_tags"> <div class="m_cl_data_tag_blue"> <i
                                                                            class="m_cl_iruri_level_icon"></i> easy </div> <div class="m_cl_data_tag_blue">
                                                                            <i class="m_cl_iruri_time_icon"></i> 주 5회 이상 </div> </div> <div
                                                                            class="m_cl_data_tags"> <div class="m_cl_data_tag_red"> <i
                                                                            class="m_cl_data_tag_red_content">댄스</i> <i
                                                                            class="m_cl_data_tag_red_content">필라테스</i> </div> </div> <div
                                                                            class="m_cl_list_price"> 59,000원 </div> <div class="m_cl_list_heart"> <input
                                                                            type="checkbox" id="heart5"><label for="heart5"
                                                                            class="m_cl_heart_label"></label> </div> </div> -->

						<!-- 팝업창 -->
						<div class="modal" max-width:="max-width:" 400px;="400px;"
								min-width:="min-width:" 500px;="500px;" margin:="margin:"
								auto;="auto;" background-color:="background-color:"
								#eee;="#eee;">
								<div class="modal_content" title="클릭하면 창이 닫힙니다.">
										<div class="alertWindow">
												<div class="alertWindow_close">
														<img src='/ex/resources/src/img/icon/close.png'
																width="20px" height="20px">
												</div>
												<div class="alertWindow_insert">
														<h2 class="alertWindow_title">정보수정</h2>
														<form action="#">
																<p>비밀번호</p>
																<input class="inputbox_size1" type="text" />

																<p>비밀번호 확인</p>
																<input class="inputbox_size1" type="text" />

																<p>닉네임</p>
																<input class="inputbox_size2" type="text">
																<p>전화번호</p>
																<input class="inputbox_size2" type="text">

																<button class="alertWindow_submit" type="submit">비밀번호
																		변경</button>
														</form>
												</div>
										</div>
								</div>
						</div>

						<!-- 클래스취소 -->
						<div class="class_cancel" max-width:="max-width:" 400px;="400px;"
								min-width:="min-width:" 500px;="500px;" margin:="margin:"
								auto;="auto;" background-color:="background-color:"
								#eee;="#eee;">
								<div class="modal_content" title="클릭하면 창이 닫힙니다.">
										<div class="alertWindow_class">
												<div class="alertWindow_close">
														<img src='/ex/resources/src/img/icon/close.png'
																width="20px" height="20px">
												</div>
												<div class="alertWindow_insert">
														<h2 class="alertWindow_title">클래스 취소</h2>
														<form action="class_delete" id="class_delete" method="GET">
															<input type="hidden" name="hihi2" value="hihi2">
																<p class="alertWindow_content">
																		클래스 구매를<br> 취소하시겠습니까?<br></p>
																		<div class="class_cancle_info">*pt가 시작된 클래스는 환불규정에 따라 환불됩니다.</div>
																
																<button class="alertWindow_submit_class" type="submit">클래스취소</button>
														</form>
												</div>
										</div>
								</div>
						</div>

				</main>

				<%@ include file="../include/footerTemplate.jsp"%>

		</div>
</body>




<script>
function challengeSlideFunc() {
	const slides = document.querySelector('.m_cl_slides ul');
	slide = document.querySelectorAll('.m_cl_slides .m_cl_recommend_img'),
	slideCount = slide.length,
	prevBtn = document.querySelector('.m_cl_recommend .m_cl_left'),
	slideWidth = 490, slideMargin = 97,
	MoveSlide = slideWidth + slideMargin,
	nextBtn = document.querySelector('.m_cl_recommend .m_cl_right');
	let currentIdx = 0;
					
	console.log(slides);
	console.log(slide);
	console.log(prevBtn);
	console.log(nextBtn);
	
	//slide 배열
	for (var i = 0; i < slide.length; i++) {
		slide[i].style.left = (slideWidth * i + slideMargin * i)
				+ 'px';
	}

	//slide 이동 함수
	function goToSlide(num) {
		slides.style.left = -num * MoveSlide + 'px';
		currentIdx = num;
	}

	// 버튼을 클릭하면 슬라이드 이동시키기
	nextBtn.addEventListener('click', function() {
		if (currentIdx < slideCount - 2) {
			goToSlide(currentIdx + 2);
		} else {
			goToSlide(0);
		}
	});
	prevBtn.addEventListener('click', function() {
		if (currentIdx > 0) {
			goToSlide(currentIdx - 2);
		} else {
			goToSlide(slideCount - 2);
		}
	});
}

$(document).ready(() => {
	challengeSlideFunc();
});
</script>
</html>
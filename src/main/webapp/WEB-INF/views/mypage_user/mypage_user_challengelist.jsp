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
<title>마이페이지 챌린지리스트</title>
<script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
<link rel="stylesheet"
		href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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


<script>
/* new Swiper('.swiper-container', { speed: 300, slidesPreView :2,
slidesPerGroup : 2, /* loop:true, navigation: { nextEl:
'.swiper-button-next', prevEl: '.swiper-button-prev', }, pagination:{
el:'.swiper-pagination', type:'bullets', clickable:true, }, }); */ /*
var swiper = new Swiper(".mySwiper", { slidesPerView: 2, spaceBetween:
30, freeMode: true, pagination: { el: ".swiper-pagination", clickable:
true, }, }); */
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
														<c:if
														test="${user.authList[0].authContent eq 'ROLE_PAYUSER'}">
														<div>프리미엄 회원</div>
												</c:if>
														<br>${user.userEmail}</div>
										</div>
      <div id = "m_userboard_box">
        <div id="m_userboard"><a href="/ex/mypage/boardlist">작성글</a></div>
        <div id ="m_userboard_number">${boardcount}</div>
      </div>
      <div id = "m_userpoint_box">
        <div id="m_userpoint"><a href="/ex/mypage/pointlist">보유포인트</a></div>
        <div id ="m_userpoint_number">${totalpoint}</div>
      </div>
      <div id = "m_userchanllenge_box">
        <div id="m_userchanllenge"><a href="/ex/mypage/challengelist">참여중인챌린지</a></div>
        <div id="m_userchanllenge_number">${userchallengecount}</div>
      </div>
      <div id = "m_userclass_box">
        <div id="m_userclass"><a href="/ex/mypage/classlist">참여중인클래스</a></div>
        <div id="m_userclass_number">${userclasscount} </div>
      </div>
								</div>

								<!-- 챌린지 리스트박스 -->

								<div class="m_chanllenge_box">
										<div id="m_now_chanllengelist_box">
												<div id="m_now_chanllengelist">신청챌린지</div>
												<div id="m_now_chanllengelistnb">${userchallengecount}</div>

										</div>
										<div id="m_pre_chanllengelist_box">
												<div id="m_pre_chanllengelist">관심챌린지</div>
												<div id="m_pre_chanllengelistnb">${userlikecount}</div>
										</div>
										<div id="m_use_chanllengelist_box">
												<div id="m_use_chanllengelist">지난챌린지</div>
												<div id="m_use_chanllengelistnb">${endcount}</div>
										</div>
								</div>




								<!-- 신청한 챌린지 -->
								<div class="m_c_text">신청챌린지</div>


								<!--신청챌린지 이미지 2개-->
								<div class=" m_c_recommend">
										<img class="m_left" role="button" 
												src="/ex/resources/src/img/icon/arrow_blue_left.png">
										<div class="m_c_slides">
										<ul >
												<c:forEach var="userchallengelist"
														items="${userchallengelist}" varStatus="status">
														<div >
														<%-- <img src="${CONTEXT_PATH}/iruri/display?fileName=${userchallengelist.classImage}" alt="" style="position: absolute;">  --%>
															 <img alt="" class="m_c_recommend_img" src="${CONTEXT_PATH}/iruri/display?fileName=${userchallengelist.classImage}" alt="" > 
															 <!-- <div style="width: 100%; height: 100%;"> -->
																<button class="m_cl_cancel_challenge_bt" id="${userchallengelist.classId}">챌린지취소</button>
																<div class="m_c_recommend_title"><a href="/ex/iruri/challenge_detail_after?classId=${userchallengelist.classId}">
																		${userchallengelist.classTitle}<br>
																		</a>
																
																</div>

																<span class="m_c_recommend_date">
																		${userchallengelist.classStartDate}~
																		${userchallengelist.classEndDate} </span>

																<div class="m_c_heart">
																		<input type="checkbox"
																				id="heart${userchallengelist.classId}"><label
																				for="heart${userchallengelist.classId}"
																				class="m_r_heart_label"></label>
																</div>
																
																<!-- </div> -->
														</div>

												</c:forEach>
										</ul>
										</div>
										<img class="m_right" role="button" 
												src="/ex/resources/src/img/icon/arrow_blue_right.png">

								</div>

								<script>
								$(document).ready(function hihi(){
									$(".m_cl_cancel_challenge_bt").click(function(){
											var hihi = $(this).attr('id');
											console.log(hihi);
										
											$('input[name="hihi"]').attr('value',hihi);
									
									});
									
								
									});
								/* document.getElementById('hihi').value = hihi(); */
								
								
								

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
																	url : '${CONTEXT_PATH}/userchallenge/heart',
																	type : 'GET',
																	cache : false,
																	dateType : 'json',
																	data : {
																		classId : classId,
																	}
																});
													});

									const m_c_recommend_img = document
											.querySelectorAll('.m_c_recommend_img');
									
									

									m_c_recommend_img
											.forEach(function(item) {
												let heartClassId = item.querySelector('.m_c_heart .m_r_heart_label').htmlFor.substring(5);
												

												$.ajax({
															url : '${CONTEXT_PATH}/userchallenge/heartList',
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
								<!-- 챌린지 취소 버튼 (모달) -->





								<!-- 관심 챌린지 -->
								<div class="m_c_main_tab">
										<p class="m_c_like_last">
												<a href="">관심챌린지</a>
										</p>
								</div>



								<p class="m_c_like_last1">
										<a href="">지난챌린지</a>
								</p>






								<div class="m_c_list"></div>

								<div class="m_page_nation page_nation"></div>
								<form id="mactionForm" action="/ex/mypage/challengelist"
										method="get">
										<input type="hidden" name="pageNum"
												value="${pageMaker.cri.pageNum}"> <input
												type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</form>



								<div class="m_c_list1"></div>
								<div class="m_page_nation1 page_nation"></div>
								<form id="mactionForm" action="/ex/mypage/endchallengelist"
										method="get">
										<input type="hidden" name="pageNum"
												value="${pageMaker.cri.pageNum}"> <input
												type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</form>


	</div>


				<!-- 팝업창  -->
				<div class="modal">
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


							<!-- 챌린지취소  -->
						<div class="challenge_cancel" >
										<div class="modal_content" title="클릭하면 창이 닫힙니다.">
												<div class="alertWindow_class">
														<div class="alertWindow_close">
																<img src="/ex/resources/src/img/icon/close.png"
																		width="20px" height="20px">
														</div>
														<div class="alertWindow_insert">
																<h2 class="alertWindow_title">챌린지 취소</h2>
																<form method="GET" id="challenge_delete" action="challenge_delete">
																		<input type="hidden" name="hihi" value="hihi">
																		
																		<p class="alertWindow_content">
																				정말로 챌린지를<br> 취소하시겠습니까?<br>챌린지는시작전에 다시신청
																				가능합니다.
																		</p>
																		<button class="alertWindow_submit_class" type="submit">챌린지취소</button>
																</form>
														</div>
												</div>
										</div>
										
								</div>

						
						
						<script>
							function likelist(page) {

								$
										.ajax({
											url : 'http://localhost:8282/ex/ajax/challengelist.json',
											type : 'GET',
											cache : false,
											dateType : 'json',

											data : {
												pageNum : page,

											},
											success : function(result) {
												var list = result['list'];
												var pagination = result['pageMaker'];
												var htmls = "";
												var htmls2 = "";

												if (list.length < 1) {
													htmls += '<div class="m_c_list_not">';
													htmls += '하트를 누른 챌린지가 없습니다.';
													htmls += '</div>';

												} else {
													$(list)
															.each(
																	function() {
																		htmls += '<div class="m_c_list_detail">';
																		 htmls += '<div class="m_c_list_img">'; 
																		htmls += '<img class="m_c_list_img_please" src="${CONTEXT_PATH}/iruri/display?fileName=' + this.classImage + '" alt="">';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_title">';
																		htmls += '<a href="/ex/iruri/challenge_detail_before?classId='
																				+ this.classId
																				+ '">';
																		htmls += this.classTitle;
																		htmls += '</a>';
																		htmls += '</div>';

																		htmls += '<div class=" m_c_list_date">'
																				+ this.classStartDate
																				+ '~'
																				+ this.classEndDate
																				+ '</div>';

																		htmls += '<div class="m_data_tags">';
																		htmls += '<div class="m_data_tag_blue">';
																		htmls += '<i class="m_iruri_time_icon"></i>';
																		htmls += this.classLevel;
																		htmls += '</div>';

																		htmls += '<div class="m_data_tag_blue">';
																		htmls += '<i class="m_iruri_level_icon"></i>주';
																		htmls += this.classExerciseCount
																				+ '회 이상';
																		htmls += '</div>';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_price">';
																		htmls += '참여중인 인원'
																				+ this.classJoinMember
																				+ '명';
																		htmls += '(최대인원'
																				+ this.classTotalMember
																				+ '명)';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_heart">';

																		htmls += '<input type="checkbox" id="heart'+this.classId+'" checked>';
																		htmls += '<label for="heart'+this.classId+'" class="m_heart_label"></label>';
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
															htmls2 += '<a class="pageNumLink" href="javascript:likelist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														} else {
															htmls2 += '<a class="pageNumLink active" href="javascript:likelist('
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
												$(".m_c_list").html(htmls);
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
																				url : '${CONTEXT_PATH}/userchallenge/heart',
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
								likelist(1);
							});
						</script>




						<script>
							function endlist(page) {

								$
										.ajax({
											url : 'http://localhost:8282/ex/ajax/endchallengelist.json',
											type : 'GET',
											cache : false,
											dateType : 'json',

											data : {
												pageNum : page,

											},
											success : function(result) {
												var endlist = result['endlist'];
												var pagination1 = result['pageMaker'];
												var htmls = "";
												var htmls2 = "";

												if (endlist.length < 1) {
													htmls += '<div class="m_c_list1_not">';
													htmls += '지난 챌린지가 없습니다.';
													htmls += '</div>';

												} else {
													$(endlist)
															.each(
																	function() {
																		htmls += '<div class="m_c_list_detail">';
																		 htmls += '<div class="m_c_list_img">'; 
																			
																			htmls += '<img class="m_c_list_img_please" src="${CONTEXT_PATH}/iruri/display?fileName=' + this.classImage + '" alt="">';
																			htmls += '</div>';

																		htmls += '<div class="m_c_list_title">';
																		htmls += '<a href="/ex/iruri/challenge_detail_before?classId='
																				+ this.classId
																				+ '">';
																		htmls += this.classTitle;
																		htmls += '</a>';
																		htmls += '</div>';

																		htmls += '<div class=" m_c_list_date">'
																				+ this.classStartDate
																				+ '~'
																				+ this.classEndDate
																				+ '</div>';

																		htmls += '<div class="m_data_tags">';
																		htmls += '<div class="m_data_tag_blue">';
																		htmls += '<i class="m_iruri_time_icon"></i>';
																		htmls += this.classLevel;
																		htmls += '</div>';

																		htmls += '<div class="m_data_tag_blue">';
																		htmls += '<i class="m_iruri_level_icon"></i>주';
																		htmls += this.classExerciseCount
																				+ '회 이상';
																		htmls += '</div>';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_price">';
																		htmls += '참여중인 인원'
																				+ this.classJoinMember
																				+ '명';
																		htmls += '(최대인원'
																				+ this.classTotalMember
																				+ '명)';
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
															htmls2 += '<a class="pageNumLink" href="javascript:endlist('
																	+ idx
																	+ ')">'
																	+ (idx)
																	+ "</a>";
														} else {
															htmls2 += '<a class="pageNumLink active" href="javascript:endlist('
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
								endlist(1);
							});
						</script>














				</main>

				<%@ include file="../include/footerTemplate.jsp"%>

		</div>
</body>

<script>
function challengeSlideFunc() {
	const slides = document.querySelector('.m_c_slides ul');
	slide = document.querySelectorAll('.m_c_slides .m_c_recommend_img'),
	slideCount = slide.length,
	prevBtn = document.querySelector('.m_c_recommend .m_left'),
	slideWidth = 490, slideMargin = 97,
	MoveSlide = slideWidth + slideMargin,
	nextBtn = document.querySelector('.m_c_recommend .m_right');
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
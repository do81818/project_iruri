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
														<li class="m_c_recommend_img">
																<button class="m_cl_cancel_challenge_bt">챌린지취소</button>
																<div class="m_c_recommend_title">
																		${userchallengelist.classTitle}<br>
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
														</li>

												</c:forEach>
										</ul>
										</div>
										<img class="m_right" role="button" 
												src="/ex/resources/src/img/icon/arrow_blue_right.png">

								</div>






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


								<%--     <div class="m_c_list">
   <c:forEach var="userlikelist" items="${userlikelist}" varStatus="status">
      <div class="m_c_list_detail">
          <img class="m_c_list_img" src="/ex/resources/src/img/icon/360-250.png">
 
        </div>
          
          <div class="m_c_list_title">
              ${userlikelist.classTitle}
          </div>

          <div class="m_c_list_date">
              ${userlikelist.classStartDate}~${userlikelist.classEndDate}
          </div>

          <div class="m_data_tags">
              <div class="m_data_tag_blue">
                  <i class="m_iruri_level_icon"></i> ${userlikelist.classLevel}
              </div>
              <div class="m_data_tag_blue">
                  <i class="m_iruri_time_icon"></i>  주${userlikelist.classExerciseCount}일
              </div>
              
          </div>

          <div class="m_c_list_price">
            참여중인 인원 ${userlikelist.classJoinMember}명 (최대인원 ${userlikelist.classTotalMember}명)
          </div>

          <div class="m_c_list_heart">
              <input type="checkbox" id="heart${userlikelist.classId}"><label for="heart${userlikelist.classId}" class="m_heart_label"></label>
          </div>
    </div>


</c:forEach>



<!--     <div class="m_c_list_detail">
      <div class="m_c_list_img">

    </div>
      
      <div class="m_c_list_title">
          스쿼트, 런지, 플랭크<br> 30일 챌린지
      </div>

      <div class="m_c_list_date">
          2021.03.01~2021.04.01
      </div>

      <div class="m_data_tags">
          <div class="m_data_tag_blue">
              <i class="m_iruri_level_icon"></i> easy
          </div>
          <div class="m_data_tag_blue">
              <i class="m_iruri_time_icon"></i> 주 5회 이상
          </div>
          
      </div>

      <div class="m_c_list_price">
        참여중인 인원 00명 (최대인원 20명)
      </div>

        <div class="m_c_list_heart">
            <input type="checkbox" id="heart4"><label for="heart4" class="m_heart_label"></label>
        </div>
  </div>

  <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        스쿼트, 런지, 플랭크<br> 30일 챌린지
    </div>

    <div class="m_c_list_date">
        2021.03.01~2021.04.01
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> easy
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 5회 이상
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 00명 (최대인원 20명)
    </div>

    <div class="m_c_list_heart">
        <input type="checkbox" id="heart5"><label for="heart5" class="m_heart_label"></label>
    </div>
</div>
 -->
 <div class="m_page_nation">
        <a class="m_arrow_prev" href="#"></a>
        <a href="#" class="m_active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a class="m_arrow_next" href="#"></a>
    </div>
  </div> --%>




								<!-- 지난챌린지 -->



								<!-- <div class="m_c_list"> -->
								<%-- <c:forEach var="userendlist" items="${userendlist}">


  <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        ${userendlist.classTitle}
    </div>

    <div class="m_c_list_date">
        ${userendlist.classStartDate}~${userendlist.classEndDate}
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> ${userendlist.classLevel}
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 ${userendlist.classExerciseCount} 일
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 ${userendlist.classJoinMember}명 (최대인원 ${userendlist.classTotalMember}명)
    </div>

  </div>
  
</c:forEach>
 --%>

								<!--   <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        스쿼트, 런지, 플랭크<br> 30일 챌린지
    </div>

    <div class="m_c_list_date">
        2021.03.01~2021.04.01
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> easy
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 5회 이상
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 00명 (최대인원 20명)
    </div>

</div>

<div class="m_c_list_detail">
  <div class="m_c_list_img">

</div>
  
  <div class="m_c_list_title">
      스쿼트, 런지, 플랭크<br> 30일 챌린지
  </div>

  <div class="m_c_list_date">
      2021.03.01~2021.04.01
  </div>

  <div class="m_data_tags">
      <div class="m_data_tag_blue">
          <i class="m_iruri_level_icon"></i> easy
      </div>
      <div class="m_data_tag_blue">
          <i class="m_iruri_time_icon"></i> 주 5회 이상
      </div>
      
  </div>

  <div class="m_c_list_price">
    참여중인 인원 00명 (최대인원 20명)
  </div>

</div>
 -->
								<!--   <div class="m_page_nation">
      <a class="m_arrow_prev" href="#"></a>
      <a href="#" class="m_active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a class="m_arrow_next" href="#"></a>
  </div> 

</div> -->



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





								<!-- 팝업창  -->
								<div class="modal"max-width: 400px;
    min-width: 500px;
    margin: 0 auto;
    background-color:#eee;>
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


								<!-- 챌린지취소  -->
								<div class="challenge_cancel"max-width: 400px;
      min-width: 500px;
      margin: 0 auto;
      background-color:#eee;>
										<div class="modal_content" title="클릭하면 창이 닫힙니다.">
												<div class="alertWindow_class">
														<div class="alertWindow_close">
																<img src="/ex/resources/src/img/icon/close.png"
																		width="20px" height="20px">
														</div>
														<div class="alertWindow_insert">
																<h2 class="alertWindow_title">챌린지 취소</h2>
																<form action="#">
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
																		htmls += '<img src="/ex/resources/src/img/icon/360-250.png">';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_title">';
																		htmls += '<a href="c_detail_before?classId='
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
																		htmls += '<img src="/ex/resources/src/img/icon/360-250.png">';
																		htmls += '</div>';

																		htmls += '<div class="m_c_list_title">';
																		htmls += '<a href="c_detail_before?classId='
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
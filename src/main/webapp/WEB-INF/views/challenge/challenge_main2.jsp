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
<title>챌린지 메인</title>
<!-- 페이지 이름을 적어주세요 -->

<script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_select.js" defer></script>


<!-- <script type="text/javascript">
        window.onload = function() {

            $.ajax({
                url: 'http://localhost:8282/ex/iruri/challengeAllList',
                type: 'GET',
                cache: false,
                dataType: 'json',
                success: function(list) {

                	var htmls = '';

                	  if (list.length < 1) {
                          htmls = '현재 등록된 챌린지가 없습니다.';
                      } else {
                        
                        const challengeList = document.querySelector('.c_list');

                    list.forEach(function(listItem) {
                        console.log(listItem.classStartDate);
                        htmls += '<div class="c_list_detail">';
                        htmls +=    '<div class="c_list_img">';
                        htmls +=        '<img src="/ex/resources/src/img/icon/360-250.png">';
                        htmls +=    '</div>';

                        htmls +=    '<div class="c_list_title">';
                        htmls +=        listItem.classTitle;
                        htmls +=    '</div>';

                        htmls +=    '<div class="c_list_date">' + listItem.classStartDate + '~' + listItem.classEndDate + '</div>';
                        
                        htmls +=    '<div class="data_tags">';
                        htmls +=        '<div class="data_tag_blue">';
                        htmls +=            '<i class="iruri_time_icon"></i>';
                        htmls +=                listItem.classLevel;
                        htmls +=         '</div>';

                        htmls +=        '<div class="data_tag_blue">';
                        htmls +=            '<i class="iruri_time_icon"></i>주';
                        htmls +=                listItem.classExerciseCount + '회 이상';
                        htmls +=        '</div>';
                        htmls +=     '</div>';

                        htmls +=        '<div class="c_list_person">';
                        htmls +=                '참여중인 인원' + listItem.classJoinMember + '명';
                        htmls +=                '(최대인원' + listItem.classTotalMember + '명)';
                        htmls +=        '</div>';

                        htmls +=    '<div class="c_list_heart">';
                        htmls += 	'<input type="checkbox" id="heart3">';
                        htmls += 	'<label for="heart3" class="heart_label">';
                        htmls += 	'</label>';
                        htmls += '</div>';

                        htmls += '</div>';

                        
                    });

                    challengeList.innerHTML = htmls;
                    page.innerHTML = htmls2;
                    }
			
			}
		});
	}
    </script> -->
<script>
	$(document).ready(function(){
		/* window.onload = function(){ */
		var actionForm = $("#actionForm");
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
	
	
	//챌린지 검색
	$(".search_icon").on("click", function(e){
		e.preventDefault();
		let val = $("input[name='keyword']").val();
		moveForm.find("input[name='keyword']").val(val);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});
	</script>





</head>
<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>

		<main>
			<div class="c_container">

				<div class="c_category">챌린지</div>

				<div class="c_text">추천챌린지</div>


				<!--추천챌린지 이미지 2개-->
				<div class="c_recommend">
					<div class="c_recommend_img">

						<div class="c_recommend_title">
							스쿼트, 런지, 플랭크<br> 30일 챌린지
						</div>

						<span class="c_recommend_date"> 2021.03.01~2021.04.01 </span>


						<div class="c_heart">
							<input type="checkbox" id="heart1"><label for="heart1"
								class="heart_label"></label>
						</div>
					</div>



					<div class="c_recommend_img">
						<div class="c_recommend_title">러닝 전 5분 스트레칭</div>


						<span class="c_recommend_date"> 2021.03.01~2021.04.01 </span>


						<div class="c_heart">
							<input type="checkbox" id="heart2"><label for="heart2"
								class="heart_label"></label>
						</div>

					</div>
				</div>



				<div class="c_main_tab">
           		 <p class="c_like_last">
	                <input type="radio" id="c_tap1" name="c_taps" onclick="location.href='/ex/iruri/challengeList'" checked>
	                <label for="c_tap1">전체챌린지</label>
	                <input type="radio" id="c_tap2" name="c_taps" onclick="location.href='/ex/iruri/challengeLikeList'" >
	                <label for="c_tap2">관심챌린지</label>
	                <input type="radio" id="c_tap3" name="c_taps" onclick="location.href='/ex/iruri/challengeEndList'" >
	                <label for="c_tap3">지난챌린지</label>

            	</p>
       		 </div>



				<div class="c_search">
					<!--챌린지 검색창-->
					<div class = "c_search_div">
					<form class="c_search_box"  action="">

						<input type="text" placeholder="검색어를 입력하세요.(진행중인 챌린지 제목만 검색됩니다.)" value="${pageMaker.cri.keyword}">
						<button class="search_icon"></button>

					</form>
					</div>

					<!--정렬(셀렉트박스)-->
					<div id="select_wrap">
						<div id="select" class="select">인기순</div>
						<ul id="ul" class="select_ul">

							<li data-value="value 1">인기순</li>
							<li data-value="value 2">시작일순</li>
							<li data-value="value 3">평점순</li>
						</ul>
					</div>


					<!--챌린지개설버튼-->
					<button class="c_make_button">챌린지개설</button>

				</div>



				<!--챌린지 개설 시 경고창 나오는 모달창-->
				<div class="c_make_modal">

					<div class="c_make_modal_start">
						<div class="c_modal_close">
							<img src="/ex/resources/src/img/icon/close.png" alt=""
								onclick="img_cancle_click(this)">
						</div>
						<h2 class="c_make_modal_title">챌린지 개설 전 꼭 읽어주세요!</h2>

						<form action="/" method="POST" id="form_wrap">

							<ul class="c_make_modal_ul">
								<div class="input_check">
									<input type="checkbox" name="agree" id="check1" value="check1"
										required><label for="check1"
										class="c_make_modal_label">
										<li>이 정보를 사용하여 시스템의 라이센스 계약, 환경 주의사항, 안전 주의사항, 하드웨어 보증서 및
											보증 서비스를 이해하십시오.</li>

									</label>
								</div>

								<div class="input_check">
									<input type="checkbox" name="agree" id="check2" value="check2"
										required><label for="check2"
										class="c_make_modal_label">
										<li>이 정보를 사용하여 시스템의 라이센스 계약, 환경 주의사항, 안전 주의사항, 하드웨어 보증서 및
											보증 서비스를 이해하십시오.</li>

									</label>
								</div>

								<div class="input_check">
									<input type="checkbox" name="agree" id="check3" value="check3"
										required><label for="check3"
										class="c_make_modal_label">
										<li>이 정보를 사용하여 시스템의 라이센스 계약, 환경 주의사항, 안전 주의사항, 하드웨어 보증서 및
											보증 서비스를 이해하십시오.</li>

									</label>
								</div>

							</ul>

							<div class="modal_button">

								<button class="c_make_modal_cancle" type="reset"
									onclick="check_cancle_click(this)">챌린지 개설 취소</button>
								<button class="c_make_modal_submit" type="submit"
									disabled="disabled">챌린지 개설 진행</button>
							</div>
						</form>

					</div>
					<div class="modal_layer"></div>
				</div>


				<!--챌린지 리스트-->
				<div class="c_list"></div>


				<!--페이징-->
				<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
				<div class="page_nation"></div>
				<form id="actionForm" action="/ex/iruri/challengeList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
				
<script>
		function getlist(page) {
			

			    $.ajax({
			        //url : '${pageContext.request.contextPath}/rest/after.json',
			        url: 'http://localhost:8282/ex/ajax/challengeList.json',
			        //url : 'http://localhost:8282/ex/iruri/challengeList',
			        type: 'GET',
			        cache: false,
			        //contentType: false,
			        //processData: false,
			       	dateType:'json',
			   
			        data: {
			        	
			           pageNum : page,
			    
			       
			            
			
			            // Criteria 의 pageNum 의미함 restAfter 메소드에서 파라미터로 Criteria 가 있기 때문에
			            // 스프링 내부적으로 알아서 Criteria 안에 해당 멤버변수에 값할당
			            // url 상으론 /rest/after?pageNum=2 이런식
			        },
					success : function(result) {
						console.log(result);
				    	var list = result['list'];
						var pagination = result['pageMaker'];
						var htmls = "";
						var htmls2 = "";

						if (list.length < 1) {
							htmls = '현재 등록된 챌린지가 없습니다.';
						} else {
							//const challengeList = document.querySelector('.c_list');
							//const page = document.querySelector('.page_nation');

							$(list).each(function() {

												//챌린지 리스트 
												htmls += '<div class="c_list_detail">';
												htmls += '<div class="c_list_img">';
												htmls += '<img src="/ex/resources/src/img/icon/360-250.png">';
												htmls += '</div>';

												htmls += '<div class="c_list_title">';
												htmls += this.classTitle;
												htmls += '</div>';

												htmls += '<div class="c_list_date">'
														+ this.classStartDate
														+ '~'
														+ this.classEndDate
														+ '</div>';

												htmls += '<div class="data_tags">';
												htmls += '<div class="data_tag_blue">';
												htmls += '<i class="iruri_time_icon"></i>';
												htmls += this.classLevel;
												htmls += '</div>';

												htmls += '<div class="data_tag_blue">';
												htmls += '<i class="iruri_level_icon"></i>주';
												htmls += this.classExerciseCount
														+ '회 이상';
												htmls += '</div>';
												htmls += '</div>';

												htmls += '<div class="c_list_person">';
												htmls += '참여중인 인원'
														+ this.classJoinMember
														+ '명';
												htmls += '(최대인원'
														+ this.classTotalMember
														+ '명)';
												htmls += '</div>';

												htmls += '<div class="c_list_heart">';
												htmls += '<input type="checkbox" id="heart3">';
												htmls += '<label for="heart3" class="heart_label"></label>';
												htmls += '</div>';

												htmls += '</div>';
												

											});
							
							
							
					         /* ------------------ 페이징 부분 --------------------- */
	                        
					         if (pagination['prev']) {
	                             htmls2 += '<a class="arrow prev" href="javascript:list('+ (pagination['startPage']-1) +'"></a>';
	         				} 
	         				// 번호를 표시하는 부분
	         				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
	         					if (page !== idx) {
	         					   htmls2 += '<a class="pageNumLink" href="javascript:getlist('+ idx + ')">' + (idx) + "</a>";
	         					} else {
	         					   htmls2 += '<a class="pageNumLink active" href="javascript:getlist('+ idx + ')">' + (idx) + "</a>";
	         					}
	         				}
	         				
	         				if (pagination['next']) {
	                            htmls2 += '<a class="arrow next" href="javascript:list('+ (pagination['endPage']+1) +')"></a>';
	        						
	        				}			
	         			}	// if(list.length < 1) else 끝
	                     
	                        $(".c_list").html(htmls);
	         				$(".page_nation").html(htmls2);
	         				//challengeList.innerHTML = htmls;
							//page.innerHTML = htmls2;
	                     }
	                     
	                 });
	                             
	                             
	            }
		
		
	            $(document).ready(function() {
	                getlist(1);
	            });
							
							
							/* 
							htmls2 += '<c:if test="${pageMaker.prev}">';
							htmls2 += '<a class="prev" href="challengeList${pageMaker.makeQuery(pageMaker.startPage - 1) }"></a>';
							htmls2 += '</c:if>';

							htmls2 += '<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">';
							htmls2 += '<a href="challengeList${pageMaker.makeQuery(num)}" class="active">${num}</a>';
							htmls2 += '</c:forEach>';

							htmls2 += '<c:if test="${pageMaker.next && pageMaker.endPage > 0}">';
							htmls2 += '<a class="next" href="challengeList${pageMaker.makeQuery(pageMaker.endPage +1) }"></a>';
							htmls2 += '</c:if>';


							htmls2 += '<form id="actionForm" action="iruri/challengeList" method="get">';
							htmls2 += '<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">';
							htmls2 += '<input type="hidden" name="amount" value="${pageMaker.cri.amount}">';
							htmls2 += '</form>';
							
							
				
						
							challengeList.innerHTML = htmls;
							page.innerHTML = htmls2;
			    
						}
						
						

						
					}
				});
				
	} 
	*/
	
	

</script>

		</main>

		<%@ include file="../include/footerTemplate.jsp"%>

	</div>

</body>

</html>
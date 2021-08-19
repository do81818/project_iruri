<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

                <!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
                <c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
                <c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
                <c:set var="CONTEXT_PATH_CHALLENGE" value="${pageContext.request.contextPath}/iruri" scope="application" />
                <!DOCTYPE html>
                <html lang="ko">

                <head>
                    <%@ include file="../include/static.jsp"%>
                        <title>챌린지 메인</title>
                        <!-- 페이지 이름을 적어주세요 -->

                        <script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
                        <script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
                        <script src="${RESOURCES_PATH}/src/js/challenge/c_select.js" defer></script>



                        <script>
                            $(document).ready(function() {
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
                        </script>

                        <script>
                            //챌린지 검색
					
                            $(document).ready(function() {
                                $(".search_icon").on("click", function(e) {
                                    e.preventDefault(); 
                                });
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
										<c:forEach var="recommend" items="${recommendList}">
										<a href="${CONTEXT_PATH}/iruri/challengeJoinCheck?classId=${recommend.classId}" target="_blank">
                                        <div class="c_recommend_img" style="position: relative">
                                            <img src="${CONTEXT_PATH}/iruri/display?fileName=${recommend.classImage}" alt="" style="position: absolute;">
												<div style="width: 100%; height: 100%; padding: 45px">
	                                                <div class="c_recommend_title">
	                                                    ${recommend.classTitle}
	                                                </div>
	
	
	                                                <span class="c_recommend_date"> 
	                                            		${recommend.classStartDate}~${recommend.classEndDate} 
	                                           		</span>
	
	
	                                               
												</div>
                                        	</div>
                                        </a>
									</c:forEach>
                                  </div>
							 </div>
						


                                    <div class="c_main_tab">
                                        <p class="c_like_last">

                                            <input type="radio" id="c_tap1" name="c_taps" onclick="location.href='/ex/iruri/challengeList'">
                                            <label for="c_tap1">전체챌린지</label>
                                            <input type="radio" id="c_tap2" name="c_taps" onclick="location.href='/ex/iruri/challengeLikeList'">
                                            <label for="c_tap2">관심챌린지</label>
                                            <input type="radio" id="c_tap3" name="c_taps" onclick="location.href='/ex/iruri/challengeEndList'" checked>
                                            <label for="c_tap3">지난챌린지</label>
                                        </p>

                                    </div>


                                    <div class="c_search">
                                        <!--챌린지 검색창-->

                                            <form class="c_search_box" method="GET" action="/ajax/challengeEndList">

                                                <input type="text" class="keyword" autocomplete="off" id="keyword" name="keyword" placeholder="검색어를 입력하세요.(챌린지 제목으로 검색됩니다.)" />
                                                <button type="submit" class="search_icon" onclick="getlist(1)"></button>

                                            </form>


                                            <!--정렬(셀렉트박스)-->
                                            <div id="select_wrap">
                                                <div id="select" class="select">시작일순</div>
                                                <ul id="ul" class="select_ul">

                                                    <li data-value="value 1" onclick="getlist(1)">시작일순</li>
                                                    <li data-value="value 2" onclick="getlist(1)">인기순</li>

                                                </ul>
                                            </div>


                                         
                                            <!--챌린지개설버튼-->
											<!-- 비로그인 메뉴 -->
						   					 <sec:authorize access="isAnonymous()">
						   					 <div class="c_make_noLogin">챌린지개설</div>
						           		     </sec:authorize>
						           		     
						           		     <!-- 로그인 메뉴 -->
					    					<sec:authorize access="isAuthenticated()">
											<button class="c_make_button">챌린지개설</button>
					         				</sec:authorize>

                                    </div>



                                    <!--챌린지 개설 시 경고창 나오는 모달창-->
                                    <div class="c_make_modal">

                                        <div class="c_make_modal_start">
                                            <div class="c_modal_close">
                                                <img src="/ex/resources/src/img/icon/close.png" alt="" onclick="img_cancle_click(this)">
                                            </div>
                                            <h2 class="c_make_modal_title">챌린지 개설 전 꼭 읽어주세요!</h2>

                                            <form action="/" method="POST" id="form_wrap">

                                               <ul class="c_make_modal_ul">
                                                <div class="input_check">
                                                    <input type="checkbox" name="agree" id="check1" value="check1" required><label for="check1" class="c_make_modal_label">
										<li>챌린지는 참여 인원에 따라 혼자 또는 다수와 함께 할 수 있습니다.</li>

									</label>
                                                </div>

                                                <div class="input_check">
                                                    <input type="checkbox" name="agree" id="check2" value="check2" required><label for="check2" class="c_make_modal_label">
										<li>챌린지 삭제는 개설 후 시작일 전까지 개설자 외 다른 참여자가 없을 경우에만 가능합니다.</li>

									</label>
                                                </div>

                                                <div class="input_check">
                                                    <input type="checkbox" name="agree" id="check3" value="check3" required><label for="check3" class="c_make_modal_label">
										<li>챌린지가 시작되면 챌린지는 삭제할 수 없고, 중도 포기는 불가능 합니다.</li>

									</label>
                                                </div>

                                            </ul>
                                                <div class="modal_button">

                                                    <button class="c_make_modal_cancle" type="reset" onclick="check_cancle_click(this)">챌린지 개설 취소</button>
                                                    <button class="c_make_modal_submit" type="submit" disabled="disabled">챌린지 개설 진행</button>
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



                                    <script>
                                    
                                        function getlist(page) {

                                            var search = $("#keyword").val();
                        
                                            
											// 1. ajax로 챌린지 리스트를 배열의 형태로 가져온다.
											// 2. 1번을 어딘가에 보관한다.
											// 3. 2번을 가지고 정렬한다.
											
                                            $.ajax({

                                                url: 'http://localhost:8282/ex/ajax/challengeEndList',
                                                type: 'GET',
                                                cache: false,
                                                dateType: 'json',

                                                data: {

                                                    pageNum: page,
                                                    keyword: search

                                                    // Criteria 의 pageNum 의미함 restAfter 메소드에서 파라미터로 Criteria 가 있기 때문에
                                                    // 스프링 내부적으로 알아서 Criteria 안에 해당 멤버변수에 값할당
                                                    // url 상으론 /rest/after?pageNum=2 이런식
                                                },
                                                success: function(result) {
                                                    console.log(result);
                                                    var sortText = document.querySelector('#select').innerText;
                                                    var list = result['list'];
                                                    var pagination = result['pageMaker'];
                                                    var htmls = "";
                                                    var htmls2 = "";
                                                    
                                                    


                                                    if (list.length < 1) {
                                                    	htmls += '<div class="c_list_not">';
                            							htmls += '현재 등록된 챌린지가 없습니다.';
                            							htmls += '</div>';
                                                    } else {

														if(sortText === '인기순') {
															list = list.sort(function(a, b) {return b.classLike - a.classLike});															
														}
                                                    	
                                                        $(list).each(function() {

                                                        	
                                                            //챌린지 리스트
                                                            htmls += '<div class="c_list_detail">';
                                                            htmls += '<div class="c_list_img">';
                                                            htmls += '<img src="${CONTEXT_PATH}/iruri/display?fileName=' + this.classImage + '" alt="">';
                                                            htmls += '</div>';

                                                            htmls += '<div class="c_list_title">';
                                                            htmls += '<a href="challenge_detail_before?classId='+ this.classId +'"target="_blank">';
            												htmls += this.classTitle;
            												htmls += '</a>';
                                                            htmls += '</div>';

                                                            htmls += '<div class="c_list_date">' +
                                                                this.classStartDate +
                                                                '~' +
                                                                this.classEndDate +
                                                                '</div>';

                                                            htmls += '<div class="data_tags">';
                                                            htmls += '<div class="data_tag_blue">';
                                                            htmls += '<i class="iruri_time_icon"></i>';
                                                            htmls += this.classLevel;
                                                            htmls += '</div>';

                                                            htmls += '<div class="data_tag_blue">';
                                                            htmls += '<i class="iruri_level_icon"></i>주';
                                                            htmls += this.classExerciseCount +
                                                                '회 이상';
                                                            htmls += '</div>';
                                                            htmls += '</div>';

                                                            htmls += '<div class="c_list_person">';
                                                            htmls += '참여중인 인원' +
                                                                this.classJoinMember +
                                                                '명';
                                                            htmls += '(최대인원' +
                                                                this.classTotalMember +
                                                                '명)';
                                                            htmls += '</div>';

                                                     
                                                        	var heartClassId = this.classId;

                                                               $.ajax({
                                                                   url: '${CONTEXT_PATH}/iruri/heartList',
                                                                   type: 'GET',
                                                                   cache: false,
                                                                   dateType: 'json',
                                                                   data: {
                                                                       classId: heartClassId,
                                                                   },
                                                                   success: function(result) {

                                                                       if (result !== 0) {
                                                                           $('#heart' + heartClassId).attr('checked', true);
                                                                       }
                                                                   }
                                                               })
               												
                                                             
	                                               												
	                                               		
	                                               			   htmls += '<div class="c_list_heart">';
                                                               htmls += '<img class="heart_nologin_img" src="/ex/resources/src/img/icon/heart_gray.png" alt="">';
                                                               htmls += '</div>';
                                                 		

                                                 			   htmls += '</div>';
            
                                             


                                                        });



                                                        /* ------------------ 페이징 부분 --------------------- */

                                                        if (pagination['prev']) {
                                                            htmls2 += '<a class="arrow prev" href="javascript:list(' + (pagination['startPage'] - 1) + '"></a>';
                                                        }
                                                        // 번호를 표시하는 부분
                                                        for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
                                                            if (page !== idx) {
                                                                htmls2 += '<a class="pageNumLink" href="javascript:getlist(' + idx + ')">' + (idx) + "</a>";
                                                            } else {
                                                                htmls2 += '<a class="pageNumLink active" href="javascript:getlist(' + idx + ')">' + (idx) + "</a>";
                                                            }
                                                        }

                                                        if (pagination['next']) {
                                                            htmls2 += '<a class="arrow next" href="javascript:list(' + (pagination['endPage'] + 1) + ')"></a>';

                                                        }
                                                    } // if(list.length < 1) else 끝

                                                    $(".c_list").html(htmls);
                                                    $(".page_nation").html(htmls2);

                                                }

                                            });


                                        }


                                        $(document).ready(function() {
                                            getlist(1);
                                        });
                                    </script>






                            </main>

                            <%@ include file="../include/footerTemplate.jsp"%>

                                </div>

                </body>





                </html>
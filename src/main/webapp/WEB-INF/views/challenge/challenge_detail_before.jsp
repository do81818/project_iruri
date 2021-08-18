<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp" %> <!-- 경로를 확인해 주세요 -->
    <title>  ${challengeInfo.classTitle} </title> <!-- 페이지 이름을 적어주세요 -->
    <script src="${RESOURCES_PATH}/src/js/challenge/c_menu_hover.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/challenge/c_sticky.js" defer></script>
 
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
	
	</script>

 
 
  </head>
  <body>
    <div class="iruri__wrapper">

    <%@ include file="../include/headerTemplate.jsp" %> <!-- 경로를 확인해 주세요 -->

      <main>
         <div class="c_container">

        <!--챌린지상세-->
        <article class="c_detail_main">
        
            <!--챌린지 상세 대표이미지-->
            <div class="c_detail_start">

                <div class="c_detail_img">
                <img src="${CONTEXT_PATH}/iruri/display?fileName=${challengeInfo.classImage}" alt="">
                </div>

                <!--오른쪽 위 정보-->
                <div class="c_detail_info1">
                    <div class="c_mini_subject">
                        챌린지
                    </div>
                    <div class="c_subject">
                        ${challengeInfo.classTitle}
                    </div>
                    <div class="c_heart_count">
                        <i class="iruri_heart_icon"></i> ${challengeInfo.classLike}
                    </div>

                    <div class="c_detail_goal">
                        ${challengeInfo.classGoal}
                    </div>
                </div>

                <!--오른쪽 아래 정보-->
                <div class="c_detail_info2">
                    <div class="info_ul">
                        <ul>
                          
                            <li class="c_mini_info1">운동강도</li>
                            <li class="c_mini_info1">운동기간</li>
                            <li class="c_mini_info1">운동횟수</li>
                            <li class="c_mini_info1">참여인원</li>
                            <li class="c_mini_info1">개설자</li>
                        </ul>
                    </div>

                    <div class="info_ul">
                        <ul>
                     
                            <li class="c_mini_info2">${challengeInfo.classLevel}</li>
                            <li class="c_mini_info2">${challengeInfo.classStartDate}~${challengeInfo.classEndDate}</li>
                            <li class="c_mini_info2">주 ${challengeInfo.classExerciseCount}일</li>
                            <li class="c_mini_info2">${challengeInfo.classJoinMember} / ${challengeInfo.classTotalMember}</li>
                            <li class="c_mini_info2">${challengeInfo.IUserVO.userNickname}</li>
                        </ul>
                    </div>

                    <div class="c_join_button_div">
						<!-- 비로그인 메뉴 -->
	   					 <sec:authorize access="isAnonymous()">
	   					 <div class="c_join_end">로그인 후 이용 가능합니다</div>
	           		     </sec:authorize>
           		     
           		     	<!-- 로그인 메뉴 -->
    					<sec:authorize access="isAuthenticated()">
    					<c:set var = "classJoinMember" value = "${challengeInfo.classJoinMember}"/>
    					<c:set var = "classTotalMember" value = "${challengeInfo.classTotalMember}"/>
    					<c:set var = "classEndDate" value = "${challengeInfo.classEndDate}"/>
    					<!-- 오늘 날짜 비교 -->
    					<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

                    	 
                    	<c:choose>
                    	<c:when test ="${classEndDate lt today}">
	                        <div class="c_date_end">지난 챌린지 입니다.</div>
	                    	</c:when>
	                    	
                    		<c:when test ="${classJoinMember lt classTotalMember}">
	                        <button class="c_join_button">챌린지 참여하기</button>
	                    	</c:when>
	                    	
	                    	<c:when test ="${classJoinMember ge classTotalMember}">
	                        <div class="c_join_end">인원 마감된 챌린지 입니다.</div>
	                        </c:when>
                        </c:choose>
                        </sec:authorize>
                        
            
                    </div>


                    <!--챌린지 참여 누르고 확인 나오는 모달창-->
                    <div id="c_parti_modal">
                        <div class="c_parti_modal_start">
                            <div class="c_parti_modal_content">
                            
                                <div class="c_parti_modal_div">
                                    <ul>
                                        <li>챌린지에 참여 하시겠습니까?</li>
                                        <li>챌린지 시작일 전 까지만 취소가 가능합니다.</li>
                                        <li>챌린지 시작일 후에는 취소하실 수 없습니다.</li>

                                    </ul>



                                    <form class="c_parti_modal_button">

                                        <button class="c_parti_modal_cancle" type="reset">취소</button>
                                        <button class="c_parti_modal_submit" type="submit">
                                        <a href="challenge_detail_after?classId=${challengeInfo.classId}">참여</a>
       
                                        </button>
                                    </form>
                                </div>
                                
                            </div>
                        </div>
                        <div class="modal_layer"></div>
                    </div>
                </div>
            </div>

        </article>



    </div>


    <!--상세정보, 인증하기, 커뮤니티 메뉴바-->


    <nav class="c_menu">
				<ul>
					<li><a href="#info">상세정보</a></li>
					<li><a href="#certify">인증하기</a></li>
					<li><a href="#reply">커뮤니티</a></li>
				</ul>

			</nav>

    <!--밑줄 효과-->
    <span class="c_menu_hover"></span>





    <!--챌린지 상세 정보-->
    <div class="c_detail_maininfo" id="info">


        <div class="c_main_info">

			${challengeInfo.classContent}
 

        </div>
    </div>


    <!--인증사진 리스트-->
    <div class="c_certify" id="certify">
        <div class="c_container">

            </div>

        </div>

        <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
        <div class="page_nation_certify">
           
        </div>


    </div>
    
        <script>
                                    //인증글 ajax, 페이징
                                    function getImagelist(page) {
                                        $.ajax({
                                            url: 'http://localhost:8282/ex/ajax/certifyImgList.json',
                                            type: 'GET',
                                            cache: false,
                                            dateType: 'json',

                                            data: {

                                                pageNum: page,
                                                classId: ${challengeInfo.classId},
                                                // Criteria 의 pageNum 의미함 restAfter 메소드에서 파라미터로 Criteria 가 있기 때문에
                                                // 스프링 내부적으로 알아서 Criteria 안에 해당 멤버변수에 값할당
                                                // url 상으론 /rest/after?pageNum=2 이런식
                                            },
                                            success: function(result) {
                                                var imgList = result['imgList'];
                                                var pagination = result['pageMaker'];
                                                var htmls = "";
                                                var htmls2 = "";

                                                var aaa = [];
                                                imgList.map(item => item.boardList)
                                                					.forEach(item => {
                                                						aaa.push(item[0]);
                                                					});
                                                //var aaa = result['imgList'][0].boardList;
                                                localStorage.setItem('boardList', JSON.stringify(aaa));
                                                
                                                if (imgList.length < 1) {
                                                    htmls += '<div class="c_list_not_img">';
                                                    htmls += '현재 등록된 인증사진이 없습니다.';
                                                    htmls += '</div>';
                                                    console.log(imgList.length);
                                                } else {

                                                 


                                                        htmls += '<div class="c_certify_total">';
                                                        const count = pagination.total;
                                                        htmls += '<span>총' +
                                                            count +
                                                            '개</span>';
                                                        htmls += '</div>';


                                                        htmls += '<div class="c_certify_img_list">';
														
                                                        $(imgList).each(function() {
                                                        $(this.boardList).each(function() {
                     										
                                                            htmls += '<div class="c_certify_img" onclick="certify_details_modal('+ this.boardId +')">';
                                                            htmls += '<img src="${CONTEXT_PATH}/iruri/display?fileName=' + this.boardFile + '" alt="">';
                                                            htmls += '</div>';

                                                        });

                                                    });
                                                    
                                                    htmls += ' </div>';
                                                    
                                                    /* ------------------ 페이징 부분 --------------------- */

                                                    if (pagination['prev']) {
                                                        htmls2 += '<a class="arrow prev" href="javascript:getImagelist(' + (pagination['startPage'] - 1) + '"></a>';
                                                    }
                                                    // 번호를 표시하는 부분
                                                    for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
                                                        if (page !== idx) {
                                                            htmls2 += '<a class="pageNumLink" href="javascript:getImagelist(' + idx + ')">' + (idx) + "</a>";
                                                        } else {
                                                            htmls2 += '<a class="pageNumLink active" href="javascript:getImagelist(' + idx + ')">' + (idx) + "</a>";
                                                        }
                                                    }

                                                    if (pagination['next']) {
                                                        htmls2 += '<a class="arrow next" href="javascript:getImagelist(' + (pagination['endPage'] + 1) + ')"></a>';
                                                    }
                                                } // if(list.length < 1) else 끝

                                                $(".c_certify").html(htmls);
                                                
                                                $(".page_nation_certify").html(htmls2);
                                                
                                            }
                                        });
                                    }
                                    $(document).ready(function() {
                                    	getImagelist(1);
                                    });
                                </script>



    </div>
    <!--댓글리스트-->
    <div class="c_before_reply" id="reply">
  
    </div>

    <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
    <div class="page_nation">
    
    </div>
    
    
<script>
	//챌린지 참여하기
$('.c_parti_modal_submit').click(function(){
	const header = $('meta[name="_csrf_header"]').attr('th:content');
	const token = $('meta[name="_csrf"]').attr('th:content');

	$.ajax({
		url: '${CONTEXT_PATH}/iruri/insert_user_challenge',
		type: 'POST',
		cache: false,
		dateType: 'json',
		data: {
			classId: ${challengeInfo.classId},
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(result){
			console.log(result);
		}
			});

		});

</script>	
	
<script>
//댓글 ajax, 페이징
		function getlist(page) {
			
			    $.ajax({
			        url: 'http://localhost:8282/ex/ajax/c_detail_before_reply.json',
			        type: 'GET',
			        cache: false,
			       	dateType:'json',
			   
			        data: {
			        	
			           pageNum : page,
			           classId : ${challengeInfo.classId},

			            // Criteria 의 pageNum 의미함 restAfter 메소드에서 파라미터로 Criteria 가 있기 때문에
			            // 스프링 내부적으로 알아서 Criteria 안에 해당 멤버변수에 값할당
			            // url 상으론 /rest/after?pageNum=2 이런식
			        },
					success : function(result) {
						console.log(result);
				    	var replyList = result['replyList'];
						var pagination = result['pageMaker'];
						var htmls = "";
						var htmls2 = "";

						if (replyList.length < 1) {
							 htmls += '<div class="c_list_not">';
                             htmls += '현재 등록된 댓글이 없습니다.';
                             htmls += '</div>';
						} else {
								htmls += '<div class="reply_count">';
								const count = pagination.total;
								htmls += '총'
										+ count 
										+ '개';
								htmls += '</div>';
								
								htmls += '<table class="reply_table">';
								
								
								$(replyList).each(function() {
									$(this.boardList).each(function() {
												//댓글 리스트
												htmls += '<tr>';
												
												htmls += '<td class="reply_nickname">';
												htmls += this.iuserVO.userNickname;
												htmls += '</td>';

												htmls += '<td>';
												htmls += '<p class="reply_content">';
												htmls += this.boardContent;
												htmls += '</p>';

												htmls += '<p class="reply_date">';
												htmls += this.boardDate;
												htmls += '</p>';
												htmls += '</td>';
												htmls += '</tr>';
											});
										});
								htmls += ' </table>';
						
							
					         /* ------------------ 페이징 부분 --------------------- */
	                        
					         if (pagination['prev']) {
	                             htmls2 += '<a class="arrow prev" href="javascript:getlist('+ (pagination['startPage']-1) +'"></a>';
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
	                            htmls2 += '<a class="arrow next" href="javascript:getlist('+ (pagination['endPage']+1) +')"></a>';
	        						
	        				}			
	         			}	// if(list.length < 1) else 끝
	                     
                        $(".c_before_reply").html(htmls);
         				$(".page_nation").html(htmls2);
         				
                    }
                    
                });                             
           }

	            $(document).ready(function() {
	                getlist(1);
	            });

</script>



      </main>
      
    <%@ include file="../include/footerTemplate.jsp" %> <!-- 경로를 확인해 주세요 --> 
    
    </div>    
  </body>
</html>
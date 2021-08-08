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
<!-- 경로를 확인해 주세요 -->
<title>챌린지 상세(참여 후)</title>
<!-- 페이지 이름을 적어주세요 -->
<script src="${RESOURCES_PATH}/src/js/challenge/c_menu_hover.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_modal.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_sticky.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/challenge/c_radio_check.js" defer></script>
</head>
<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

		<main>
			<div class="c_container">

				<!--챌린지상세-->
				<article class="c_detail_main">
					<!--챌린지 상세 대표이미지-->
					<div class="c_detail_start">

						<div class="c_detail_img"></div>

						<!--오른쪽 위 정보-->
						<div class="c_detail_info1">
							<div class="c_mini_subject">챌린지</div>
							<div class="c_subject">${challengeInfo.classTitle}</div>
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


							
								<div class="c_join_completion">참여중인 챌린지 입니다.</div>
					
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
					<div class="c_certify_total">총 77 개</div>


					<div class="c_certify_img_list">
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
						<div class="c_certify_img">
							<img src="/ex/resources/src/img/icon/270-270.png" alt="">
						</div>
					</div>

				</div>

				<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
				<div class="page_nation_certify">
					<a class="arrow prev" href="#"></a> <a href="#" class="active">1</a>
					<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
					<a class="arrow next" href="#"></a>
				</div>

				<div class="c_certify_button_div">
					<button class="c_certify_button">인증하기</button>
				</div>

			</div>


			<!--인증하기 모달창-->
			<div id="c_certify_modal">

				<div class="c_certify_modal_start">
					<div class="c_modal_close">
						<img src="/ex/resources/src/img/icon/close.png" alt="">
					</div>
					<h2 class="c_certify_modal_title">인증글 작성</h2>
					<form action="#">
						<ul class="c_certify_modal_ul">
							<li>- 인증글 작성 시 포인트가 누적됩니다.</li>
							<li>- 누적된 포인트는 챌린지 종료 후 3일 이내 자동 적립됩니다.</li>
							<li>- 챌린지 종료 전에 인증글을 삭제하면 누적된 포인트가 회수됩니다.</li>
							<li>- 챌린지가 종료되기 전까지는 수정 및 삭제가 가능합니다.</li>
						</ul>
						<div class="c_certify_name">
							<p>제목</p>
							<input type="text" class="inputbox_cetify1">
						</div>

						<div class="c_certify_content">
							<p>내용</p>
							<textarea cols="30" rows="50" class="inputbox_certify2"></textarea>
						</div>

						<div class="c_certify_img">
							<p>사진첨부</p>
							<input type="file" accept=".jpg, .png" id="certify_upload"><label
								for="certify_upload" class="certify_file_upload"></label> <span
								style="color: #999;">* 650x500px 크기의 jpg.png</span>
						</div>


						<div class="modal_button">
							<button class="c_certify_modal_submit" type="submit">인증글
								올리기</button>
						</div>
					</form>
				</div>
				<div class="modal_layer"></div>
			</div>
			

	</div>




	<!--내 인증글 모달창-->
	<div class="c_myCertify_modal">
		<div class="c_myCertify_modal_start">
			<form action="#">
				<div class="myCertify_img">
					<img src="/ex/resources/src/img/icon/616-300.png" alt="">
				</div>
				<div class="myCertify_myInfo">
					<span class="myCertify_date"> 2021.07.04 </span> <span
						class="myCertify_nickname"> 닉네임 </span>
				</div>
				<div class="myCertify_title">제목입니다</div>
				<div class="myCertify_content">아침에 눈을 뜨면 개운한 느낌 보다는 늘 피곤한 상태로
					맞이하는 경우가 많아요~ 그렇게 하루가 흘러가면 그 피로함이 밤까지 쌓여서 만성 피로가 될 수 있어요!</div>



				<div class="modal_button">
					<button class="c_myCertify_modal_submit2" type="submit">수정</button>
					<button class="c_myCertify_modal_submit2" type="submit">삭제</button>
					<button class="c_myCertify_modal_submit" type="submit">확인</button>
				</div>
			</form>
		</div>

		<div class="modal_layer"></div>
	</div>




	</div>
	
	<!-- 댓글 입력창 -->
	<div class="c_reply_insert">
		<c:url value="/iruri/c_detail_reply_insert" var="challengeReplyInsert" />
		<form:form name="commentForm" class="c_reply_insertBox" method="POST"
			action="${challengeReplyInsert}" accept-charset="utf-8">

			<table>
				<tr>

					<td class="c_reply_textarea"><textarea placeholder="글을 작성하세요."
							name="boardContent"></textarea></td>
					<td class="c_reply_insertButton"><button type="submit">입력</button></td>

				</tr>
			</table>

		</form:form>
	</div>


	<!--댓글리스트-->
	<div class="c_after_reply" id="reply">

		<%-- 
	
		<div class="reply_count">총 77 개</div>
		<table class="reply_table">
			<tr>
				<td class="reply_nickname">닉네임</td>
				<td>
					<p class="reply_content">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Neque pariatur hic, iusto quae nam cupiditate
						nostrum dolores unde dicta perferendis temporibus facilis nobis
						ducimus provident omnis voluptatum consequatur explicabo
						excepturi.</p>
					<p class="reply_date">2021.07.03</p>
				</td>
				<td class="reply_button"><button class="reply_modify">수정</button>
					<button class="reply_complain">신고</button></td>
			</tr>
		</table> --%>
	</div>


	<!--댓글 신고 모달-->
	<div class="c_complain_modal">
		<div class="c_complain_modal_start">
			<h4 class="c_complain_modal_title">신고사유 선택</h4>
			<form action="#">

				<ul class="c_complain_modal_ul">
					<li><input type="radio" name="c_complain" id="complain1"><label
						for="complain1" class="c_complain_modal_label"
						onclick="radio_click(this)"> 욕설, 비방, 차별, 혐오 </label></li>

					<li><input type="radio" name="c_complain" id="complain2"><label
						for="complain2" class="c_complain_modal_label"
						onclick="radio_click(this)"> 홍보, 영리목적 </label></li>

					<li><input type="radio" name="c_complain" id="complain3"><label
						for="complain3" class="c_complain_modal_label"
						onclick="radio_click(this)"> 음란, 청소년 유해 </label></li>

					<li><input type="radio" name="c_complain" id="complain4"><label
						for="complain4" class="c_complain_modal_label"
						onclick="radio_click(this)"> 도배, 스팸 </label></li>

				</ul>

				<div class="modal_button">

					<button class="c_complain_modal_cancle" type="reset"
						onclick="radio_cancle_click(this)">취소</button>
					<button class="c_complain_modal_submit" type="submit"
						disabled="disabled">신고하기</button>
				</div>
			</form>

		</div>
		<div class="modal_layer"></div>
	</div>


	<!-- 댓글 수정 확인 모달 -->
	<div class="reply_modify_modal">
		<div class="reply_modify_modal_start">
			<h4 class="reply_modify_modal_title">댓글 수정</h4>
			<form action="#">

				<div class="reply_modify_content">
					<textarea cols="30" rows="50" class="inputbox_certify2"></textarea>
				</div>

				<div class="modal_button">

					<button class="reply_modify_modal_cancle" type="reset">취소</button>
					<button class="reply_modify_modal_submit" type="submit">등록하기</button>
				</div>
			</form>

		</div>
		<div class="modal_layer"></div>
	</div>

	<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
	<div class="page_nation">
	</div>






<!-- 
function insertReply() {

    $.ajax({
        url: '${CONTEXT_PATH}/iruri/c_detail_reply_insert',
        type: 'POST',
        cache: false,
        dateType: 'json',
        data: {

        },
        success: function() {
   
            var htmls3 = "";


            htmls3 += '<c:url value="/iruri/c_detail_reply_insert" var="challengeReplyInsert" />';
            htmls3 += '<form class="c_reply_insertBox" method="POST" action="c_detail_reply_insert" accept-charset="utf-8">';

            htmls3 += '<table>';
            htmls3 += '<tr>';

            htmls3 += '<td class="c_reply_textarea"><textarea placeholder="글을 작성하세요." name="boardContent"></textarea></td>';
            htmls3 += '<td class="c_reply_insertButton"><button type="submit">입력</button></td>';

            htmls3 += '</tr>';
            htmls3 += '</table>';

            htmls3 += '</form>';


        }
        
      
        

    });
    $(".c_reply_insert").html(htmls3);
   
}
 -->
<script>
//댓글 ajax, 페이징
		function getlist(page) {
			
			    $.ajax({
			        url: 'http://localhost:8282/ex/ajax/c_detail_after_reply.json',
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
				
				    	var replyList = result['replyList'];
						var pagination = result['pageMaker'];
						var htmls = "";
						var htmls2 = "";
						if (replyList.length < 1) {
							htmls += '<div class="c_list_not">';
							htmls += '현재 등록된 댓글이 없습니다.';
							htmls += '</div>';
						} else {
							
							$(replyList).each(function() {
								/*
								htmls += '<div class="c_reply_insert" id="reply">';
								
								htmls += '<form class="c_reply_insertBox" action="">';
								
								htmls += '<table>';
								htmls += '<tr>';
								
								htmls += '<td class="c_reply_textarea"><textarea placeholder="글을 작성하세요."></textarea></td>';
								htmls += '<td class="c_reply_insertButton"><button>입력</button></td>';
								
								htmls += '</tr>';
								htmls += '</table>';
								
								htmls += '</form>';
								
								htmls += '</div>';
								*/
							
								htmls += '<div class="reply_count">';
								const count = $(this.boardList).length;
								htmls += '총'
										+ count 
										+ '개';
								htmls += '</div>';
								htmls += '<table class="reply_table">';
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
												
								htmls += ' </table>';
								
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
	                     
	                        $(".c_after_reply").html(htmls);
	         				$(".page_nation").html(htmls2);
	         				
	                     }
	                     
	                 });                             
	            }
	            $(document).ready(function() {
	                getlist(1);
	            });
</script>
<script>

//댓글 등록하기
$('.c_reply_insertButton').click(function(){
	
	$.ajax({
        url: '${CONTEXT_PATH}/iruri/c_detail_reply_insert',
        type: 'POST',
        cache: false,
        dateType: 'text',
        data: $("#commentForm").serialize(),
        success: function(result) {
            if(result=="success")
            {
            	getlist(1);
                $("#boardContent").val("");
            }
        }
      	
        
	});
	
});
</script>



	</main>

	<%@ include file="../include/footerTemplate.jsp"%>
	<!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>
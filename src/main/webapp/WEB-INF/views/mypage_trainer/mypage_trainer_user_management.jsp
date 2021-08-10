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
<title>이루리 트레이너 마이페이지</title>
<!-- 페이지 이름을 적어주세요 -->
<script src=""></script>
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
<script type="text/javascript">
	$(document).ready(function(){
		management(1);
	});
	function management(page){
		$.ajax({
			url : 'http://localhost:8282/ex/ajax/mypage/userManagement.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				pageNum : page,
			},
			success : function(result){
				var trainerUserManagement = result['trainerUserManagement'];
				console.log(trainerUserManagement);

				var pagination = result['pageMaker'];
				var htmls = '';
				var htmls2 = '';
				
				$(trainerUserManagement).each(function() {
					htmls += '<div class="pt_user_management">';
					htmls += '<table class="management_table">';
					htmls += '<tr>';
					htmls += '<td colspan="3" class="pt_title">';
					htmls += '<span class="title_icon-red">'+this.classState+'</span>';
					htmls +=  this.classTitle+'(총<span>'+this.classJoinMember+'</span>명)';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '<tr>';
					htmls += '<td>';
					htmls += '<ul>';
					htmls += '<li><span class="pt_nickname_table">닉네임</span>&emsp;<span class="pt_nickname_phone">010-0000-0000</span></li>';
					htmls += '</ul>';
					htmls += '</td>';

					htmls += '<td class="arrow_box">';
					htmls += '<button href="" class="a_arrow_up"></button>';
					htmls += '<button href="" class="a_arrow_down"></button>';
					htmls += '</td>';
					/* 코멘트입력 칸 */
					htmls += '<td class="td_box2">';
					htmls += '<form class="reply_insertBox" action="">';
					htmls += '<table>';
					htmls += ' <tr>';
					htmls += '<td class="reply_textarea">';
					htmls += '<textarea placeholder="회원의 닉네임을 선택 후 작성하세요"></textarea>';
					htmls += '</td>';
					htmls += '<td class="reply_insertButton">';
					htmls += '<button>입력</button>';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					htmls += '</form>';

					htmls += '<table class="reply_table">';
					htmls += '<tr>';
					htmls += '<td class="pt_reply_box">';
					htmls += '<p class="pt_reply_date">2021.07.03</p>';
					htmls += '<p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍 뜨고 기분 좋았어요</p>';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					htmls += '</td>';
					htmls += '</tr>';
					htmls += '</table>';
					htmls += '</div>';

														
				});
				
				if (pagination['prev']) {
					htmls2 += '<a class="arrow prev" href="javascript:management('+ (pagination['startPage']-1) +')"></a>';
				} 
				// 번호를 표시하는 부분
				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
					if (page !== idx) {
						htmls2 += '<a class="pageNumLink" href="javascript:management('+ idx + ')">' + (idx) + "</a>";
					} else {
						htmls2 += '<a class="pageNumLink active" href="javascript:management('+ idx + ')">' + (idx) + "</a>";
					}
				}
				
				if (pagination['next']) {
					htmls2 += '<a class="arrow next" href="javascript:management('+ (pagination['endPage']+1) +')"></a>';
					
				}
				
					$(".management_list").html(htmls);
					$(".page_nation").html(htmls2);
				}
			

		});					
	};
</script>
</head>

<body>
	<div class="iruri__wrapper">

		<%@ include file="../include/headerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

		<main>
			<!-- 콘텐츠를 넣어주세요 -->
			<div class="container content">

				<!-- 마이페이지 기본 탭 -->
				<div class="imformation_box">
					<div id="user_info">
						<div class="nickname">
							<!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button" onclick=""​>클래스
								개설</button>
						</div>
						<div class="user_detail">
							<c:if test="${user.authList[0].authContent eq 'ROLE_TRAINER'}">
								<div>트레이너입니다</div>
							</c:if>
							<div>${user.userEmail}</div>

						</div>
					</div>

					<div id="challenge">
						운영중인 클래스
						<div class="count">10</div>
					</div>

					<div id="buy">
						수익금
						<div class="count">
							200
							<div class="buy_text">만원</div>
						</div>
					</div>
				</div>

				<!-- 관리메뉴 -->
				<div class="class_MenuBar">
					<ul>
						<li class="class_MenuBar_text"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text_now"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="#">수익관리</a></li>
						<li class="class_MenuBar_text"><a href="#">프로필관리</a></li>
					</ul>
				</div>

				<!-- 회원관리 -->
				<%-- <div class="pt_user_management">
					<table class="management_table">
						<tr>
							<td colspan="3" class="pt_title"><span
								class="title_icon-red">진행중</span>
								${trainerUserManagement[0].classTitle} (총<span>12</span>명)</td>
						</tr>
						<tr>
							<td>
								<ul>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
									<li><span class="pt_nickname_table">닉네임</span>&emsp;<span
										class="pt_nickname_phone">010-0000-0000</span></li>
								</ul>
							</td>

							<td class="arrow_box">
								<button href="" class="a_arrow_up"></button>
								<button href="" class="a_arrow_down"></button>
							</td>

							<td class="td_box2">
								<form class="reply_insertBox" action="">
									<table>
										<tr>
											<td class="reply_textarea"><textarea
													placeholder="회원의 닉네임을 선택 후 작성하세요"></textarea></td>
											<td class="reply_insertButton">
												<button>입력</button>
											</td>
										</tr>
									</table>
								</form>

								<table class="reply_table">
									<tr>
										<td class="pt_reply_box">
											<p class="pt_reply_date">2021.07.03</p>
											<p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍
												뜨고 기분 좋았어요</p>
										</td>
									</tr>
									<tr>
										<td class="pt_reply_box">
											<p class="pt_reply_date">2021.07.03</p>
											<p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍
												뜨고 기분 좋았어요</p>
										</td>
									</tr>
									<tr>
										<td class="pt_reply_box">
											<p class="pt_reply_date">2021.07.03</p>
											<p class="pt_reply_content">아침에 적당히 땀을 흘리며 근력운동을 하니 눈이 번쩍
												뜨고 기분 좋았어요</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
 --%>
 
 
					<div class="management_list"></div>
	                <div class="page_nation"></div>


			</div>


		</main>

		<%@ include file="../include/footerTemplate.jsp"%>
		<!-- 경로를 확인해 주세요 -->

	</div>


</body>
</html>
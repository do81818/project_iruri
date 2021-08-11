<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%@ include file="../include/static.jsp" %>
    <title>마이페이지 트레이너 수익관리</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
  	<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
  	<script type="text/javascript">
		$(document).ready(function(){
			profit(1);
		});
		function profit(page){
			$.ajax({
				url : 'http://localhost:8282/ex/ajax/mypage/trainerProfit.json',
				type : 'GET',
				cache : false,
				dataType : 'json',
				data:{
					pageNum: page,
				},
				success : function(result){
					var profitList = result['profitList'];
					console.log(profitList);
					var pagination = result['pageMaker'];
					var htmls = ''; 
					var htmls2 = '';
					
					if(profitList.length < 1) {
						htmls = '현재 트레이너님의 수익은 없습니다.';
					} else {
					
					$(profitList).each(function() {
						htmls +=	'<table class="pt_class_profit">';
						htmls +=		'<tr>';
						htmls +=			'<td class="pt_class_profit_date">'+this.buyDate+'</td>';
						htmls +=			'<td>';
						htmls +=				'<a class="pt_class_profit_title" href="#">'+this.classTitle +'</a>';
						htmls +=			'</td>';
						htmls +=			'<td class="pt_class_profit_money">'+this.buyRealpay +'</td>';
						htmls +=		'</tr>';
						htmls +=	'</table>';

				});
					if (pagination['prev']) {
						htmls2 += '<a class="arrow prev" href="javascript:profit('+ (pagination['startPage']-1) +')"></a>';
					} 
					// 번호를 표시하는 부분
					for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
						if (page !== idx) {
							htmls2 += '<a class="pageNumLink" href="javascript:profit('+ idx + ')">' + (idx) + "</a>";
						} else {
							htmls2 += '<a class="pageNumLink active" href="javascript:profit('+ idx + ')">' + (idx) + "</a>";
						}
					}
					
					if (pagination['next']) {
						htmls2 += '<a class="arrow next" href="javascript:profit('+ (pagination['endPage']+1) +')"></a>';
						
					}
						$(".pt_class_profit_list").html(htmls);
						$(".page_nation").html(htmls2);
					}
				}
			});

		};
		
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
						<div class="nickname"> <!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button" onclick=""​>클래스
								개설</button>
						</div>
						<div class="user_detail">
							<c:if test="${user.authList[0].authContent eq 'ROLE_TRAINER'}">
								<div>당신은 이루리의 트레이너!!</div>
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
						<li class="class_MenuBar_text"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text_now"><a href="#">수익관리</a></li>
						<li class="class_MenuBar_text"><a href="#">프로필관리</a></li>
					</ul>
				</div>

            <!-- 수익관리 -->
            <div class="display_flex">
            <div class="pt_profit">
                <table>
                    <tr>
                        <span class="pt_month_text">이달의 수익</span>
                    </tr>

                    <tr>
                        <td class="pt_month_number">
                            ${monthProfit}<span class="pt_won">&nbsp;원</span>
                        </td>
                        <td class="pt_pre_month"><span>이전달</span>
                            <a href=""><img src="../image/arrow_red_left.png" alt="up" class="arrow_width_up_down"></a>
                        </td>
                        <td class="pt_next_month"><span>다음달</span>
                            <a href=""><img src="../image/arrow_red_right.png" alt="up" class="arrow_width_up_down"></a>
                        </td>
                    </tr>

                </table>
                
                
                <div class="pt_class_profit_list"></div>

                <div class="page_nation">
                </div>

            </div>
            <div class="pt_profit_graph">
                <img src="../image/360-250.png" alt="수익그래프">
            </div>
            </div>

        </div>
      </main>
      
     <%@ include file="../include/footerTemplate.jsp" %>
    
    </div>    
  </body>
</html>
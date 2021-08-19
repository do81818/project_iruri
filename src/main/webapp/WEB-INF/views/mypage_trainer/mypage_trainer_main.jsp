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
    <%@ include file="../include/static.jsp" %>  <!-- 경로를 확인해 주세요 --><!-- ../include/static.jsp  -->
    <title>이루리 트레이너 마이페이지</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
    <link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/component/paging.css">
   
	<script>
	$(document).ready(function(){
		current(1);
	});
	
	function current(page){
		$.ajax({
			url : 'http://localhost:8282/ex/ajax/mypage/trainerCurrent.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				pageNum: page,
			},
			success : function(result){
				var list = result['list'];
				console.log("원래리스트");
				console.log(list);
				var jebal = result['jebal'];
				console.log("복사하기 위한 리스트");
				console.log(jebal); 
				var pagination = result['pageMaker'];
				var htmls = ''; 
				var htmls2 = '';
				
				 for(let j = 0; j < list.length; j++) {
					for(let i = 0; i < jebal.length; i++) {
						if(list[j].classId === jebal[i].classId) {
							list[j] = jebal[i];
						}												
					}
				 } 
				
				if(list.length < 1) {
					htmls = '현재 등록된 클래스가 없습니다.';
				} else {			 
					
					$(list).each(function() {
						//this.exerciseKindList = '';
						//console.log(this.exerciseKindList);
						
						// src="../image/360-250.png"
						htmls +=	'<div class="pt_card">';
						htmls += 		'<a href="/ex/iruri/ptClassDetails?classId='+ this.classId +'"><div class="pt_image_and_mark">';
						htmls += 			'<img src="${CONTEXT_PATH}/iruri/display?fileName='+this.classImage + '" alt="" class="pt_image">';
						htmls +=			'<div class="pt_mark">1:'+ this.classTotalMember+'</div>';
						htmls += 		'</div></a>';
						htmls +=		'<div class="trainer_name">${user.userNickname}</div>';
						htmls +=		'<a href="/ex/iruri/ptClassDetails?classId='+ this.classId +'"><div class="pt_title">' +this.classTitle + '</div></a>';
						htmls +=		'<div class="pt_date">' + this.classStartDate + '~' + this.classEndDate + '</div>';
						htmls +=		'<div class="pt_icon">';
						htmls +=			'<div class="pt_icon-blue">';
						htmls +=				'<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">' + this.classLevel;
						htmls +=			'</div>';
						htmls +=			'<div class="pt_icon-blue">';
						htmls +=				'<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">'+ this.classTime+'분/';		
												for(var i = 0; i < this.exerciseDateList.length; i++) {
						htmls +=			 		this.exerciseDateList[i].exerciseDate 																							
												}
						htmls +=			'</div>';
						htmls +=		'</div>';
						htmls +=		'<div class="pt_icon">';
										for(var i = 0; i < this.exerciseKindList.length; i++) {
						htmls +=			'<div class="pt_icon-red">' + this.exerciseKindList[i].exerciseKind + '</div>';																							
										}
						htmls +=		'</div>';
						htmls +=		'<div class="pt_price">₩' + this.classPrice + '</div>';
						
						/* htmls +=		'<button class="pt_update_button" type="button" onclick=""​>';
						htmls +=		'수정</button>'; */
						htmls += 	'</div>';
					});
					
					 /* ------------------ 페이징 부분 --------------------- */
                    
			         if (pagination['prev']) {
                        htmls2 += '<a class="arrow prev" href="javascript:current('+ (pagination['startPage']-1) +')"></a>';
    				} 
    				// 번호를 표시하는 부분
    				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
    					if (page !== idx) {
    					   htmls2 += '<a class="pageNumLink" href="javascript:current('+ idx + ')">' + (idx) + "</a>";
    					} else {
    					   htmls2 += '<a class="pageNumLink active" href="javascript:current('+ idx + ')">' + (idx) + "</a>";
    					}
    				}
    				
    				if (pagination['next']) {
                       htmls2 += '<a class="arrow next" href="javascript:current('+ (pagination['endPage']+1) +')"></a>';
   						
   					}	// if(list.length < 1) else 끝
                     
                        $(".class_list").html(htmls);
         				$(".page_nation").html(htmls2);
                     }
                            
			}
		});       
	};
	
	</script>
   
   <script>	
	function end(page){
		$.ajax({
			url : 'http://localhost:8282/ex/ajax/mypage/trainerEnd.json',
			type : 'GET',
			cache : false,
			dataType : 'json',
			data:{
				pageNum: page,
			},
			success : function(result){
				var list = result['list'];
				console.log("원래리스트");
				console.log(list);
				var jebal = result['jebal'];
				console.log("제발리스트");
				console.log(jebal); 
				var pagination = result['pageMaker'];
				var htmls = ''; 
				var htmls2 = '';
				
				 for(let j = 0; j < list.length; j++) {
					for(let i = 0; i < jebal.length; i++) {
						if(list[j].classId === jebal[i].classId) {
							list[j] = jebal[i];
						}												
					}
				 } 
				
				if(list.length < 1) {
					htmls = '현재 등록된 클래스가 없습니다.';
				} else {
				
					$(list).each(function() {
						// src="../image/360-250.png"
						htmls +=	'<div class="pt_card">';
						htmls += 		'<a href="/ex/iruri/ptClassDetails?classId='+ this.classId +'"><div class="pt_image_and_mark">';
						htmls += 			'<img src="${CONTEXT_PATH}/iruri/display?fileName='+this.classImage + '" alt="" class="pt_image">';
						htmls +=			'<div class="pt_mark">1:'+ this.classTotalMember+'</div>';
						htmls += 		'</div></a>';
						htmls +=		'<div class="trainer_name">${user.userNickname}</div>';
						htmls +=		'<a href="/ex/iruri/ptClassDetails?classId='+ this.classId +'"><div class="pt_title">' +this.classTitle + '</div></a>';
						htmls +=		'<div class="pt_date">' + this.classStartDate + '~' + this.classEndDate + '</div>';
						htmls +=		'<div class="pt_icon">';
						htmls +=			'<div class="pt_icon-blue">';
						htmls +=				'<img src="${RESOURCES_PATH}/src/img/icon/ex_level.png" class="pt_icon_image">' + this.classLevel;
						htmls +=			'</div>';
						htmls +=			'<div class="pt_icon-blue">';
						htmls +=				'<img src="${RESOURCES_PATH}/src/img/icon/ex_time.png" class="pt_icon_image">'+ this.classTime+'분/';		
												for(var i = 0; i < this.exerciseDateList.length; i++) {
						htmls +=			 		this.exerciseDateList[i].exerciseDate 																							
												}
						htmls +=			'</div>';
						htmls +=		'</div>';
						htmls +=		'<div class="pt_icon">';
										for(var i = 0; i < this.exerciseKindList.length; i++) {
						htmls +=			'<div class="pt_icon-red">' + this.exerciseKindList[i].exerciseKind + '</div>';																							
										}
						htmls +=		'</div>';
						htmls +=		'<div class="pt_price">₩' + this.classPrice + '</div>';
						
						/* htmls +=		'<button class="pt_update_button" type="button" onclick=""​>';
						htmls +=		'수정</button>'; */
						htmls += 	'</div>';
					});
					
					 /* ------------------ 페이징 부분 --------------------- */
                    
			         if (pagination['prev']) {
                        htmls2 += '<a class="page_nation prev" href="javascript:end('+ (pagination['startPage']-1) +')"></a>';
    				} 
    				// 번호를 표시하는 부분
    				for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
    					if (page !== idx) {
    					   htmls2 += '<a class="pageNumLink" href="javascript:end('+ idx + ')">' + (idx) + "</a>";
    					} else {
    					   htmls2 += '<a class="pageNumLink active" href="javascript:end('+ idx + ')">' + (idx) + "</a>";
    					}
    				}
    				
    				if (pagination['next']) {
                       htmls2 += '<a class="page_nation next" href="javascript:end('+ (pagination['endPage']+1) +')"></a>';
   											
   					}	// if(list.length < 1) else 끝
                     
                        $(".class_list").html(htmls);
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
		<!-- 경로를 확인해 주세요 -->

		<main>
			<!-- 콘텐츠를 넣어주세요 -->
			<div class="container content">
				<!-- 마이페이지 기본 탭 -->
				<div class="imformation_box">
					<div id="user_info">
						<div class="nickname"> <!-- 루리 -->
							${user.userNickname}
							<button class="infobutton" type="button" onclick="location.href='/ex/iruri/ptClassMakeForm'">클래스
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
						<li class="class_MenuBar_text_now"><a href="/ex/mypage/trainer">클래스관리</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/userManagement">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/classReply">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="/ex/mypage/trainer/profit">수익관리</a></li>
					</ul>
				</div>
				
				<script>
					$(document).ready(function() {
						$('.classbarUl_blue a').css('color', '#02a3ff');
						
						$('.classbarUl_blue a').on('click', function() {
							$('.classbarUl_blue a').css('color', '#02a3ff');
							$('.classbarUl a').css('color', '#999');
						})
						
						$('.classbarUl a').on('click', function() {
							$('.classbarUl_blue a').css('color', '#999');
							$('.classbarUl a').css('color', '#02a3ff');
						})
					});
				</script>
				<!-- 클래스 메뉴 -->
				<div class="classbar">
					<ul>
						<li class="classbarUl_blue"><a href="javascript:void(0);" onclick="current(1)">운영중인 클래스</a></li>
						<li class="classbarUl"><a href="javascript:void(0);" onclick="end(1)">종료한 클래스</a></li>
					</ul>
				</div>

				<!-- 클래스 목록  -->
				<div class="class_list"></div>
				
				<!--페이징-->
				<!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
				<div class="page_nation"></div>
				

			</div>


		</main>
      
    <%@ include file="../include/footerTemplate.jsp" %>  <!-- 경로를 확인해 주세요 --> 
    
    </div>  
    
      
  </body>
</html>
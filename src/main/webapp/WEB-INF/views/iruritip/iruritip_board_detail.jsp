<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
		prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
   href="${RESOURCES_PATH}/src/css/page/iruritip_main.css">
   
<link rel="stylesheet"
   href="${RESOURCES_PATH}/src/css/iruri_tip/iruri_detail.css">

<%@ include file="../include/static.jsp"%>
<title>이루리 게시판 상세</title>


</head>
<body>
	<div class="iruri__wrapper">
	<%@ include file="../include/headerTemplate.jsp"%>
					
	
	
	<!-- 콘텐츠 -->
	<div class="container content">
	     <div class="boardtop">
               <span>커뮤니티&nbsp;</span>
               <span>> 이루리팁</span></div>
           <div class="display_flex">
               <div class="board_iruritip_title">하루 1000 칼로리 식단입니다!</div>
               <div class="dropdown">
                   <button class="dropbtn">:</button>
                   <div class="dropdown-content">
                       <a href="#">수정</a>
                       <a href="#">삭제</a>
                       <a href="#">신고</a>
                       <a href="#">감추기</a>
                   </div>
               </div>
           </div>

           <div class="margin_20px">
               <span>몸짱아줌마</span>&nbsp;|&nbsp;<span>2021.07.01 </span>&nbsp;|&nbsp;<span>342569</span>
           </div>

           <div class="margin_20px" border-radius=50px>
           <center>
           <img src="/ex/resources/src/img/icon/diet.png" width=800px height=400px style="border-radius:50px">
           </center>
           </div>

           <div class="board_text">
           		다이어트 하시느라 힘드신 분들 많으시죠?<br>
           		
다이어트식단에는 생각보다 많은 종류가 있습니다!<br>
<br>
사람의 하루 권장 칼로리는 몸무게와 키에 따라 다른데요! 팁을 드리겠습니다!
<br>
​
고독한 2020년이 지나고
<br>
어느덧 2021년 봄이 찾아왔습니다.<br>

예년과 다르게 이번 봄은 참 더운 것 같아요.

​
<br><br>
제 기억에 대학시절(언제적이냐...)

4월은 눈보라가 친 적이 있는데 말이죱 ㅇ,ㅇ

급 따듯해진 날씨에 얇아진 옷 피팅이
<br>
두려운 분들을 위해 샐러드 꿀팁을 드립니다!<br>
다이어트만 시작하면 토끼마냥
<br>
생풀을 씹어대기에 우리의 미각은

너무나 소중하잖아요 ^^
<br><br>
​

곡물이나 토핑만 잘 선택해도

샐러드를 더욱 아삭하고 맛있게
<br>
드실 수 있으니까 참고하시면 좋을 것 같아요 ㅎ
<br>
​

저희 엄마가 일주일치 드시고 있는 식단인데
<br>
단백질은 챙기면서도 체지방은 빠질 수 있는
<br>
샐러드 재료이니까 다이어트를 노리는
<br>
50대 주부님들은 꼭 참고해주세요^^
<br><br><br>
1. 오트밀<br><br>

외국에서 아침 대용으로 많이 먹는 오트밀은 식이섬유가 정말 풍부해요. <br>보통 쿠키나 빵으로 만들어 먹거나 우유에 개어 먹는데요, 물에 불려서 샐러드 토핑으로 먹어도 아주 좋아요.
<br><br><br><br><br> 섬유질이 많아서 숙변을 제거해주고 장내 노폐물도 쭉쭉 빼준답니다. 해독작용 뿐만 아니라 신장, 심장, 동맥경화, 고혈압에도 좋은 오트밀!
<br>
하지만 과유불급이랄까요? 오트밀은 탄수화물 함량이 높은 편이에요.<br> 그래서 많은 양을 먹기보단 소량을 샐러드에 올려 먹으면 좋아요. <br>닭가슴살 샐러드와 함께 먹으면 단조롭고 퍽퍽한 식감을 부드럽게 만들어주는 효과까지!!
 <br><br> 2. 병아리콩 <br><br>

예전에는 생소했지만 요즘은 콥샐러드에 들어가는 요녀석을 심심치 않게 보셨을거예요. <br>이름도 귀여운 병아리콩. 병아리의 얼굴을 닮았다고 해서 붙여진 이집트콩이에요.
<br>
 고소한 맛이 나고 크기도 어느정도 있어 씹는 감이 좋아요. <br>단백질이 풍부하고 세계 수퍼푸드에 이름을 올리고 있는 대단한 녀셕이죠. 
<br>
섬유질이 풍부해서 당뇨병 환자에게 좋고, 병아리콩을 이용해서 다이어트를 해도 효과적이에요. <br>다만 병아리콩에 들어있는 단백질은 트립토판과 메티오닌이 부족해서 오트밀과 함께 먹으면 훌륭하게 보완이 된답니다.
<br>
여느 콩과 마찬가지로 병아리콩도 물에 불려서 조리하면 돼요.<br><br><br>

3.퀴노아
<br><br><br>
글루텐이 없는 슈퍼푸드 퀴노아! 새롭게 떠오른지 좀 된(?) 고단백 다이어트 식품이에요.<br> 
나트륨은 거의 없는데 글루텐까지 없어 글루텐식품에 제한이 있는 분들도 편하게 섭취할 수 있는 곡물이랍니다. <br>흰색, 붉은색, 검은색, 갈색 등 색깔이 다양해서 용도에 맞게 다른 식품과 섞어 먹으면 돼요. 예를 들어, 레드 퀴노아는 샐러드 레시피로 좋고, 화이트 퀴노아는 밥과 함께 먹기도 하죠.<br>
 투명하게 먹기도 하는데 익힌 다음 차갑게 식히면 샐러드와 <br>잘 어울리는 투명한 퀴노아를 만날 수 있어요. 단호박 샐러드,<br> 단가슴살 샐러드에 얹어먹으면 짱!
<br><br>
<br>4. 렌틸콩 
<br><br>
렌즈모양으로 생겨서 '렌즈콩'이라고도 불려요. <br>
변비와 다이어트에 좋은건 물론이거니와 콜레스테롤과 혈당을 낮춰주기 때문에 당뇨병 환자들에게 아주 좋은 식품이죠. 
<br><br>
렌틸콩 샐러드를 드시고 싶다면 렌틸콩을 15~20분 정도 익힌 다음 샐러드 위에 얹어주세요. <br>
아삭아삭한 식감과 올리브 오일, <br>식초를 뿌려 잘 엉길수 있도록 충분히 버무려주세요.<br> 
<br>
간이 안 될 수록 몸에는 좋지만 너무 싱거워서 먹기 불편하다면 소금이나 후추를 뿌려주면 더 산뜻하게 드실 수 있어요

​<br><br><br>

아무리 코로나라서 여행을 못 간들

여름에도 꽁꽁 싸맬 순 없잖아요.<br>
<br>
얇아진 옷만큼 체지방도 얇아지길 원한다면
<br>
지금부터 식단을 조금씩 조절해보세요.
<br>

​

단순히 풀만 있을테니까 맛없어!

소스없으면 못 먹어!
<br>
라고 하지말고 천천히 음미하면서 먹는

습관을 들이면 위에도 건강에도 아주 좋다는 점!
<br>
​

마인드풀 이팅 잊지말고 실천하면서

이번 여름에도 날씬해져봅시다^^
<br><br><br><br><br>


           </div>
           <div>
               <form class="board_reply_insertBox" action="">
                   <table>
                       <tr>
                           <td class="board_reply_textarea">
                               <textarea placeholder="닉네임을 선택 후 작성하세요"></textarea>
                           </td>
                           <td class="board_reply_insertButton">
                               <button>등록</button>
                           </td>
                       </tr>
                   </table>
               </form>
           </div>

           <div class="board_contentbox">
               <div class="board_nickname">
                   <div class="board_name">융쟈양</div>&nbsp;
                   <div class="board_revise">&nbsp;수정 |</div>
                   <div class="board_delete">삭제
                   </div>
               </div>
               <div class="board_nickname">
                   <div class="board_content">우아 저도 마침 다이어틀 하고 있었는데 이런 정보 주셔서 감사합니다! 한번 저렇게 해먹어봐야 겠어요 :) 요즘 이루리에서 홈트 채린지에 도전하고 있는데 다이어트에 효과가 있는것 같아요! 다들 추천합니다~~</div>
               </div>
               <div class="board_nickname">
                   <div class="board_date">2021.07.02 12:12</div>
                   <div class="board_rewrite">답글쓰기</div>
                   <div class="board_call">신고하기</div>
               </div>
           </div>
           
           <div class="board_contentbox">
               <div class="board_nickname">
                   <div class="board_name">톰순이</div>&nbsp;
                   <div class="board_revise">&nbsp;수정 |</div>
                   <div class="board_delete">삭제
                   </div>
               </div>
               <div class="board_nickname">
                   <div class="board_content">꿀정보 감사합니당~~!</div>
               </div>
               <div class="board_nickname">
                   <div class="board_date">2021.07.02 12:12</div>
                   <div class="board_rewrite">답글쓰기</div>
                   <div class="board_call">신고하기</div>
               </div>
           </div>
           
           <div class="board_contentbox">
               <div class="board_nickname">
                   <div class="board_name">나랭이</div>&nbsp;
                   <div class="board_revise">&nbsp;수정 |</div>
                   <div class="board_delete">삭제
                   </div>
               </div>
               <div class="board_nickname">
                   <div class="board_content">샐러드만 먹고 있어서 질리던 참 이였는데 렌틸콩이랑 샐러드랑 같이 먹어봐야 겟어요! 확실히 다이어트에 효과가 있나요?? 히히 어쨋든 좋은 정보 감사합니닿~~ㅎㅎㅎㅎ</div>
               </div>
               <div class="board_nickname">
                   <div class="board_date">2021.07.02 12:12</div>
                   <div class="board_rewrite">답글쓰기</div>
                   <div class="board_call">신고하기</div>
               </div>
           </div>
           
     

           

            <div class="page_nation">
                <a class="arrow prev" href="#"></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a> 
            </div>

            <div class="board_buttons">

                <button>글쓰기</button>
                &nbsp;
                <button>답글</button>
                <div>
                    <button>목록</button>
                    <button>TOP</button>
                </div>

            </div>

            <div class="preview_and_nextview">
                <div class="preview">
                    <div class="up-arrow">△</div>
                    <div class=prewriting>이전글</div>
                    <div class="precontent">두부유부초밥 만들기</div>
                </div>
                <div class="nextview">
                    <div class="down-arrow">▽</div>
                    <div class=nextwriting>다음글</div>
                    <div class="nextcontent">샐러드의 여러 종류!</div>
                </div>
            </div>    
	</div>
	
	 <%@ include file="../include/footerTemplate.jsp"%>
	</div>
</body>
</html>
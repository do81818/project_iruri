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
<%@ include file="../include/static.jsp"%>
<title>이루리팁 메인</title>
<script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/mypage_user_chart.js" defer></script>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
		<div class="iruri__wrapper">

				<%@ include file="../include/headerTemplate.jsp"%>
				<!-- 경로를 확인해 주세요 -->


				  <!-- 콘텐츠 -->
  <div class="container content">
      <!-- 이루리 팁 상단부분 -->
      <div class="tip_top">
        <div class="tip_title"> 커뮤니티 > 이루리팁
        </div>
      </div>
      <hr class="tip_line">  

      <!-- 이루리팁 박스 -->
      <div class="tip_middle">
          <div class="tip_box_left">
              <div class="tipbox_title"><a href="/ex/iruritip/boardlist"> 하루 1000 칼로리 식단입니다!</a></div>
              <div class="tip_list_date"><a href="/ex/iruritip/boardlist">2021.07.01
              <span class="tip_list_hit">조회수 342569회</span></a></div>
              <div class="tipbox_content"><a href="/ex/iruritip/boardlist"><br>다이어트 하시느라 힘드신 분들 많으시죠?<br>다이어트식단에는 생각보다 많은 종류가 있습니다!
              <br>사람의 하루 권장 칼로리는 몸무게와 키에 따라 다른데요</a></div>
          </div>
          <div class="tip_box_right">
            <div class="tipbox_image">
               <img src="/ex/resources/src/img/icon/diet.png">
                 </div>
          </div>
      </div>


      <!-- 댓글 리스트  -->

      <!-- <form class="reply_insertBox" action="">
        <table>
          <tr>
            <td class="reply_textarea"><textarea placeholder="글을 작성하세요."></textarea></td>
            <td class="reply_insertButton"><button>입력</button></td>
          </tr>
        </table>
      </form>
      <div class="reply_count">총 77 개</div> -->


    
      <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/dubu.png"></td>
          <td>
            <p class="tip_list_title">두부 유부초밥 만들기</p>
             <div class="tip_list_date">2021.07.01
              <span class="tip_list_hit">조회수 69회</span></div>
            <p class="tip_list_content">안녕하세요 오늘은 두부 유부초밥 만들기에 대해서 설명할까 합니다. 두부는 고단백질 식단으로써
             <br> 다이어트에는 효과적인 음식중에 하나입니다!</p>
          </td>
          
        </tr>
      </table>
      
            <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/salad.png"></td>
          <td>
            <p class="tip_list_title">샐러드의 여러 종류!</p>
            <div class="tip_list_date">2021.07.03
              <span class="tip_list_hit">조회수 3469회</span></div>
            <p class="tip_list_content">안녕하세요 여러분! 아침식사로 대신하기 좋은 간단한 샐러드를 소개해드리려 합니다. 
             <br> 샐러드는 각종 야채들과 닭가슴살, 연어 등이 포함되어 있는 음식인데요 !</p>
          </td>
          
        </tr>
      </table>
      
            <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/diet.png"></td>
          <td>
            <p class="tip_list_title">이렇게만 드시면 살이 빠집니다!</p>
           <div class="tip_list_date">2021.07.5
              <span class="tip_list_hit">조회수 145회</span></div>
            <p class="tip_list_content">안녕하세요 오늘은 일주일동안의 단기 다이어트를 위한 저칼로리 식단을 소개해 드리려 합니다!
             <br>이 식단은 빠르게 살을 빼야 하는 분들이 아니면 따라하지 마세요!</p>
          </td>
          
        </tr>
      </table>
      
            <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/exercise.png"></td>
          <td>
            <p class="tip_list_title">헬린이 탈출을 위한 벤치프레스 입문기</p>
            <div class="tip_list_date">2021.07.25
              <span class="tip_list_hit">조회수 342569회</span></div>
            <p class="tip_list_content">헬린이 분들을 위한 간단한 운동 설명을 드리려 합니다! 그것은 바로 벤치프레스!
             <br>다들 겁먹지 마시고 천천히 따라해 주세요</p>
          </td>
          
        </tr>
      </table>
      
            <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/walk.png"></td>
          <td>
            <p class="tip_list_title">아침 30분 조깅이 인생을 바꾼다.</p>
            <div class="tip_list_date">2021.08.02
              <span class="tip_list_hit">조회수 669회</span></div>
            <p class="tip_list_content">아침에 간단히 하는 조깅이 건강에 얼마나 큰 영향을 미치는지 알고 계십니까??
             <br>저는 약 2달동안 아침운동으로 조깅을 해 보았습니다.</p>
          </td>
          
        </tr>
      </table>





          <!-- 페이징 태그(댓글, 게시글 등 다양하게 사용)-->
    <div class="page_nation">
        <a class="arrow prev" href="#"></a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
       
        <a class="arrow next" href="#"></a>
      </div>
    
  </div>


				<%@ include file="../include/footerTemplate.jsp"%>
				<!-- 경로를 확인해 주세요 -->

		</div>
</body>



</html>
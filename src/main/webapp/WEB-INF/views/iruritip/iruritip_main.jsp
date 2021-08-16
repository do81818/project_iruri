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
<title>마이페이지 메인</title>
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
              <div class="tipbox_title">영상제목입니다</div>
              <div class="tipbox_date">2021.07.01</div>
              <div class="tipbox_content">asdfzsdfzzgzsgzgsgsdfsdasdasda<br>asdfzsdfzzgzsgzgsgsdfsdasdasda<br>asdfzsdfzzgzsgzgsgsdfsdasdasda</div>
          </div>
          <div class="tip_box_right">
            <div class="tipbox_image">
               <img src="/ex/resources/src/img/icon/360-250.png">
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
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/360-250.png"></td>
          <td>
            <p class="tip_list_title">이루리팁 제목입니다.</p>
            <p class="tip_list_date">2021.07.04</p>
            <p class="tip_list_hit">조회수 15회</p>
            <p class="tip_list_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto
              quae nam cupiditate
              nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum
              consequatur
              explicabo excepturi.</p>
          </td>
          
        </tr>
      </table>


      <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/360-250.png"></td>
          <td>
            <p class="tip_list_title">이루리팁 제목입니다.</p>
            <p class="tip_list_date">2021.07.04</p>
            <p class="tip_list_hit">조회수 15회</p>
            <p class="tip_list_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto
              quae nam cupiditate
              nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum
              consequatur
              explicabo excepturi.</p>
          </td>
          
        </tr>
      </table>

      <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/360-250.png"></td>
          <td>
            <p class="tip_list_title">이루리팁 제목입니다.</p>
            <p class="tip_list_date">2021.07.04</p>
            <p class="tip_list_hit">조회수 15회</p>
            <p class="tip_list_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto
              quae nam cupiditate
              nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum
              consequatur
              explicabo excepturi.</p>
          </td>
          
        </tr>
      </table>
    


      <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/360-250.png"></td>
          <td>
            <p class="tip_list_title">이루리팁 제목입니다.</p>
            <p class="tip_list_date">2021.07.04</p>
            <p class="tip_list_hit">조회수 15회</p>
            <p class="tip_list_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto
              quae nam cupiditate
              nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum
              consequatur
              explicabo excepturi.</p>
          </td>
          
        </tr>
      </table>



      <table class="tip_list_table">
        <hr class="tip_line">  
        <tr>
          <td class="tip_list_image"><img src="/ex/resources/src/img/icon/360-250.png"></td>
          <td>
            <p class="tip_list_title">이루리팁 제목입니다.</p>
            <p class="tip_list_date">2021.07.04</p>
            <p class="tip_list_hit">조회수 15회</p>
            <p class="tip_list_content">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque pariatur hic, iusto
              quae nam cupiditate
              nostrum dolores unde dicta perferendis temporibus facilis nobis ducimus provident omnis voluptatum
              consequatur
              explicabo excepturi.</p>
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
        <a href="#">5</a>
        <a class="arrow next" href="#"></a>
      </div>
    
  </div>


				<%@ include file="../include/footerTemplate.jsp"%>
				<!-- 경로를 확인해 주세요 -->

		</div>
</body>



</html>
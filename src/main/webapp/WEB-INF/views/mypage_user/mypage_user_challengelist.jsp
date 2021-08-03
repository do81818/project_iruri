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
    <title>마이페이지 챌린지리스트</title> 
      <script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
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

<%@ include file="../include/headerTemplate.jsp" %> 

      <main>
          <!-- 콘텐츠 -->
    <!-- 회원정보 -->
  <div class="container content">
      <div class="m_information_box">
        <div id = "m_userinformation_box">
          <div id="m_nickname"><p>${user.userNickname}</p>
          <button class ="m_information_change">정보수정</button>
          
        </div>
          <div id="m_useremail">       
          <c:if test="${user.authList[0].authContent eq 'ROLE_USER'}">
			<div>일반회원</div>
		</c:if>
		<br>${user.userEmail}</div>
          </div>
        <div id = "m_userboard_box">
          <div id="m_userboard"><a href=".">작성글</a></div>
          <div id ="m_userboard_number">${boardcount}</div>
        </div>
        <div id = "m_userpoint_box">
          <div id="m_userpoint"><a href=".">보유포인트</a></div>
          <div id ="m_userpoint_number">${totalpoint}</div>
        </div>
        <div id = "m_userchanllenge_box">
          <div id="m_userchanllenge"><a href=".">참여중인챌린지</a></div>
          <div id="m_userchanllenge_number">2</div>
        </div>
        <div id = "m_userclass_box">
          <div id="m_userclass"><a href=".">참여중인클래스</a></div>
          <div id="m_userclass_number"></div>
        </div>
      </div>
       
       <!-- 챌린지 리스트박스 -->

                 <div class="m_chanllenge_box">
                    <div id="m_now_chanllengelist_box">
                           <div id="m_now_chanllengelist">신청챌린지</div>
                           <div id="m_now_chanllengelistnb">2</div>
                       
                   </div>
                   <div id="m_pre_chanllengelist_box">
                       <div id="m_pre_chanllengelist">관심챌린지</div>
                        <div id="m_pre_chanllengelistnb">5</div>
                   </div>
                   <div id="m_use_chanllengelist_box">
                       <div id="m_use_chanllengelist">지난챌린지</div>
                       <div id="m_use_chanllengelistnb">3</div>
                   </div>
                </div>



            
                <!-- 신청한 챌린지 -->
                <div class="m_c_text">
                  신청챌린지
              </div>

                      <!--신청챌린지 이미지 2개-->
        <div class="m_c_recommend">
          <img class="m_left" src="/ex/resources/src/img/icon/arrow_blue_left.png">
          <img class="m_right" src="/ex/resources/src/img/icon/arrow_blue_right.png">
          <div class="m_c_recommend_img">
              <div class="m_c_recommend_title">
                  스쿼트, 런지, 플랭크<br> 30일 챌린지
              </div>

              <span class="m_c_recommend_date">
                  2021.03.01~2021.04.01
              </span>


              <div class="m_c_heart">
                  <input type="checkbox" id="heart1"><label for="heart1" class="m_heart_label"></label>
              </div>
          </div>


          <div class="m_c_recommend_img">
              <div class="m_c_recommend_title">
                  러닝 전 5분 스트레칭
              </div>


              <span class="m_c_recommend_date">
                  2021.03.01~2021.04.01
              </span>


              <div class="m_c_heart">
                  <input type="checkbox" id="heart2"><label for="heart2" class="m_heart_label"></label>
              </div>

          </div>
      </div>


<!-- 챌린지 취소 버튼 (모달) -->
      <button class="m_cl_cancel_challenge_bt">챌린지취소</button>
      
      <div class="m_c_main_tab">
        <p class="m_c_like_last">
            <a href="">관심챌린지</a>
        </p>
    </div>

    <!-- 관심챌린지 -->
    <div class="m_c_list">
      <div class="m_c_list_detail">
          <div class="m_c_list_img">
 
        </div>
          
          <div class="m_c_list_title">
              스쿼트, 런지, 플랭크<br> 30일 챌린지
          </div>

          <div class="m_c_list_date">
              2021.03.01~2021.04.01
          </div>

          <div class="m_data_tags">
              <div class="m_data_tag_blue">
                  <i class="m_iruri_level_icon"></i> easy
              </div>
              <div class="m_data_tag_blue">
                  <i class="m_iruri_time_icon"></i> 주 5회 이상
              </div>
              
          </div>

          <div class="m_c_list_price">
            참여중인 인원 00명 (최대인원 20명)
          </div>

          <div class="m_c_list_heart">
              <input type="checkbox" id="heart3"><label for="heart3" class="m_heart_label"></label>
          </div>
    </div>

    <div class="m_c_list_detail">
      <div class="m_c_list_img">

    </div>
      
      <div class="m_c_list_title">
          스쿼트, 런지, 플랭크<br> 30일 챌린지
      </div>

      <div class="m_c_list_date">
          2021.03.01~2021.04.01
      </div>

      <div class="m_data_tags">
          <div class="m_data_tag_blue">
              <i class="m_iruri_level_icon"></i> easy
          </div>
          <div class="m_data_tag_blue">
              <i class="m_iruri_time_icon"></i> 주 5회 이상
          </div>
          
      </div>

      <div class="m_c_list_price">
        참여중인 인원 00명 (최대인원 20명)
      </div>

        <div class="m_c_list_heart">
            <input type="checkbox" id="heart4"><label for="heart4" class="m_heart_label"></label>
        </div>
  </div>

  <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        스쿼트, 런지, 플랭크<br> 30일 챌린지
    </div>

    <div class="m_c_list_date">
        2021.03.01~2021.04.01
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> easy
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 5회 이상
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 00명 (최대인원 20명)
    </div>

    <div class="m_c_list_heart">
        <input type="checkbox" id="heart5"><label for="heart5" class="m_heart_label"></label>
    </div>
</div>

    <div class="m_page_nation">
        <a class="m_arrow_prev" href="#"></a>
        <a href="#" class="m_active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a class="m_arrow_next" href="#"></a>
    </div>
  </div>




   <!-- 지난챌린지 -->
   
   <div class="m_c_main_tab">
    <p class="m_c_like_last">
        <a href="">지난챌린지</a>
    </p>
</div>
   
<div class="m_c_list">
  <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        스쿼트, 런지, 플랭크<br> 30일 챌린지
    </div>

    <div class="m_c_list_date">
        2021.03.01~2021.04.01
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> easy
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 5회 이상
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 00명 (최대인원 20명)
    </div>

  </div>

  <div class="m_c_list_detail">
    <div class="m_c_list_img">

  </div>
    
    <div class="m_c_list_title">
        스쿼트, 런지, 플랭크<br> 30일 챌린지
    </div>

    <div class="m_c_list_date">
        2021.03.01~2021.04.01
    </div>

    <div class="m_data_tags">
        <div class="m_data_tag_blue">
            <i class="m_iruri_level_icon"></i> easy
        </div>
        <div class="m_data_tag_blue">
            <i class="m_iruri_time_icon"></i> 주 5회 이상
        </div>
        
    </div>

    <div class="m_c_list_price">
      참여중인 인원 00명 (최대인원 20명)
    </div>

</div>

<div class="m_c_list_detail">
  <div class="m_c_list_img">

</div>
  
  <div class="m_c_list_title">
      스쿼트, 런지, 플랭크<br> 30일 챌린지
  </div>

  <div class="m_c_list_date">
      2021.03.01~2021.04.01
  </div>

  <div class="m_data_tags">
      <div class="m_data_tag_blue">
          <i class="m_iruri_level_icon"></i> easy
      </div>
      <div class="m_data_tag_blue">
          <i class="m_iruri_time_icon"></i> 주 5회 이상
      </div>
      
  </div>

  <div class="m_c_list_price">
    참여중인 인원 00명 (최대인원 20명)
  </div>

</div>

  <div class="m_page_nation">
      <a class="m_arrow_prev" href="#"></a>
      <a href="#" class="m_active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a class="m_arrow_next" href="#"></a>
  </div>
</div>


       
        

    </div>
 
	
	    <!-- 팝업창  -->
    <div class="modal"  max-width: 400px;
    min-width: 500px;
    margin: 0 auto;
    background-color: #eee;>
      <div class="modal_content" 
           title="클릭하면 창이 닫힙니다.">
           <div class="alertWindow">
            <div class="alertWindow_close"><img src='/ex/resources/src/img/icon/close.png' width="20px" height="20px" > </div>
            <div class="alertWindow_insert">
              <h2 class="alertWindow_title">정보수정</h2>
              <form action="#">
                <p>비밀번호</p>
                <input class="inputbox_size1" type="text"  />
                
                <p>비밀번호 확인</p>
                <input class="inputbox_size1" type="text" />
                
                <p>닉네임</p>
                <input class="inputbox_size2" type="text">
                <p>전화번호</p>
                <input class="inputbox_size2" type="text">
        
                <button class="alertWindow_submit" type="submit">비밀번호 변경</button>
              </form>
            </div>
          </div>
    </div>
  </div>

	
	      <!-- 챌린지취소  -->
      <div class="challenge_cancel"  max-width: 400px;
      min-width: 500px;
      margin: 0 auto;
      background-color: #eee;>
        <div class="modal_content" 
             title="클릭하면 창이 닫힙니다.">
             <div class="alertWindow_class">
              <div class="alertWindow_close"><img src="/ex/resources/src/img/icon/close.png" width="20px" height="20px" > </div>
              <div class="alertWindow_insert">
                <h2 class="alertWindow_title">챌린지 취소</h2>
                <form action="#">
                  <p class="alertWindow_content">정말로 챌린지를<br> 취소하시겠습니까?<br>챌린지는시작전에 다시신청 가능합니다.</p>
                  <button class="alertWindow_submit_class" type="submit">클래스취소</button>
                </form>
              </div>
            </div>
      </div>
    </div>

      </main>
      
   <%@ include file="../include/footerTemplate.jsp" %> 
    
    </div>    
  </body>
</html>
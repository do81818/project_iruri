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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="UTF-8">
    <meta name="_csrf_header" th:content="${_csrf.headerName}">
    <meta name="_csrf" th:content="${_csrf.token}">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="${RESOURCES_PATH}/src/js/bootstrap.bundle.js" defer></script>
    <script src="${RESOURCES_PATH}/src/js/headerHover.js" defer></script>
    <title>이루리 통합검색</title> <!-- 페이지 이름을 적어주세요 -->
    <link href="${RESOURCES_PATH}/src/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${RESOURCES_PATH}/src/css/admin/admin_main_search.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div class="iruri__wrapper">

    <%@ include file="include/headerTemplate.jsp" %>

      <main>
          <div class="result_container __challenge">
          <h3>
              챌린지 검색 결과
          </h3>
          <p>총 <sapn>2</sapn> 건</p>
          <div>
              <table class="search_result_list admin_table">
                  <tr>
                      <td>
                          <h2 class="result_class_title">러닝 전 5분 스트레칭</h2>
                          <p class="result_location">홈<span></span>챌린지</p>
                          <br>
                          <div class="tag_type_blue">
                              <span class="tag_icon __level"></span><span class="tag_text">EASY</span>
                          </div>
                          <div class="tag_type_blue">
                              <span class="tag_icon __time"></span><span class="tag_text">5분</span>
                          </div>
                          <p class="result_class_etcInfo">2021.03.01 ~ 2021.04.01</p>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <h2 class="result_class_title">러닝 전 5분 스트레칭</h2>
                          <p class="result_location">홈<span></span>챌린지</p>
                          <br>
                          <div class="tag_type_blue">
                              <span class="tag_icon __level"></span><span class="tag_text">EASY</span>
                          </div>
                          <div class="tag_type_blue">
                              <span class="tag_icon __time"></span><span class="tag_text">5분</span>
                          </div>
                          <p class="result_class_etcInfo">2021.03.01 ~ 2021.04.01</p>
                      </td>
                  </tr>
              </table>
          </div>
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
  
      <!-- 클래스 리스트 -->
      <div class="result_container __challenge">
          <h3>
              PT클래스 검색 결과
          </h3>
          <p>총 <sapn>2</sapn> 건</p>
          <div>
              <table class="search_result_list admin_table">
                  <tr>
                      <td>
                          <h2 class="result_class_title">몸치도 할 수 있는 복싱댄스!!</h2>
                          <p class="result_location">홈<span></span>PT클래스</p>
                          <br>
                          <div class="tag_type_blue">
                              <span class="tag_icon __level"></span><span class="tag_text">EASY</span>
                          </div>
                          <div class="tag_type_blue">
                              <span class="tag_icon __time"></span><span class="tag_text">5분</span>
                          </div>
                          <div class="tag_type_red">
                              <span class="tag_text">요가</span>
                          </div>
                          <div class="tag_type_red">
                             </span><span class="tag_text">피트니스</span>
                          </div>
                          <p class="result_class_etcInfo">트레이너 강 │ 2021.03.01 ~ 2021.04.01</p>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <h2 class="result_class_title">러닝 전 5분 스트레칭</h2>
                          <p class="result_location">홈<span></span>챌린지</p>
                          <br>
                          <div class="tag_type_blue">
                              <span class="tag_icon __level"></span><span class="tag_text">EASY</span>
                          </div>
                          <div class="tag_type_blue">
                              <span class="tag_icon __time"></span><span class="tag_text">5분</span>
                          </div>
                          <div class="tag_type_red">
                              <span class="tag_text">요가</span>
                          </div>
                          <div class="tag_type_red">
                              <span class="tag_text">피트니스</span>
                          </div>
                          <p class="result_class_etcInfo">트레이너 강 │ 2021.03.01 ~ 2021.04.01</p>
                      </td>
                  </tr>
              </table>
          </div>
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
  
      <!-- 커뮤니티 리스트 -->
      <div class="result_container __challenge">
          <h3>
              커뮤니티 검색 결과
          </h3>
          <p>총 <sapn>2</sapn> 건</p>
          <div>
              <table class="search_result_list admin_table">
                  <tr>
                      <td>
                          <h2 class="result_community_title">몸치도 할 수 있는 복싱댄스!!</h2>
                          <p class="result_location">홈<span></span>이루리운동<span></span>이루리팁</p>
                         
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <h2 class="result_community_title">러닝 전 5분 스트레칭</h2>
                          <p class="result_location">홈<span></span>이루리운동<span></span>자유게시판</p>
                  </tr>
              </table>
          </div>
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
      </main>
      
    <%@ include file="include/footerTemplate.jsp" %>
    
    </div>    
  </body>
</html>
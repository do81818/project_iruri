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
    <title>이루리 메인</title> <!-- 페이지 이름을 적어주세요 -->
    <script src=""></script> <!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
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
						<li class="class_MenuBar_text_now"><a href="#">클래스관리</a></li>
						<li class="class_MenuBar_text"><a href="#">회원관리</a></li>
						<li class="class_MenuBar_text"><a href="#">클래스댓글조회</a></li>
						<li class="class_MenuBar_text"><a href="#">수익관리</a></li>
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
                            2,004,500<span class="pt_won">&nbsp;원</span>
                        </td>
                        <td class="pt_pre_month"><span>이전달</span>
                            <a href=""><img src="../image/arrow_red_left.png" alt="up" class="arrow_width_up_down"></a>
                        </td>
                        <td class="pt_next_month"><span>다음달</span>
                            <a href=""><img src="../image/arrow_red_right.png" alt="up" class="arrow_width_up_down"></a>
                        </td>
                    </tr>

                </table>

                <table class="pt_class_profit">
                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>
                    <br>
                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                    <tr>
                        <td class="pt_class_profit_date">07.06</td>
                        <td>
                            <a class="pt_class_profit_title" href="#">
                                스쿼트, 런지, 플랭크 30일 클래스
                            </a>
                        </td>
                        <td class="pt_class_profit_money">150,000</td>
                    </tr>

                </table>

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
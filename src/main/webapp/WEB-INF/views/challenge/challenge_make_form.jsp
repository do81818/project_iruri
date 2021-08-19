<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

                <!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
                <c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
                <c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
                <!DOCTYPE html>
                <html lang="ko">

                <head>
                    <%@ include file="../include/static.jsp"%>
                        <!-- 경로를 확인해 주세요 -->


                        <title>챌린지 개설 폼</title>
                        <!-- 페이지 이름을 적어주세요 -->


                        <!-- Air datepicker js -->
                        <script src="${RESOURCES_PATH}/src/js/challenge/datepicker.js" defer></script>
                        <!-- 달력 한글 추가를 위해 커스텀 -->
                        <script src="${RESOURCES_PATH}/src/js/challenge/datepicker.ko.js" defer></script>

                        <script src="${RESOURCES_PATH}/src/js/challenge/c_check.js" defer></script>
                        <script src="${RESOURCES_PATH}/src/js/challenge/c_calendar.js" defer></script>

                        <link href="${RESOURCES_PATH}/src/css/page/datepicker.min.css" rel="stylesheet" type="text/css" media="all">


                </head>

                <body>



                    <div class="iruri__wrapper">

                        <%@ include file="../include/headerTemplate.jsp"%>
                            <!-- 경로를 확인해 주세요 -->

                            <main>
                                <div class="c_container">
                                    <div class="c_makeForm_insert">

                                        <form class="c_makeForm" method="POST" action="/ex/iruri/insert_challenge" accept-charset="utf-8" enctype="multipart/form-data">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <h2 class="c_makeForm_title">챌린지 개설</h2>

                                            <div class="c_name">
                                                <p>챌린지명</p>
                                                <input type="text" class="inputbox_size1" name="classTitle" autocomplete="off" placeholder="챌린지 제목을 입력해 주세요." required="required" autofocus />
                                            </div>

                                            <div class="c_strength">
                                                <p>운동강도</p>
                                                <input type="radio" name="classLevel" id="easy" value="easy" required="required" />
                                                <label for="easy" class="rd_label">easy</label>
                                                <input type="radio" name="classLevel" id="normal" value="normal">
                                                <label for="normal" class="rd_label">normal</label>
                                                <input type="radio" name="classLevel" id="hard" value="hard">
                                                <label for="hard" class="rd_label">hard</label>
                                            </div>

                                            <div class="c_period">
                                                <p>운동기간</p>
                                                <input type="text" name="classStartDate" id="sDate" autocomplete="off" required="required" />&nbsp - &nbsp
                                                <input type="text" name="classEndDate" id="eDate" autocomplete="off" required="required" /> <br>
                                            </div>

                                            <div class="c_exNum">
                                                <p></p>
                                                <input type="radio" name="classExerciseCount" id="all" value="7" required="required" />
                                                <label for="all" class="rd_label">매일</label>
                                                <input type="radio" name="classExerciseCount" id="5days" value="5">
                                                <label for="5days" class="rd_label">주 5회이상</label>
                                                <input type="radio" name="classExerciseCount" id="3days" value="3">
                                                <label for="3days" class="rd_label">주 3회이상</label>
                                                <input type="radio" name="classExerciseCount" id="1day" value="1">
                                                <label for="1day" class="rd_label">주 1회이상</label>
                                            </div>

                                            <div class="c_person">
                                                <p>총모집인원</p>
                                                <input type="text" id="c_text" class="inputbox_size2" name="classTotalMember" autocomplete="off" pattern="[0-9]+" placeholder="숫자로 입력해 주세요." required="required" />&nbsp명&nbsp

                                                <input type="checkbox" id="cb6" name="classTotalMember" value="99999" onclick="c_person_limit(this.form)" /><label for="cb6" class="cb_label">인원제한없음</label>
                                            </div>

                                            <div class="c_goal">
                                                <p>목표</p>
                                                <textarea placeholder="짧은 목표를 작성해 주세요." cols="30" rows="50" class="goal_textarea" name="classGoal" autocomplete="off" required="required" /></textarea>
                                            </div>

                                            <div class="c_detailInfo">
                                                <p>상세 정보</p>
                                                <textarea placeholder="페이지에 들어갈 상세 정보를 작성해 주세요." cols="30" rows="50" class="info_textarea" name="classContent" autocomplete="off" required="required" /></textarea>
                                            </div>

                                            <div class="c_img_direct">
                                                <p>대표이미지 설정</p>
                                                <!-- <input type="radio" id="direct" name="imageCheck" value="customImage"/>
                                                <label for="direct" class="rd_label">직접 이미지 올리기</label>  -->
                                                
                                                <input type="file" name="uploadFile" accept=".jpg, .png" id="upload">
                                                <label for="upload" class="file_upload"></label>
                                                <span style="color: #999; position: relative; top: 10px;">* 최대 5MB 크기의 jpg.png</span>
                                            </div>
                                            
                                            <span class="uploadResult_makeForm">
                                            <p></p>
                                            </span>
                                            

                                            <!-- <div class="c_img_basic">
                                                <p></p>
                                                <input type="radio" id="basic" name="imageCheck" value="defaultImage" checked><label for="basic" class="rd_label">기본 이미지 사용</label>
                                            </div> -->

                                            <div class="button">
                                                <p></p>
                                                <button class="c_make_button_cancle" type="reset"><a href="challengeList">챌린지등록 취소</a></button>
                                                <button class="c_make_button_submit" type="submit">챌린지등록</button>
                                            </div>



                                        </form>

                                    </div>

                                </div>
									<script>
                                        // 파일명 안내
                                        $(document).ready(function() {
                                        	
                                            var inputFile = document.querySelector('input[name="uploadFile"]');
                                            $(inputFile).on('change', function() {

                                                var fileName = inputFile.files[0].name;

                                                inputFile.files[0].name = encodeURIComponent(inputFile.files[0].name);

                                                $('.uploadResult_makeForm').html(fileName);
                                            });

                                        });
                                        
                                        </script>
                            </main>

                            <%@ include file="../include/footerTemplate.jsp"%>
                                <!-- 경로를 확인해 주세요 -->

                    </div>
                </body>

                </html>
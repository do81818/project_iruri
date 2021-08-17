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

<html lang="en">

<head>
<link rel="stylesheet"
   href="${RESOURCES_PATH}/src/css/page/iruritip_main.css">
<%@ include file="../include/static.jsp"%>
<title>이루리팁글쓰기</title>
<script src="${RESOURCES_PATH}/src/js/mypage_user_main.js" defer></script>
<script src="${RESOURCES_PATH}/src/js/mypage_user_chart.js" defer></script>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

<body>

    <div class="container">
        <div class="bw_makeForm_insert">


            <form class="bw_makeForm" action="#">
                <!--accept-charset="utf-8" name="c_make_form" method="GET"-->
                <h2 class="bw_makeForm_title">게시판 글쓰기</h2>

                <div class="bw_name">
                    <p>글 제목</p>
                    <input type="text" class="bw_inputbox_size1">
                </div>




                <div class="bw_goal">
                    <p>글 내용</p>
                    <textarea cols="30" rows="50" class="bw_goal_textarea"></textarea>
                </div>


                <div class="bw_img_direct">
                    <p class="bw_main_img">대표이미지 설정</p>
                    <!-- <input type="radio" name="img" id="bw_direct"> -->
                    <label for="direct" class="bw_label"><br></label>
                    <input type="file" id="upload"><label for="upload" class="bw_file_upload"></label>
                    <span style="color:#999 ;">* 650x500px 크기의 jpg.png</span>
                </div>

                </div>



                <div class="bw_button">
             
                    <button class="bw_make_button_cancle" type="reset">글쓰기 취소</button>
                    <button class="bw_make_button_submit" type="submit">글 등록</button>
                </div>


            </form>

        </div>

  
</body>

<style>


/* 폼 가로 길이*/

.bw_makeForm {
    margin: 0 auto;
    width: 660px;
}


/*글쓰기타이틀*/

.bw_makeForm_title {
    margin-top: 65px;
    margin-bottom: 44px;
    font-size: 22px;
    color: var(--iruri-indigo-color);
    font-family: 'Cafe24Ssurround';
    width: 660px;
    text-align: center;
    margin-bottom: 50px;
    margin-left: 20px;
}

.bw_makeForm_insert {
    position: relative;
    padding: 44px 70px;
}


/*..*/

form div p {
    color: var(--iruri-blue-color);
    font-size: 16px;
    width: 135px;
    float: left;
    line-height: 44px;
    height: 44px;
}


/* 대표 이미지 설정 */
.bw_main_img{
    
}

/*인풋박스*/

form div input:not(.bw_goal) {
    height: 44px;
    border-radius: 5px;
    margin-bottom: 24px;
    border: 1px solid var(--iruri-light-gray-color);
    outline: none;
    padding: 3px 20px;
    color: var(--iruri-indigo-color);
    font-size: 14px;
}

.bw_kind,
.bw_strength,
.bw_period,
.bw_exNum,
.bw_person,
.bw_img_direct,
.bw_img_basic {
    margin-bottom: 24px;
    height: 44px;
}

.bw_goal {
    margin-bottom: 24px;
}


/*체크박스*/

.bw_label {
    line-height: 44px;
    margin-right: 25px;
}

input[type=checkbox] {
    display: none;
}

input[type=checkbox]+label {
    display: inline-block;
    cursor: pointer;
    padding-left: 30px;
    background: url('../images/images/icon/check_no.png') left/22px no-repeat;
}

input[type=checkbox]:checked+label {
    background-image: url('../images/images/icon/check_yes.png');
}


/*라디오버튼 */
/* 
.rd_label {
    line-height: 44px;
    margin-right: 20px;
}

input[type=radio] {
    display: none;
}

input[type=radio]+label {
    display: inline-block;
    cursor: pointer;
    padding-left: 30px;
    background: url('../images/images/icon/check_no.png') left/22px no-repeat;
}

input[type=radio]:checked+label {
    background-image: url('../images/images/icon/check_yes.png');
} */


/*파일올리기 버튼*/
/* .bw_png{
    float: right;
    margin-bottom: 5px;
} */
.bw_file_upload {
    margin-right: 5px;
    margin-left: -54px;
    /* margin-top: -100px; */
}


input[type=file] {
    display: none;
}

input[type=file]+label {
    display: inline;
    cursor: pointer;
    padding: 20px 80px;
    background: url("/ex/resources/src/img/icon/img_upload.png") center center no-repeat;
    background-size: 70%;
    margin-top: 60px;
}

input[type=file]:checked+label {
    background-image: url('../icon/file.png');
}


/*인풋박스 사이즈들*/

.bw_inputbox_size1 {
    width: 525px;
}

.bw_inputbox_size2 {
    width: 263px;
}

.bw_goal_textarea {
    width: 525px;
    height: 300px;
    border-radius: 5px;
    border: 1px solid var(--iruri-light-gray-color);
    margin-bottom: 24px;
    outline: none;
    padding: 3px 20px;
    color: var(--iruri-indigo-color);
    font-size: 14px;
}

input[type=date] {
    width: 245.915px;
}


/*대표이미지 기본이미지*/

.bw_img_list {
    clear: both;
    width: 660px;
    margin: 0 auto;
    margin-bottom: 77px;
}

.bw_img_detail {
    display: inline-block;
    text-align: center;
    width: 123px;
    height: 123px;
    border: 1px solid;
    border-radius: 30px;
    border: none;
    outline: none;
    background-color: var(--iruri-gray-color);
}


/*취소, 등록 버튼*/

.bw_button button {
    width: 190px;
    height: 55px;
    border-radius: 27px;
    border: none;
    outline: none;
    font-size: 16px;
    margin: 0 auto;
    cursor: pointer;
    margin-right: 22px;
    text-align: center;
    float: center;
    margin-bottom: 40px;
    margin-top: 40px;



    
}

.bw_make_button_cancle {
    background-color: var(--iruri-light-gray-color);
    color: white;
    position: relative;
    left: 430px;
  
}

.bw_make_button_submit {
    background-color: var(--iruri-blue-color);
    color: var(--iruri-yellow-color);
    position: relative;
    left: 430px;
}




</style>

</html>
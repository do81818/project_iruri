<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>miniproject_board</title>
<link href="../resources/css/boardList.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

</head>

<body>

	<%@ include file="../includes/header.jsp"%>

	<article>
		<h3>게시판 리스트</h3>
		<table>
			<tr>
				<th style="width: 10%;">No.</th>
				<th style="width: 48%;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 15%;">작성일</th>
				<th style="width: 12%;">조회수</th>
			</tr>
			<c:forEach items="${list }" var="board">
				<tr>
					<td><c:out value="${board.bid }" /></td>
					<td><a class="move"
						href='<c:out value="${board.bid }" />' class="boardSelect"><c:out
								value="${board.btitle }" /></a></td>
					<td><c:out value="${board.bname }" /></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd"
							value="${board.bdate }" /></td>
					<td><c:out value="${board.bhit }" /></td>
				</tr>
			</c:forEach>
		</table>
		<div class="writeButton">
			<a href="write"><button>글쓰기</button></a>
		</div>


		<div class="paging">
			<%-- <h3>${pageMaker }</h3> --%>
			<c:if test="${pageMaker.prev }">
				<a class="pagePrev" href="${pageMaker.startPage -1 }"><button>
						< 이전페이지</button></a>
			</c:if>


			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage }">
				<a class="pageNumLink ${pageMaker.cri.pageNum == num ? "
					active":"" }" href="${num}">${num }</a>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<a class="pageNext" href="${pageMaker.endPage +1 }"><button>다음페이지
						></button></a>
			</c:if>
		</div>

		<form id="actionForm" action="list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>

	</article>



	<script>
        var actionForm = $("#actionForm");
        $(".pageNumLink").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
        
        $(".pagePrev").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
        
        $(".pageNext").on("click", function(e) {
            e.preventDefault();
            var targetPage = $(this).attr("href");
            
            actionForm.find("input[name='pageNum']").val(targetPage);
            actionForm.submit();
        });
        
        $(".move").on("click", function (e){
            e.preventDefault();
            
            var tagetBid = $(this).attr("href");
          	actionForm.append("<input type='hidden' name='bid' value='"+tagetBid+"'>");
          	actionForm.attr("action", "get");
          	actionForm.submit();
            
        });
        
    </script>

	<%@ include file="../includes/footer.jsp"%>
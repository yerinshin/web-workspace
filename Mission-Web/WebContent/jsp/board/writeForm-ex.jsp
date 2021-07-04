<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	if('${ userVO }' == '') {
		location.href="/Mission-Web/jsp/login/login.jsp"
	}
		
	$(document).ready(function() {
		$('#goListBtn').click(function() {
			location.href = "list.jsp"
		})
	})
	
	function doWrite()	{
		
		let f = document.writeForm
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}
		
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		return true
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
	<div align="center">
		<hr>
			<h2>게시글 등록폼</h2>
		<hr>
		<br>
		<form action="write.jsp" method="post" 
				name="writeForm" onsubmit="return doWrite()">
			<%-- 입력받지 않고 파라미터로 넘기고 싶은 값이 있을 때, <input type="hidden"> 사용 --%>
			<input type="hidden" name="writer" value="${ userVO.id }">
			<table>
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" size="60" name="title">
					</td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>
						<c:out value="${ userVO.id }" />
						<%-- <input type="text" size="60" name="writer" value="${ userVO.id }" readonly> --%>
					</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="8" cols="60" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
			<input type="button" value="목록" id="goListBtn">
		</form>
	</div>
</section>
<footer>
	<%@ include file="/jsp/include/bottom.jsp" %>
</footer>
</body>
</html>
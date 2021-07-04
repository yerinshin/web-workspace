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
		
		//파일 확장자 체크
		if(checkExt(f.attachfile1))
			return false
		if(checkExt(f.attachfile2))
			return false
				
			
		return true
	}
	
	function checkExt(obj) {
		let forbidName = ['exe','java','jsp','js','class']
		let fileName = obj.value		//파일obj.value 가 파일명
		
		let ext = fileName.substring(fileName.lastIndexOf('.')+1)
		console.log(ext)
		
		for(let i = 0; i < forbidName.length; i++ ){
			if(forbidName[i] == ext){
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다')
				return true
			}
		}
		return false
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
				name="writeForm" onsubmit="return doWrite()"
				enctype="multipart/form-data">
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
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1">
						<input type="file" name="attachfile2">
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
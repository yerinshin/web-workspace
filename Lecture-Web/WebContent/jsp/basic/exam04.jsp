<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1 ~ 10사이의 임의의 정수 출력</h2>
	<%
	//	java.util.Random r = new java.util.Random();
		Random r = new Random();
		int random = r.nextInt(10) + 1;
	%>
	추출된 정수: <%= random %><br>
</body>
</html>
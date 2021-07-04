<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");		// 리턴타입 : Object --> 명시적 형변환 필요
	String password = (String)session.getAttribute("password");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	설정된 세션 ID : <%= id %><br>
	설정된 세션 PASSWORD : <%= password %><br> 
	<hr>
	설정된 세션 ID : ${ sessionScope.id }<br> 
	설정된 세션 PASSWORD : ${ sessionScope.password }<br>
	<br>
	<a href="remove.jsp">세션 삭제</a>
</body>
</html>
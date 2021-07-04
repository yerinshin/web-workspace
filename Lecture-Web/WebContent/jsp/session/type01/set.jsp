<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 뽑아온 데이터 세션에 등록
	session.setAttribute("id", id);
	session.setAttribute("password", password);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 설정 완료</h2>
	<a href="get.jsp">설정된 세션정보 조회</a>
</body>
</html>
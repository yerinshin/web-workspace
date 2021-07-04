<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결과화면</h2>				
	<c:if test="${ param.id  eq 'admin' }">
		<%
			response.sendRedirect("admin.jsp");
		%>
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%	
			//sendRedirct 는 request 공유영역 사용 불가능하므로 parameter직접 넘겨줘야함
			response.sendRedirect("user.jsp?id=" + request.getParameter("id")); 
		%>
	</c:if>
</body>
</html>
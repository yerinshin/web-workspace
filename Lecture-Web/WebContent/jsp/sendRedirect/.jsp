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
	<h2>결과화면</h2>				<%-- forward 시키면 주소는 forwardSet.jsp 그러나, <h2>결과화면</h2>는 보이지 않음 --%>
	<c:if test="${ param.id  eq 'admin' }">
		<jsp:forward page="admin.jsp"/>
	</c:if>
</body>
</html>
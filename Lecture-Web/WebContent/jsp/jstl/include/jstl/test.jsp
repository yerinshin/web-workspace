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
<%-- 	<jsp:include page="https://www.daum.net" />    : error! --> 외부의 url은 사용 불가 --%>  

	<c:import url="https://www.daum.net" />
</body>
</html>
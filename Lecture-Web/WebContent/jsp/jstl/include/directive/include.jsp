<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		지시자 include : 다른페이지의 코드를 내 코드로 포함시킴
		공통부분의 소스코드가 include시킨 모든 파일의 servlet 파일에 다 추가됨. 길어지면 길어질 수록 지시자 include 잘 사용하지 않음
		jsp가 java로 변환될 때 같이 포함됨
	--%>

	msg : <%= msg %>
	<h2>인클루드 전</h2>
	<%@ include file="one.jsp" %>
	<h2>인클루드 후</h2>
</body>
</html>
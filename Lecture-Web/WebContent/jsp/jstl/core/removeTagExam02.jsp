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
	1값을 가지는 변수 cnt를 공유영역에 등록(page)<br>
	<c:set var="cnt" value="1" />
	
	공유영역에 등록된 변수 cnt 출력<br>
	cnt : ${ cnt }<br>
	
	cnt변수에 1을 더한 후 cnt값을 출력<br>
	<%-- 변수 제어하고 싶을 때 : el과 함께 사용 --%>
	<c:set var="cnt" value="${ cnt + 1 }" scope="request"/>  
	
	cnt : ${ cnt }<br>							<!-- 1 -->
	request cnt : ${ requestScope.cnt }<br>		<!-- 2 -->
	
	request 공유영역에 등록된 cnt변수 삭제<br>
	<%-- <c:remove var="cnt" scope="request" /> --%>
	<c:remove var="cnt"/>
	
	cnt삭제후<br>
	cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
</body>
</html>
<%--
	-------------------------------------------------------------------
		JSP 공유영역				EL 공유영역 				JSTL 공유영역
	-------------------------------------------------------------------
		pageContext				pageScope				page
		request					requestScope			request
		session					sessionScope			session
		application				applicationScope		application
	-------------------------------------------------------------------

--%>
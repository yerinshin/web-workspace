<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"홍길동", "강길동", "윤길동", "박길동"};

	pageContext.setAttribute("names", names);
	pageContext.setAttribute("namesLength", names.length);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	"hello world" 문자열 길이 : ${ fn:length("hello world") }<br>
	배열의 요소개수 : ${ fn:length(names) }<br>
	
	first:index:count:last<br>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		${ loop.first } : ${ loop.index } : ${ loop.count } : ${ loop.last }<br>   
	</c:forEach>
	
	<c:forEach items="${ names }" var="name" varStatus="loop">
	<%-- <c:if test="${ loop.index ne 0}"> --%>
	<%-- <c:if test="${ loop.count ne 1}"> --%>
		<c:if test="${ not loop.first }">
		,
		</c:if>
		${ name }
	</c:forEach>
	<hr>
	<c:set var="cnt" value="0"/>
	<c:forEach items="${ names }" var="name">
		<c:if test="${cnt != 0}">
		,
		</c:if>
		${ name }
		<c:set var="cnt" value="${ cnt+1 }" />
	</c:forEach>
	<c:remove var="cnt" scope="page" />
	<hr>
	
	<c:forEach begin="0" end="${ namesLength -1}" var="i">
		<c:if test="${ i ne 0 }">
			,
		</c:if>
		${ names[i] }
	</c:forEach>
	<hr>
	<c:forEach begin="0" end="${ fn:length(names)-1 }" var="i">
		<c:if test="${ i ne 0 }">
			,
		</c:if>
		${ names[i] }
	</c:forEach>
	
	<hr>
	<h2> 1 ~ 10 까지의 정수 출력 </h2>
<%-- 	
	<%
		for(int i =1; i <= 10; i++)
			out.write( i + "<br>");
	%> 
--%>
	
	<c:forEach begin="1" end="10" var="i">
		${ i } <br>
	</c:forEach>
	
	년도선택 : 
	<select>
		<c:forEach begin="1940" end="2021" var="year" step="5">
			<option>${ year }</option>
		</c:forEach>	
	</select>
</body>
</html>
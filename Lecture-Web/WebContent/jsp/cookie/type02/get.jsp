<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//날아온 쿠키형태 : 배열-> 한사이트 최대 20개
	Cookie[] cookies = request.getCookies();
	
	StringBuilder sb = new StringBuilder();
	for(Cookie c : cookies ){
		String cName = c.getName();
		String cValue = c.getValue();
		
		// decoding
		cName  = URLDecoder.decode(cName, "utf-8");
		cValue = URLDecoder.decode(cValue, "utf-8");
		
		
		sb.append("쿠키이름 : " + cName + ", ");
		sb.append("쿠키값 : " + cValue + "<br>");
	
		pageContext.setAttribute("cookieData", sb.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 설정된 쿠키 정보 </h2>
	<%-- <%= sb.toString() %> --%>
	
	${ cookieData }
	<a href="makeForm.jsp">쿠키설정 이동</a>
</body>
</html>
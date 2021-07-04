<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String cName  = request.getParameter("cName");
	       cName  = URLEncoder.encode(cName, "utf-8"); 		//인코딩
	String cValue = request.getParameter("cValue");
		   cValue = URLEncoder.encode(cValue, "utf-8");
	String cAge   = request.getParameter("cAge");		//현재단위 : 분
	
	// 쿠키생성
	Cookie cookie = new Cookie(cName, cValue);
	
	//유효시간 설정
	if(cAge != null && cAge.length() != 0) {
		cookie.setMaxAge(Integer.parseInt(cAge) * 60);
	}
	
	//쿠키전송
	response.addCookie(cookie);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키설정 완료</h2>
	<a href="get.jsp"> 설정된 쿠키 조회 </a>  <%-- get.jsp 요청한 순간 cookie들 다 날라감 --%>
</body>
</html>
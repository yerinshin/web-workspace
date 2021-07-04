<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> board = new HashMap<String, String>();
	board.put("no", "1");
	board.put("title", "test");
	
	pageContext.setAttribute("boardVO", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= board.get("no") %><br>
	title : <%= board.get("title") %><br>
	
	el no : ${ boardVO.no }<br>
	el title : ${boardVO.title}<br>
	el title : ${ boardVO['title'] }<br> <!-- 맵객체에서 잘쓰진 않음 -->
	
	el aaa : ${boardVO.aaa } 	<!-- empty출력 -->
	
	<%--
		${ param.id } 혹은 ${ param.name } 들.. : param은 map객체
	 --%>
</body>
</html>
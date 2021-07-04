<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
pageContext.setAttribute("msg","pageContext영역에 등록");

/* 	BoardVO board = new BoardVO();
	board.setNo(1);
	board.setTitle("메롱"); */
	
/* 	Map<String, String> board = new HashMap<String, String>();
	board.put("no","1");
	board.put("title", "메롱"); */
	
/* 	String[] names = {"홍","김","이","박"}; */
	
	List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("강길동");
	names.add("고길동"); 

	pageContext.setAttribute("names", names);
	
/* 	pageContext.setAttribute("boardVO", board); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	msg : ${ pageScope.msg }<br>
	
	el no : ${ boardVO.no }<br>
	el title : ${ boardVO.title } <br>
	
	el aaa : ${ boardVO.aaa }<br>
	
	이름1 : ${ names[0] }<br>
	이름2 : ${ names[1] }<br>
	이름3 : ${ names[2] }<br>
	이름4 : ${ names[3] }<br>
	이름5 : ${ names[4] }<br>
	
	
	
</body>
</html>
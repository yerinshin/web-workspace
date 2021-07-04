<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO board = new BoardVO();
	board.setNo(1);
	board.setTitle("test");
	
	//pageContext 영역등록 => 이름 : boardVO, 값 : 생성된 BoardVO 객체
	pageContext.setAttribute("boardVO", board);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= board.getNo() %><br>
	<!-- getAttribute의 반환형 : Object => 명시적 형변환 후 형변환된 객체에서 함수사용 -->
	no : <%= ((BoardVO)pageContext.getAttribute("boardVO")).getNo() %><br>
	title : <%= board.getTitle() %><br>
	title : <%= ((BoardVO)pageContext.getAttribute("boardVO")).getTitle() %><br>
	
	<!-- javabeans클래스 : 객체.이름  -> .은 getter메소드 의미 -->
	el no : ${ boardVO.no }<br>
	el title : ${ boardVO.title}<br>
	el title : ${ boardVO['title'] }<br> <!-- 자바빈즈 객체에서 잘쓰진 않음 -->
<%-- 
	el aaa : ${boardVO.aaa }<br>  : 오류발생 -> 자바빈즈 객체 뒤의 . 이 getter메소드를 의미하므로 getAaa() 실행 불가 : 500 error	
 --%>
</body>
</html>
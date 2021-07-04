<%@page import="kr.ac.kopo.login.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int boardNo = Integer.parseInt(request.getParameter("no"));	
	String title = request.getParameter("title");
	//String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setNo(boardNo);
	board.setTitle(title);
	//board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.update(board);
	
	// pageContext.setAttribute("board", board);
%>
<script>
	alert('[${param.no}]번 게시물이 수정되었습니다')
	location.href="detail.jsp?no=${ param.no }"
	// location.href="detail.jsp?no=" + ${ board.no }
</script>

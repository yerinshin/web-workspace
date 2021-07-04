<%@page import="kr.ac.kopo.login.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	dao.delete(boardNo);

%>
<script>
 alert("삭제되었습니다")
 location.href = "list.jsp"
</script>
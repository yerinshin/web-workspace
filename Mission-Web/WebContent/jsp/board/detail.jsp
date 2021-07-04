<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.login.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2
--%>
<%
	//1. 게시물 번호 추출
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String type = request.getParameter("type");
	
	BoardDAO dao = new BoardDAO(); 
	//2-1 list에서 넘어온 detail.jsp일때만 t_board 해당 게시물 조회수 증가
	if(type != null && type.equals("list")){
		dao.addViewCnt(boardNo);		
	}
	//2-2. 데이터베이스 t_board테이블에서 해당 게시물 조회
	BoardVO board = dao.selectOne(boardNo);

	//2-3. t_board_file 테이블에서 해당 게시물의 첨부파일 조회
	List<BoardFileVO> fileList = dao.selectFileByNo(boardNo);
	
	pageContext.setAttribute("board", board);
	//session.setAttribute("board", board); 로 써야 updateForm.jsp에서 보임 근데 이렇게 쓰지 말기!
	pageContext.setAttribute("fileList", fileList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#goListBtn').click(function(){
			location.href = "list.jsp"
		})
		
		$('#updateBtn').click(function(){
			location.href = "updateForm.jsp?no=${param.no}"
		})
		
		$('#deleteBtn').click(function(){
			if(confirm('[${param.no}]번 게시글을 삭제할까요?'))
			location.href = "delete.jsp?no=${param.no}"
		})
	})
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<br>
		<table border="1" width="80%">
		<tr>
			<th width="25%">번호</th>
			<td><c:out value="${ board.no }" /></td>
		</tr>
		<tr>
			<th width="25%">제목</th>
			<td><c:out value="${ board.title }" /></td>
		</tr>
		<tr>
			<th width="25%">작성자</th>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<th width="25%">내용</th>
			<td>${ board.content }</td>
		</tr>
		<tr>
			<th width="25%">조회수</th>
			<td>${ board.viewCnt }</td>
		</tr>
		<tr>
			<th width="25%">등록일</th>
			<td>${ board.regDate }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${ fileList }" var="file">
					<%-- href : eclipse-work밑의 경로(서버경로), web-workspace아님 --%>
					<a href="/Mission-Web/upload/${ file.fileSaveName }">
						<c:out value="${ file.fileOriName }" />
					</a>
					(${ file.fileSize } bytes)
					<br>
				</c:forEach>
			</td>
		</tr>
		</table>
		<button id="updateBtn">수정</button>
		<button id="deleteBtn">삭제</button>
		<button id="goListBtn">목록</button>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>	
	</footer>
</body>

























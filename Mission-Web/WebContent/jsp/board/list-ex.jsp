<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("  from t_board ");
	sql.append("  order by no desc ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
	List<BoardVO> list = new ArrayList<>();
	
	while(rs.next()) {
		int no 			= rs.getInt("no");
		String title 	= rs.getString("title");
		String writer 	= rs.getString("writer");
		String regDate 	= rs. getString("reg_date");
		
		BoardVO board = new BoardVO();
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setRegDate(regDate);
		
		list.add(board);
	}
	
	JDBCClose.close(conn,pstmt);
	
	pageContext.setAttribute("list", list);
	
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
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href= "writeForm.jsp"
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
			<h2>게시판 목록</h2>
			<hr>
			<br>
			<table id="list"> 
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>				
					<th width="20%">등록일</th>				
				</tr>
				
		<%-- 		${ list[0].no } 에서 list[0] 자체를 변수화 하기 위해 forEach의 items사용 --%>
				<c:forEach items="${ list }" var="board" varStatus="loop">	<%-- var= list[0], list[1], ... --%>
					
		<%-- loop의 인덱스가 홀수인 tr에만 "odd"라는 클래스 부여 -> .css에서 제어 => server먼저 해석하기 때문에 이렇게 사용가능 --%>
		<%-- 해석 순서 : JSP -> css, html, javascript --%>
		<%-- jquery의 add클래스로 부여할 수도 있음 --%>
					<tr <c:if test="${ loop.index mod 2 ne 0 }"> class="odd" </c:if>>
						<td>${ board.no }</td>
						<td>
						<a href="detail.jsp?no=${board.no}">
								<%-- escapeXml defalut가 true이기 때문에 악성링크..?판단가능
											화면 구성할 때 el 대신	out태그로 써주는게 더 좋은 코드! --%>
								<c:out value="${ board.title }" /> 
							</a>
						</td>
						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button id="addBtn">새글등록</button>
			</c:if>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>	
	</footer>
</body>
</html>


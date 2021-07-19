<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String memberID = request.getParameter("id");

	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select * from t_member ");
	sql.append(" where id = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, memberID);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#goBackMemListBtn').click(function() {
			location.href = "memberList.jsp"
		})
	})
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
			<hr width="80%">
				<h2>회원 정보</h2>
			<hr width="80%">
			<br>
				<table border="1" width="80%">
					<tr>
						<th width="25%">아이디</th>
						<td><%= rs.getString("id") %></td>
					</tr>
					<tr>
						<th width="25%">이름</th>
						<td><%= rs.getString("name") %></td>
					</tr>
					<tr>
						<th width="25%">비밀번호</th>
						<td><%= rs.getString("password") %></td>
					</tr>
					<tr>
						<th width="25%">이메일</th>
						<td>
							<%= rs.getString("email_id") %>
							@
							<%= rs.getString("email_domain") %>
						</td>
					</tr>
					<tr>
						<th width="25%">전화번호</th>
						<td>
						<%= rs.getString("tel1") %>
						- <%= rs.getString("tel2") %>
						- <%= rs.getString("tel3") %>
						</td>
					</tr>
					<tr>
						<th width="25%">우편번호</th>
						<td><%= rs.getString("post") %></td>
					</tr>
					<tr>
						<th width="25%">주소</th>
						<td>
							<%= rs.getString("basic_addr") %><br>
							 <%= rs.getString("detail_addr") %> 
						</td>
					</tr>
					<tr>
						<th width="25%">가입날짜</th>
						<td><%= rs.getString("reg_date") %></td>
					</tr>
					
				</table>	
				<br>
				<button id="goBackMemListBtn"> 회원 목록으로 돌아가기 </button>
		</div>
	</section>
	<footer>
		<%@include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	
	sql.append("select id, name, email_id, email_domain, to_char(reg_date, 'yyyy-mm-dd') as reg_date from t_member "); 
	sql.append(" order by reg_date desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	td {
 		text-align : center;
 	}
</style>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addMemberBtn').click(function() {
			location.href= "signUpForm.jsp"
		})
	})
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
			<h2>회원리스트</h2>
		<hr width="80%">
		<br>
			<table border="1" width="80%" text-align="center">
			<tr>
				<th width="20%">가입날짜</th>
				<th width="15%">아이디</th>
				<th width="15%">이름</th>
				<th >이메일</th>
			</tr>
			<tr>
			<%
				while(rs.next()){
					String id = rs.getString("id");
			%>
				<td><%= rs.getString("reg_date")%></td>
				<td>
				<a href="memberDetail.jsp?id=<%= id %>">
				<%= id %>
				</a>
				</td>
				<td><%= rs.getString("name")%></td>
				<td><%= rs.getString("email_id")%>
				@<%= rs.getString("email_domain") %>
				</td>
			</tr>
			<%
				}	
			%>
			</table>
			<br>
			<button id="addMemberBtn"> 회원등록 </button>	
		</div>
</body>
</html>
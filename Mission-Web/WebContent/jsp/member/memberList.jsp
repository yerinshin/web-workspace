<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAll();
	
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
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
	
	function doAction(id){
		<c:choose>
			<c:when test="${ userVO.id eq 'admin' }">
				alert('관리자님.')
				location.href = 'memberDetail.jsp?id='+id;
			</c:when>
			<c:otherwise>
			 	alert('접근권한이 없습니다.')
			 	location.href="/Mission-Web/jsp/member/memberList.jsp"
			</c:otherwise>
		</c:choose>
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
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
				<c:forEach items="${list}" var="member">
				
				<tr>
					<td>${ member.regDate }</td>
					<td>
						<a href="javascript:doAction(${ member.id })">
					 		<c:out value="${ member.id }" />
						</a>
					</td>
					<td>${ member.name}</td>
					<td>${ member.email }</td>
				</tr>
				</c:forEach>
			<%-- 	<%
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
					</td> --%>
				
				<%-- <%
					}	
				%> --%>
				</table>
				<br>
				<button id="addMemberBtn"> 회원등록 </button>	
			</div>
		</section>
		<footer>
			<%@include file="/jsp/include/bottom.jsp" %>
		</footer>
</body>
</html>
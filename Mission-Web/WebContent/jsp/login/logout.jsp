<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
	location.href="/Mission-Web"; 		//welcome-file-list에 index.jsp 있기 때문에 /Mission-Web까지만 써도됨
</script>

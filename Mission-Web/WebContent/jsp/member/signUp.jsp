<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//아이디, 이름, 비밀번호, 이메일 , 전화번호, 우편번호, 주소, 상세주소
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password= null;
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	
	if(password1.equals(password2)){
		password = password1;
	}
	
	String emailId = request.getParameter("emailId");
	String emailDomain = request.getParameter("emailDomain");
	String tel1 =  request.getParameter("tel1");
	String tel2 =  request.getParameter("tel2");
	String tel3 =  request.getParameter("tel3");
	String post = request.getParameter("post");
	String basicAddr = request.getParameter("basicAddr");
	String detailAddr = request.getParameter("detailAddr");
	
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	
	sql.append("insert into t_member(id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr) ");
	sql.append(" values(?,?,?,?,?,?,?,?,?,?,?)");
	
	if(password == null) {
%>
	<script>
	alert("비밀번호가 일치하지 않습니다.")
	location.href = "signUpForm.jsp"
	</script>
<%	
	}else{
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, password);
	pstmt.setString(4, emailId);
	pstmt.setString(5, emailDomain);
	pstmt.setString(6, tel1);
	pstmt.setString(7, tel2);
	pstmt.setString(8, tel3);
	pstmt.setString(9, post);
	pstmt.setString(10, basicAddr);
	pstmt.setString(11, detailAddr);
	
	pstmt.executeUpdate();
	JDBCClose.close(conn,pstmt);
	}
%>
<script>
	alert("회원가입이 완료되었습니다.")
	location.href = "memberList.jsp"
</script>
    
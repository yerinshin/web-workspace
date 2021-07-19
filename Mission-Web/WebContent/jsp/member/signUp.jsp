<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
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
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String emailId = request.getParameter("emailId");
	String emailDomain = request.getParameter("emailDomain");
	String tel1 =  request.getParameter("tel1");
	String tel2 =  request.getParameter("tel2");
	String tel3 =  request.getParameter("tel3");
	String post = request.getParameter("post");
	String basicAddr = request.getParameter("basicAddr");
	String detailAddr = request.getParameter("detailAddr");
	
	String password= null;
	if(password1.equals(password2)){
		password = password1;
	}
	String email = emailId+"@"+emailDomain;
	String tel = tel1+"-"+tel2+"-"+tel3;
	
	
	MemberVO member = new MemberVO(id, password, name, email, tel, post, basicAddr, detailAddr, null);
	
	System.out.print(member);
	
	
	if(password == null) {
	
%>
	<script>
	alert("비밀번호가 일치하지 않습니다.")
	location.href = "signUpForm.jsp"
	</script>
	
<%	
 	}else{
	
		MemberDAO dao = new MemberDAO();
		dao.insert(member); 
		
	} 
%>
<script>
	alert("회원가입이 완료되었습니다.")
	location.href = "memberList.jsp"
</script>
    
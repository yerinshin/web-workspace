<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. login.jsp에서 날라오는 파라미터 추출(id, password)
	2. 추출된 ID, PASSWORD에 맞는 회원의 존재여부 판단(DB, t_member)
	3. 로그인 성공 시, 세션에 회원정보를 등록
	4. 존재여부에 따른 페이지 이동(로그인 성공 : index.jsp, 로그인 실패 : login.jsp)
 --%>

 <%
 	request.setCharacterEncoding("utf-8");
 
 	String id = request.getParameter("id");
 	String password = request.getParameter("password");
 	
 	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	
	sql.append("select id, password, name, email_id||'@'||email_domain as email, tel1||tel2||tel3 as tel, post, basic_addr||detail_addr as addr");
	sql.append("  from t_member ");
	sql.append(" where id = ? and password= ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	
	ResultSet rs = pstmt.executeQuery();
	
	String loginedId = null;
	String loginedPwd = null;
	MemberVO member = null;
	
	if(rs.next()){
		loginedId = rs.getString("id");
		loginedPwd = rs.getString("password");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String tel = rs.getString("tel");
		String post = rs.getString("post");
		String addr = rs.getString("addr");
		
		member = new MemberVO();
		member.setId(loginedId);
		member.setPassword(loginedPwd);
		member.setName(name);
		member.setEmail(email);
		member.setTel(tel);
		member.setPost(post);
		member.setAddress(addr);
		
	}
	JDBCClose.close(conn, pstmt);
	
	
	
	
	//세션등록
	session.setAttribute("member", member);	
	
	if( member != null) {
		response.sendRedirect("/Mission-Web/index.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}
	
	
 %>
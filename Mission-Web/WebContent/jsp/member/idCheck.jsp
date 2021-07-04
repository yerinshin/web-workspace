<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String signUpId = request.getParameter("id");

	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	
	sql.append("select id from t_member");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	ArrayList<String> idList = new ArrayList<>();
	
	while(rs.next()){
		String id = rs.getString("id");
		idList.add(id);
	}
	
	for(String str : idList){
		if(str == signUpId){
%>
		<script>
		 	alert("아이디가 존재합니다.")
		</script>
<%		
		 break;
		}
	}	
%>
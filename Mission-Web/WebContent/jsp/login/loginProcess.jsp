<%@page import="kr.ac.kopo.login.dao.LoginDAO"%>
<%@page import="kr.ac.kopo.login.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 파라미터 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 객체생성 및 초기화
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	// DB에서 로그인 수행
	LoginDAO dao = new LoginDAO();
	LoginVO userVO = dao.login(loginVO);
	
	/*
		userVO null 이면 로그인 실패
		userVO null 아니면 로그인 성공
	*/
	String msg = null;
	String url = null;
	if(userVO == null) {
		msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
		url = "/Mission-Web/jsp/login/login.jsp";
		//url = "/jsp/login/login.jsp";			//forward의 url
	} else {
		msg = userVO.getName() + "님 환영합니다";
		url="/Mission-Web/index.jsp";
		//url="/index.jsp";						//forward의 url
		
		//세션 등록
		session.setAttribute("userVO", userVO);
	}
	
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>
<script>
	alert('${ msg }');			<%-- 작은 따옴표 필수 ! --%>
	location.href= '${ url }';
</script>

<%-- 
 포워드는 url바뀌지 않아서 페이지 이동에서 사용할 수 없다. --> 쓰려면 sendRedirect
<jsp:forward page=" ${ url }">
	<jsp:param name="msg" value="${ msg }"/>
</jsp:forward> 
--%>

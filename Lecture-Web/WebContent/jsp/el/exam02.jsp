<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		http://localhost:9998/Lecture-Web/jsp/el/exam02.jsp?id=aaa&name=bbb 요청했을 때의 id, name값을 추출
	 --%>
	<%
		String id = request.getParameter("id");
		String[] hobbies = request.getParameterValues("hobby");
		
		if(hobbies == null) {
			hobbies = new String[]{"파라미터 없음"};
		}
	%>
	
	id : <%= id %><br>
	id : <%= request.getParameter("id") %><br>
	el id : ${ param.id }<br> 					
	
	<!-- 값이 존재하지 않으면 request.getParameter는 null을 리턴, el은 empty로 리턴(아무것도 리턴하지 않음) -->
	name : <%= request.getParameter("name") %><br> 
	el name : ${ param.name }<br> 
	
	<%--
		http://localhost:9998/Lecture-Web/jsp/el/exam02.jsp?id=aaa&name=bbb&hobby=music&hobby=movie
	 --%>
	 
	 hobby : <%= hobbies[0] %><br>
	 el hobby : ${ paramValues.hobby[0]}<br>
</body>
</html>
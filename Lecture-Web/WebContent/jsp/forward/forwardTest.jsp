<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<form action="includeSet.jsp"> -->				<%-- <h2>결과화면</h2> 뜸 --%>
	
	<form action="forwardSet.jsp">						<%-- <h2>결과화면</h2> 안뜸 : 외부에서는 admin.jsp 가 있는지도 모르게 됨 --%>
		id : <input type="text" name="id">
		<input type="submit" value="전송" >
	</form>
</body>
</html>
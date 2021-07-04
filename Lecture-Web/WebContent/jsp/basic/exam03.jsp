<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!     //servlet클래스의 멤버번수와 method로 정의됨 (그러므로 접근제한자 필요...)
		private int sum = 0;
	%>
	sum : <%= sum %> <br>
	
	<%!
		public int getSum(int val1, int val2) {
		int sum = 0;
		for(int i = val1; i <=val2; i ++){
			sum += i;
		}
		return sum;
	}
	%> 
	1~10까지의 총합 <%= getSum(1,10) %>
	

</body>
</html>
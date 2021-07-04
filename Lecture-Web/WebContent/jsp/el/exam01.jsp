<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	<!-- el코드 : 서버단에서 해석하기 때문에 client는 무슨 코드 썼는지 알 수 없음 (페이지 검사에서도 안나옴) -->
	5 + 5 : <%= 5 + 5 %><br>
	5 + 5 : ${ 5 + 5 }<br>
	9 % 5 : ${ 9 % 5 }<br>
	9 mod 5 : ${ 9 mod 5 }<br>
	9 > 5 : ${ 9 > 5 }<br>
	9 gt 5 : ${ 9 gt 5 }<br>
	9 == 5 : ${ 9 == 5 }<br>	
	9 eq 5 : ${ 9 eq 5 }<br>
	9 != 5 : ${ 9 != 5 }<br>	
<%-- 	9 ne 5 : ${ 9 ne 5 }<br> --%>
	
	(5 == 5) && (9 > 6) : ${(5 == 5) && ( 9 > 6 ) }<br>	
	(5 ep 5) and (9 gt 6) : ${(5 eq 5) and (9 gt 6)}<br>
	
	empty str : ${ empty str }<br>	 			<!-- 객체 만든적 없어서 true -->
	not empty str : ${ not empty str }<br>   	<!-- str이라는 변수 존재하니? : false -->
	
	5의 짝/홀수 판단 : ${ 5 % 2 == 0 ? "짝수 " : "홀수"}<br>
	5의 짝/홀수 판단 : ${ 5 mod 2 eq 0 ? "짝수 " : "홀수"}<br>
	
	

</body>
</html>
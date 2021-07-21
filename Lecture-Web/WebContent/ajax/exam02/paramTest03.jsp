<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$(':button').click(function() {
			//입력받은 값 저장
			let name = $('#name').val()		
			let age = $('#age').val()
		
			$.ajax({
				url : 'param3.jsp',
//				data : 'name=hong&age=23', 			//문자열 형태의 요청 파라미터
//				data : {name: 'hong', age: 23}, 	//객체 형태의 요청 파라미터도 가능
				data : { name:name, age:age},		//입력받은 값으로 전송
				success : function(result) {		//readystate:4 , status : 200일때
//					alert('성공')
					$('#debug').val(result)
				}, error : function() {		//readystate : 4, status : 200아닐때
					alert('실패')
				}
			})
		})
	})
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	이름 : <input type="text" id="name">
	나이 : <input type="text" id="age">
	<input type="button" value="호출">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#msgView {
		border : 1px solid red;
		height : 200px;
		width : 500px;
	}
</style>
<script>
	let httpRequest = null

	function requestMsg() {
		//1단계 : XMLHttpRequest 객체 생성
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(window.ActiveXObject)
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
		else
			httpRequest = null
//		alert(httpRequest)		
		
		//2단계 : callback 함수 설정
		httpRequest.onreadystatechange = responseMsg	
			
		//3단계 : 서버에 비동기 요청
		httpRequest.open('GET', '/Lecture-Web/ajax/hello', true)
		httpRequest.send(null)
		
		
	}
	
	function responseMsg() {
		if(httpRequest.readyState == 4 ){		
			if(httpRequest.status == 200) {	
			//alert(httpRequest.responseText)	
			let msgView = document.getElementById("msgView");
			msgView.innerHTML = httpRequest.responseText
			}
		}
	}
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에서 자료요청" onclick="requestMsg()">
</body>
</html>
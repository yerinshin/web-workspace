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
		httpRequest.open('GET', 'hello.jsp', true)
		httpRequest.send(null)
		
		
	}
	
	function responseMsg() {
//		alert(httpRequest.readyState)
		if(httpRequest.readyState == 4 ){		//readyState 4 : 서버에서 응답이 완료된 상태
			if(httpRequest.status == 200){		//status 200 : 응답결과가 올바른 경우 (404, 500 등 : 오류)
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
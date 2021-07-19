<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let httpRequest = null
	
	function getXMLHttpRequest() {
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(window.ActiveXObject)
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP")

		return httpRequest
	}
	
	function sendProcess(param) {
		httpRequest = getXMLHttpRequest()
		
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "====================================================================\n"
		param = encodeURIComponent(param)
		msg += "/Lecture_Web/exam02/param.jsp?name=" + param + "\n"
		debugTrace(msg)
		
		let url = "param.jsp?name=" + param
		httpRequest.open('GET', url, true)
		httpRequest.send(null)
	}
	
	function callbackFunction() {
		let msg = ''
		
		switch(httpRequest.readyState) {
		case 1 :
			msg += 'Loding...\n'
			break
		case 2 :
			msg += 'Loaded...\n'
			break
		case 3 :
			msg += 'Interactive...\n'
			break
	/* 	case 4 : 
			msg += 'Complete...\n'
			break */
		case 4 :
			msg += 'Complete...\n'
			if(httpRequest.status == 200) {
				msg += '웹서버에서 정상적으로 수행..\n'
				msg += '실행결과 : ' + httpRequest.responseText + '\n'
			} else {
				msg += '웹서버에서 오류발생...\n'
				msg += '오류코드 : ' + httpRequest.status + '\n'
			}
			msg += "====================================================================\n"
			break
		}
		debugTrace(msg)
	}
	
	function debugTrace(msg) {
		let debug = document.getElementById("debug")
		debug.value += msg
	}
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button onclick="sendProcess('hong gil-dong')">영문인자호출</button>
	<button onclick="sendProcess('홍길동')">한글인자호출</button>
</body>
</html>
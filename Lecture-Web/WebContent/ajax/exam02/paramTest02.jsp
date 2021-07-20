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
	
	function sendProcess(method, param) {
		httpRequest = getXMLHttpRequest()
		
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "====================================================================\n"
		msg += method + "/Lecture_Web/exam02/param2.jsp?name=" + param + "\n"
		debugTrace(msg)
		
		let url = 'param2.jsp'
		param = encodeURIComponent(param)
		let args = 'name=' + param
		
		if(method == 'GET') {
			httpRequest.open(method, url + '?' + args, true)
			httpRequest.send(null)
		} else if(method == 'POST') {
			httpRequest.open(method, url, true)
			
			//form 방식으로 Content-type 설정 : body가 아닌 formData영역으로 날라감
			httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
			httpRequest.send(args)
		}
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
	<%-- form을 써야만 post방식의 parameter가 날라감 --%>
	<form method="get" action="" enctype="application/x-www-form-urlencoded">
	</form>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button onclick="sendProcess('GET','hong gil-dong')">GET방식영문인자호출</button>
	<button onclick="sendProcess('GET','홍길동')">GET방식한글인자호출</button>
	<button onclick="sendProcess('POST','hong gil-dong')">POST방식영문인자호출</button>
	<button onclick="sendProcess('POST','홍길동')">POST방식한글인자호출</button>
</body>
</html>











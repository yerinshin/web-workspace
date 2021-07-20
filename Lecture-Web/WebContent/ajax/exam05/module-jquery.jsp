<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	function clickBtn() {		// 비동기 통신을 하는것이 목적인 함수
		
		sendProcess('GET', 'sample.xml', null, callback)
	}
	
	function callback() {
		
		let msg = ''

		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200){
				
				/*
					개발자도구에서 확인해 볼 것
					httpRequest.responseXML.getElementsByTagName('member')[0].getElementsByTagName("id")
				*/
				
				
				let xmlDoc = httpRequest.responseXML
				let memberList = xmlDoc.getElementsByTagName("member")

				msg += '회원수 : ' + memberList.length + '명\n'
				
				memberList.each(function() {
					console.log(this)
					let id = $(this).find('id').text()
					let name = $(this).find('name').text()
					msg += id + "(" + name + ")\n"
				})
				
				debugTrace(msg)
			}
			
		}
	}
		
		function debugTrace(msg) {
			let debug = document.getElementById("debug")
			debug.value += msg
		}
	
</script>
</head>
<body>
	<h2>JSON Data 예제</h2>

	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<button type="button" onclick="clickBtn()">서버에 자료요청</button>

</body>
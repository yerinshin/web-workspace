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
		
		sendProcess('GET', 'sample.jsp', null, callback)
	}
	
	function callback() {
		
		let msg = ''

		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200){
				
				let data = httpRequest.responseText
				let memberList = eval(data)
				
		//		console.log(memberList)
				msg += '회원수 : ' + memberList.length + '명\n'	
				for(let i = 0; i <memberList.length; i++) {
					let mem = memberList[i]
					let id = mem.id
					let name = mem.name
					msg += id + '(' + name + ')\n'
				}
			
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
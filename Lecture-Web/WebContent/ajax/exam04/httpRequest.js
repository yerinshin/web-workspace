/**
 * Ajax 통신과 관련된 집합 
 */

//비동기 통신을 위한 httpRequest객체 생성
let httpRequest = null

function getXMLHttpRequest() {
	if(window.XMLHttpRequest)
		httpRequest = new XMLHttpRequest()
	else if(window.ActiveXObject)
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP")

	return httpRequest
}

function sendProcess(method, url, params, callback) {	
	//사용자가 정의해야 하는 4가지
	//메소드, url, parameter, callback함수( : 서버가 올바르게 응답하고 응답 성공했다면 화면의 일부분을 수정하는 역할)
	
	httpRequest = getXMLHttpRequest()
	httpRequest.onreadystatechange = callback
	
	let httpMethod = method
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET'
	
	let httpParams = ''
	if(params != null && params != null ) {
		if(typeof(params) == 'string') {
						
			//name=홍길동&age=24
			paramArr = params.split('&')
			for(let param of paramArr) {
				pdata = param.split('=')
				if(httpParams != '')
					httpParams += '&'
				httpParams += pdata[0] + '=' +encodeURIComponent(pdata[1])
			}
			
		} else {
			
			//{ name:'홍길동', age:24} ==> name=홍길동&age=24
			for(let key in params){
				console.log(key, params[key])
				if(httpParams != '')
					httpParams += '&'
				httpParams += key + '=' + encodeURIComponent(params[key])
			}
			
		}

	}
	
	let httpUrl = url
	if(httpMethod == 'GET' && httpParams != '')
		httpUrl = url + '?' + httpParams
		
	httpRequest.open(httpMethod, httpUrl, true)
	if(httpMethod == 'GET')
		httpRequest.send(null)
	else if(httpMethod == 'POST') {
		httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
		httpRequest.send(httpParams)
		
	}

}










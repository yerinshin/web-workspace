<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//992a4f6229c471e14baf1883c1918b4a
		window.Kakao.init("992a4f6229c471e14baf1883c1918b4a");
		
		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope:'profile_nickname, account_email, gender',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success : function(response) {
							let kakao_account = response.kakao_account;
							console.log(kakao_account);
						}
					});
				}, fail: function(error) {
					alert(error)
					alert('카카오톡 로그인 실패')
				}
			});
		}
		
		function kakaoLogout(){
			if (!Kakao.Auth.getAccessToken()) {
				  alert('Not logged in.');
				  return;
				}
				Kakao.Auth.logout(function() {
				  console.log(Kakao.Auth.getAccessToken());
				});
			
		}
	</script>
</head>
<body>
	<a href="javascript:kakaoLogin()"><img src="https://odaeri.kr/images/buttons/btn_kakao-v2.3.png" width="450px" height="100px"></a>
	<a href="javascript:kakaoLogout()">카카오로그아웃</a>
</body>
</html>
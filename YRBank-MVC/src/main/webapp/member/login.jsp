<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
   		<style>
   			form div {
   				margin : 0px auto;
   			}
   			
   			.login-btn {
   				margin : 0px auto;
   			}
   		</style>
   
   
     	<jsp:include page="/include/head.jsp"></jsp:include>
     
    <!-- 카카오톡로그인 --> 
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//992a4f6229c471e14baf1883c1918b4a
		
		window.Kakao.init("992a4f6229c471e14baf1883c1918b4a");
		
		function kakaoLogin() {
			let kakao_account
			let account_email
			
			window.Kakao.Auth.login({
				scope:'profile_nickname, account_email, gender',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success : function(response) {
							kakao_account = response.kakao_account;
							console.log(kakao_account);
						
							 account_email = kakao_account.email
							console.log(account_email)
							location.href = "<%= request.getContextPath()%>/member/kakaoLoginProcess.do?email="+account_email
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
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="<%= request.getContextPath() %>/resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader --> 
      <!-- header -->
      <header>
 			<jsp:include page="/include/header.jsp"></jsp:include>      
      </header>
      <!-- end header -->
      
      <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>로그인</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- contact -->
    <div class="contact">
        <div class="container">
          
                <div class="col-md-12">

                    <form class="main_form" action="<%= request.getContextPath()%>/member/loginProcess.do" method="post">
						<div class=" col-md-8">
							<input class="form-control" placeholder="아이디" type="text" name="id">
            			</div>
            			<div class=" col-md-8">
            				<input class="form-control" placeholder="비밀번호" type="password" name="password">
                        </div>
                        <div class=" col-md-8">
                         <div class="row login-btn">
                             <a href="javascript:kakaoLogin()"><img src="<%=request.getContextPath() %>/resources/images/kakao-btn.JPG" width="350px"></a>
                             <button type="submit" class="send">로그인</button>
                        </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    
    <!-- end contact -->
    	  <%-- footer --%>
      <footer>
         <jsp:include page="/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/include/javascriptFiles.jsp"></jsp:include>
   </body>
</html>
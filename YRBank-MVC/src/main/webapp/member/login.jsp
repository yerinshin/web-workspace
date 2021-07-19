<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
   		<style>
   			form div {
   				margin : 0px auto;
   			}
   		</style>
   
   
     	<jsp:include page="/include/head.jsp"></jsp:include>
     	
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
                        <div class=" col-md-12">
                             <button type="submit" class="send">로그인</button>
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
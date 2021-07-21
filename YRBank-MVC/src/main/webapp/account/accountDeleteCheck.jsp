<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
 <style>
     table {
     	font-size : 17px;
     }
     
     th {
     	left-padding:30px;
     	width : 30%;
     }
     
     input.form-control {
     	margin-top : 20px;
     }
     
     .dash {
     	font-weight : bold;
     	margin-top : 30px;
     }
     
     .send {
     margin-top : 20px;
     }
</style>
     	
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
      
      
      <section>
      
        <div class="brand_color">
         <div class="container">
            <div class="row">
                <div class="col-md-12">
                   
                </div>
            </div>
         </div>
    	</div>
    	
    	 <div class="contact">
        <div class="container">
          	<div class="title">
					! 삭제를 위한 계좌 비밀번호과 주민등록번호를 입력하세요
          	</div>
                <div class="col-md-12">
                    <form class="main_form" action="<%= request.getContextPath()%>/account/accountDelete.do?accountNo=${param.accountNo}" method="post">
                           <table>
                           		
                           		<tr>
                           			<th>계좌 비밀번호</th>
                           			<td>  <input class="form-control" placeholder="계좌 비밀번호" type="password" name="accountPwd"></td>
                           		</tr>	
                 
                           		<tr>
                           			<th>주민등록번호</th>
                           			<td>
                           			<div class="row">
	                           			<div class="col-md-5">
	                           			<input class="form-control" placeholder="주민등록번호 앞 6자리 " type="text" name="ss1">
	                           			</div> 
	                           			<div class="dash col-md-1">
	                           			   -
	                           			</div>
	                           			<div class="col-md-6">
	                           			<input class="form-control" placeholder="뒤 7자리" type="password" name="ss2">
	                           			</div>
                           			</div>
                           			</td>
                           		</tr>
                           	
                           </table>
                          
                            <div class=" col-md-12">
                                <button id="delete-acc-btn" type="submit" class="send">계좌삭제</button>
                            </div>
                        
                    </form>
                </div>
            </div>
        </div>
      
      
      </section> 

      <%-- footer --%>
      <footer>
         <jsp:include page="/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/include/javascriptFiles.jsp"></jsp:include>
</body>
</html>
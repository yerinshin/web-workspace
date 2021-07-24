<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
	div.nice-select{
		display : none;
	}
	
	#select {
		height : 67px;
		font-size : 23px;
	}
	
	table {
		width : 900px;
     	font-size : 25px;
     }
     		
     th {
     	text-align :center;
        padding-right : 25px;
     	padding-left:30px;
     	width : 40%;
     }
     td {
     	padding-left : 15px;
     	}
     		
     input.form-control {
     	font-size :23px;
     	margin-top : 20px;
     }
     

     #send-btn {
     	font-size : 20px;
     	max-width : 400px;
     	height : 63px; 
     	margin-top : 50px;
     }
     
     div.brand_color {
     
     margin-bottom : 150px;
     }
     
     section {
     	margin-bottom : 150px;
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
                    <div class="titlepage">
                        <h2>계좌이체</h2>
                    </div>
                </div>
            </div>
         </div>
    	</div>
    	
    	
    	
    	
    	<!-- contact -->
    <div class="contact">
        <div class="container">

                <div class="col-md-12">
                
<div class="choose_bg">
         <div class="container">
            <div class="white_bg">
           
                    <form class="main_form" action="<%= request.getContextPath()%>/account/accountTransferCheck.do" method="post">
			 		<input type="hidden" name="myAccNo" value="${ myAccNo }">
			 		<input type="hidden" name="myName" value="${ loginMember.name }">

                           <table>
                           		<tr>
                           			<th>
                           				<select id="select" name="bankCode" class="form-select mb-3 form-control" aria-label="Default select example">
										  <option selected>은행선택</option>
										  <option value="016">YR뱅크</option>
										  <option value="111">JH뱅크</option>
										  <option value="094">SJ뱅크</option>
										  <option value="032">SW뱅크</option>
										</select>
                           			</th>
                           			<td>
                           			 		<input class="form-control" placeholder="입금할 계좌번호 입력" type="text" name="accountNo">
                           			</td>                          			
                           		</tr>
                           		<tr>
                           				
                           			<th>보낼 금액</th>
                           			<td>  <input class="form-control" placeholder="보낼 금액" type="text" name="transMoney"></td>
                           		</tr>	
                           		
                           </table>
                          
                        
                                <button type="submit" class="send" id="send-btn"><strong>다음</strong></button>
                           
                        
                    </form>
        		 </div>
     		  </div>
      		</div>
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
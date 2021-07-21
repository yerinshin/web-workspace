<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
<style>
	
	section {
		margin-bottom : 150px;
	}
	
/* 	.read-more {
		margin : 30px 30px 0px 30px auto;
	}
	 */
	#acc-trans-btn {
		margin :  30px 15px 0px 80px;
	}
	#acc-delete-btn{
		margin :  30px 50px 0px 15px;
	}
	
/* 	.account-box {
		margin : 20px;
	}
 */
	#nickname {

		/* text-align : left; */
		font-size : 28px;
		font-weight : bold;
		/* color : #ffc221; */
		margin-left:10px;
	}	
	#accountNo {
	/* 	text-align : left; */
		font-size : 23px;
	}
	
	#balance {
		font-size : 32px;
	}
	.product .title {
		padding-bottom : 0px;
	}
	
	.product .title h2:after {
		width : 1140px;
	}
	
	.product .title h2 {
		font-size : 40px;
		margin-bottom : 12px;
	}
	
	table {
		font-size : 20px;
	}
	
	#trans-info-col {
		width : 40%;
	}
	
	#trans-money-col {
		padding-left : 50px;
	}
	

</style>
<script>
	$(document).ready(function(){
<%-- 
		$('#goListBtn').click(function(){
			location.href = "<%= request.getContextPath() %>/board/boardList.do"
		})
		
		$('#updateBtn').click(function(){
			boardNo = ${ board.no }
			location.href = "<%= request.getContextPath() %>/board/boardUpdate.do?no="+boardNo
		//  location.href = "updateForm.jsp?no=${ param.no }"
		})
	 --%>
	 
		$('#acc-delete-btn').click(function(){
			accountNo = ${ account.accountNo }
			location.href = "<%= request.getContextPath() %>/account/accountDeleteCheck.do?accountNo=${ account.accountNo }"
		})
	})
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
      
      
      <section>
      
        <div class="brand_color">
         <div class="container">
            <div class="row">
                <div class="col-md-12">
                   
                </div>
            </div>
         </div>
    	</div>
      
      	<!-- service --> 
      <div class="service">
         <div class="container">
            <div class="row">
               <div class="col-md-8 offset-md-2">
                  <div class="title">
                     <h2>my <strong class="black">account</strong></h2>
             <!--         <span>Easy and effective way to get your device repaired.</span> -->
                  </div>
               </div>
            </div>
            <div class="row">
            
               <div class="col-md-12">
                  <div class="service-box account-box">
               
                    <h3 id="nickname">${ account.accountNickName }</h3> 
                 
                     <h4 id="accountNo">${ account.accountNo }</h4>
                     <h1 id="balance"> ${ account.balance }원</h1>
                    <div class="row">
                  	<button id="acc-trans-btn" class="col-md-5 read-more">이체</button>
                  	<button id="acc-delete-btn" class="col-md-5 read-more">계좌삭제</button>
                  	</div>
                  </div>
               </div>
        
            </div>
         </div>
      </div>
      <!-- end service -->
      
           <div class="product">
         	<div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title history-title">
                     <h2>거래 <strong class="black">내역</strong></h2>
                     <!-- <span>We package the products with best services to make you a happy customer.</span> -->
                  </div>
                  <table class="table">
					  <thead>
					    <tr>
					      <th scope="col" id="trans-date-col">날짜</th>
					      <th scope="col" id="trans-info-col">거래정보</th>
					      <th scope="col" id="trans-money-col">금액</th>
					   	  <th scope="col">잔액</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <td>07/21</td>
					      <td>지에스 25</td>
					      <th scope="row" id="trans-money">-10000원</th>
					      <td>Thornton</td>
					      
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>Thornton</td>
					      
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry the Bird</td>
					     <td>Thornton</td>
					     <td>Thornton</td>
					    </tr>
					  </tbody>
					</table>
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
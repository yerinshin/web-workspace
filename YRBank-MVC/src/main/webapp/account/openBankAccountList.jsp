<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>
	
	section {
		margin-bottom : 150px;
	}
	
	.title {
	 padding-bottom : 70px;
	}
	
	.bankType {
		text-align : center;
		font-size : 27px;
	
		height : 60px;
		/* margin-bottom : 40px; */
	}
	
	#yr-bank {
		border-bottom: 3px solid #e2e2e2;	
	}
	
	#other-bank {
		background :#e2e2e2; 
	}
	
	div.accountList {
		margin-top : 80px;
	}
	
	#btn-read-more {
		margin : 30px 50px 0px 50px auto;
	}
	
	.account-box {
		margin : 20px;
	}
	
	div.account-box:hover {
		border : 3px solid #e2e2e2; 
		opacity :0.9;
	}
	
	.account-add-box {
		margin : 40px 20px;
	}
	
	#nickname {
		color : black;
		/* text-align : left; */
		font-size : 24px;
		font-weight : bold;
		/* color : #ffc221; */
		margin-left:10px;
	}	
	#accountNo {
	/* 	text-align : left; */
		font-size : 18px;
	}
	
	#balance {
		font-size : 26px;
	}
	
	h2 {
	
		font-size :30px;
	}
	
	.logo-img {
		margin-left : 20px;
		margin-right : 10px;
		margin-bottom : 20px;
	}
</style>
<script>
	function goAccountDetail(accountNo) {
		location.href='<%= request.getContextPath() %>/account/openAccountDetail.do?accountNo='+accountNo
		
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
            </div>
            
             <div class="row">
               <div class="col-md-6 bankType" id="yr-bank">
               <a href="<%= request.getContextPath() %>/account/accountList.do">YR Bank</a>
               </div>
               <div class="col-md-6 bankType" id="other-bank">
               <a href="<%= request.getContextPath()%>/account/openBankAccountList.do">타행계좌</a>
               </div>
        	 </div>
        	 
           <div class="container accountList">
         
           <c:if test="${ not empty JHAccountList }">
           <div class="row">
           <img class= "logo-img" src="<%= request.getContextPath() %>/resources/images/jh-logo.png">
           <h2>[ JH Bank ]</h2>
           </div>
            <div class="row">
			<c:forEach items="${ JHAccountList }" var="account" varStatus="loop">	
               <div class="col-md-6">
                  <div class="service-box account-box" onclick="goAccountDetail('${account.accountNo}')">
                  <div id="nickname"> 
                     ${ account.accountNickName }
                  </div>
                     <h4 id="accountNo">${ account.accountNo }</h4>
                     <h1 id="balance"> ${ account.balance }원</h1>
                    <div class="row">
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이체</button>
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이용내역</button>
                  	</div>
                  </div>
               </div>
               </c:forEach>
               </div>
              </c:if>
            
            <c:if test="${ not empty SWAccountList }">
            <hr>
            <br>
             <div class="row">
           <img class= "logo-img" src="<%= request.getContextPath() %>/resources/images/sw-logo.png">
            <h2> [ SW Bank ] </h2>
            </div>
            <div class="row">
	            <c:forEach items="${ SWAccountList }" var="account" varStatus="loop">	
	               <div class="col-md-6">
	                  <div class="service-box account-box" onclick="goAccountDetail('${account.accountNo}')">
	                  <div id="nickname"> 
                     	${ account.accountNickName }
                 	  </div>
	                     <h4 id="accountNo">${ account.accountNo }</h4>
	                     <h1 id="balance"> ${ account.balance }원</h1>
	                    <div class="row">
	                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이체</button>
	                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이용내역</button>
	                  	</div>
	                  </div>
	               </div>
	               </c:forEach>             
            </div>
            </c:if>
            
            <c:if test="${ not empty SJAccountList }">
            <hr>
            <div class="row">
           <img class= "logo-img" src="<%= request.getContextPath() %>/resources/images/sj-logo.png">
           <h2>[ SJ Bank ] </h2>
           </div>
            <div class="row">
	            <c:forEach items="${ SJAccountList }" var="account" varStatus="loop">	
	               <div class="col-md-6">
	                  <div class="service-box account-box" onclick="goAccountDetail('${account.accountNo}')">
	                	 <div id="nickname"> 
                   		 	 ${ account.accountNickName }
                 		 </div>
	                     <h4 id="accountNo">${ account.accountNo }</h4>
	                     <h1 id="balance"> ${ account.balance }원</h1>
	                    <div class="row">
	                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이체</button>
	                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">이용내역</button>
	                  	</div>
	                  </div>
	               </div>
	               </c:forEach>
            </div>
            </c:if>
         </div>
         </div>
         
        
<%--             <div class="accountList">
            
				<div class="container">
            <div class="row">
				
			<c:if test="${ not empty JHAccountList }">
			 
			 <h2>JH뱅크</h2>
				<c:forEach items="${ JHAccountList }" var="account" varStatus="loop">	
	               <div class="col-md-6">
	                  <div class="service-box account-box">
	                  <a id="nickname" href="<%= request.getContextPath() %>/account/accountDetail.do?accountNo=${account.accountNo}"> 
	                     ${ account.accountNickName }
	                  </a>
	                     <h4 id="accountNo">${ account.accountNo }</h4>
	                     <h1 id="balance"> ${ account.balance }원</h1>
	                    <div class="row">
	                  	<button id="btn-read-more" class="col-md-5 read-more">이체</button>
	                  	<button id="btn-read-more" class="col-md-5 read-more">이용내역</button>
	                  	</div>
	                  </div>
	               </div>
	               </c:forEach>
			
			</c:if>
		</div>
			</div> 
			
			<div class="container">
			 <div class="row">
			<c:if test="${ not empty SWAccountList }">
			
          
             <hr>
             	<h1>SW뱅크</h1>
	             <c:forEach items="${ SWAccountList }" var="account" varStatus="loop">	
	               <div class="col-md-6">
	                  <div class="service-box account-box">
	                  <a id="nickname" href="<%= request.getContextPath() %>/account/accountDetail.do?accountNo=${account.accountNo}"> 
	                     ${ account.accountNickName }
	                  </a>
	                     <h4 id="accountNo">${ account.accountNo }</h4>
	                     <h1 id="balance"> ${ account.balance }원</h1>
	                    <div class="row">
	                  	<button id="btn-read-more" class="col-md-5 read-more">이체</button>
	                  	<button id="btn-read-more" class="col-md-5 read-more">이용내역</button>
	                  	</div>
	                  </div>
	               </div>
	               </c:forEach>
              
             </c:if>
             </div>
             </div>
             
             <div class="container">
              <div class="row">
             <c:if test="${ not empty SJAccountList }">
              
              <hr>
              	<h2>SJ뱅크</h2>
	             <c:forEach items="${ SJAccountList }" var="account" varStatus="loop">	
	               <div class="col-md-6">
	                  <div class="service-box account-box">
	                  <a id="nickname" href="<%= request.getContextPath() %>/account/accountDetail.do?accountNo=${account.accountNo}"> 
	                     ${ account.accountNickName }
	                  </a>
	                     <h4 id="accountNo">${ account.accountNo }</h4>
	                     <h1 id="balance"> ${ account.balance }원</h1>
	                    <div class="row">
	                  	<button id="btn-read-more" class="col-md-5 read-more">이체</button>
	                  	<button id="btn-read-more" class="col-md-5 read-more">이용내역</button>
	                  	</div>
	                  </div>
	               </div>
	               </c:forEach>
            
  			 </c:if>
  			 </div>
  			 </div>
             
              </div> 
            </div>--%>
        

      <!-- end service -->
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
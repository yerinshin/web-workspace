<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
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
                        <h2>our product</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
      <!-- our product -->
      <div class="product">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     
                     <span>We package the products with best services to make you a happy customer.</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="product-bg">
         <div class="product-bg-white">
         <div class="container">
            <div class="row">
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p1.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p2.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p3.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p4.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p5.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p2.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p6.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p7.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p6.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p1.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p2.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="product-box">
                     <i><img src="icon/p4.png"/></i>
                     <h3>Norton Internet Security</h3>
                     <span>$25.00</span>
                  </div>
               </div>
               </div>
            </div>
         </div>
      
	  <%-- footer --%>
      <footer>
         <jsp:include page="/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
      <script src="<%= request.getContextPath() %>/resources/js/jquery.min.js"></script> 
      <script src="<%= request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script> 
      <script src="<%= request.getContextPath() %>/resources/js/popper.min.js"></script> 
      <script src="<%= request.getContextPath() %>/resources/js/jquery-3.0.0.min.js"></script> 
      <script src="<%= request.getContextPath() %>/resources/js/plugin.js"></script> 
      <!-- sidebar --> 
      <script src="<%= request.getContextPath() %>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> 
      <script src="<%= request.getContextPath() %>/resources/js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
         $(document).ready(function(){
         $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         $(".zoom").hover(function(){
         
         $(this).addClass('transition');
         }, function(){
         
         $(this).removeClass('transition');
         });
         });
         
      </script> 
   </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

         <!-- header inner -->
         <div class="header">
            <div class="head_top">
               <div class="container">
                  <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                       <div class="top-box">
                        <ul class="sociel_link">
                         <li> <a href="#"><i class="fa fa-facebook-f"></i></a></li>
                         <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                         <li> <a href="#"><i class="fa fa-instagram"></i></a></li>
                         <li> <a href="#"><i class="fa fa-linkedin"></i></a></li>
                     </ul>
                    </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                       <div class="top-box">
                        <p> ${ loginMember.name } 님 YR Bank에 오신걸 환영합니다. </p>
                    </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row">
               <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                  <div class="full">
                     <div class="center-desk">
                        <div class="logo"> <a href="index.html"><img src="<%= request.getContextPath() %>/resources/images/logo1.png" alt="logo"/></a> </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-7 col-lg-7 col-md-9 col-sm-9">
                  <div class="menu-area">
                     <div class="limit-box">
                     
                     
                     



						<nav class="main-menu">                    
                          	<ul class="menu-area-main">
   
                           	 <li class="active"> <a href="<%= request.getContextPath()%>">Home</a> </li>
                          <%--     <li> <a href="/about.jsp">계좌생성</a> </li> --%>
			 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            계좌관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/account/accountOpen.do">계좌생성</a></li>
            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/account/accountList.do">계좌조회</a></li>
            <li><a class="dropdown-item" href="#">계좌송금</a></li>
          </ul>
        </li>
                              <li> <a href="<%= request.getContextPath() %>/board/boardList.do">Q&A</a> </li>
                                <c:choose>
                     		  	<c:when test="${ empty loginMember }">
                             		<li> <a href="<%= request.getContextPath() %>/member/signUp.do">signup</a> </li>
                       	       	</c:when>
                       	       	<c:otherwise>
                       	       		 <li> <a href="/product.jsp">MyPage</a> </li>
                       	       	</c:otherwise>	
                       	       </c:choose>
                               
                           </ul>
                          </nav>
                        <nav class="main-menu">
                           <ul class="menu-area-main">
                              <li class="active"> <a href="<%= request.getContextPath()%>">Home</a> </li>
                              <li> <a href="<%= request.getContextPath()%>/about.jsp">Account</a> </li>
                              <li> <a href="<%= request.getContextPath()%>/blog.jsp">Q&A</a> </li>
                             	<li class="mean-last"> <a href="<%= request.getContextPath()%>/contact.jsp">signup</a> </li>
                       	     
                       	       		<li> <a href="<%= request.getContextPath()%>/product.jsp">MyPage</a> </li>
                            </ul>
                        </nav>
                     </div>
                  </div>
               </div>
               <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
                     <c:choose>
                     	<c:when test="${ empty loginMember }">
                    	 	<li><a class="buy" href="<%= request.getContextPath() %>/member/login.do">Login</a></li>
                    	</c:when>
               			<c:otherwise>
                       		<li><a class="buy" href="<%= request.getContextPath() %>/member/logout.do">Logout</a></li>
                     	</c:otherwise>
                     </c:choose>
          		</div>
            </div>
         </div>
         </div>
         <!-- end header inner --> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
   		
   		<jsp:include page="/include/head.jsp"></jsp:include>
   	
   	
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
     		.c-out {
     			padding-left : 10px;
     			margin-bottom : 15px;
     			height: 80px;
     		}
     	</style>
     
     	<script>
	     	
	
	     		  $("#modal-button").click(function(){
	     		    $(".modal").fadeIn();
	     		  });
	     		  
	     		  $(".modal_content").click(function(){
	     		    $(".modal").fadeOut();
	     		  });
	     		  
	    
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
                        <h2>회원가입</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- contact -->
    <div class="contact">
        <div class="container">
          
                <div class="col-md-12">

                    <form class="main_form" action="<%= request.getContextPath()%>/member/signUpProcess.do" method="post">

                        
                         <!-- 아이디, 비번, 이름, 주민등록번호, email, tel -->
                         	<!-- <div class="col-md-7">
                                <input class="form-control" placeholder="아이디" type="text" name="id">
                            </div> -->
                           <table>
                           		<tr>
                           			<th>아이디</th>
                           			<td>
                           			<div class="row">
                           				<div class="col-md-8">
       	                    			<input class="form-control" placeholder="아이디" type="text" name="id">
                           				</div>
                           			 	<div class="col-md-4">
                           			 	<button type="button" class="send" id="modal-button">중복체크</button>
                           			 	<div class="modal">
											  <div class="modal_content" 
											       title="클릭하면 창이 닫힙니다.">
											    여기에 모달창 내용을 적어줍니다.<br>
											    이미지여도 좋고 글이어도 좋습니다.
											  </div>
										</div>
                           			 	</div>
                           			</div>
                           			</td>                          			
                           		</tr>
                           		<tr>
                           			<th>비밀번호</th>
                           			<td>  <input class="form-control" placeholder="비밀번호" type="password" name="password1"></td>
                           		</tr>	
                           		<tr>
                           			<th>비밀번호 재확인</th>
                           			<td>  <input class="form-control" placeholder="비밀번호 재확인" type="password" name="password2"></td>
                           		</tr>
                           		<tr>
                           			<th>이름</th>
                           			<td><input class="form-control" placeholder="이름" type="text" name="name"></td>
                           		</tr>
                           		<tr>
                           			<th>주민등록번호</th>
                           			<td>
                           			<div class="row">
	                           			<div class="col-md-5">
	                           			<input class="form-control" placeholder="생년월일" type="text" name="ss1">
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
                           		<tr>
                           			<th>이메일</th>
                           			<c:choose>
	                     				<c:when test="${ empty kakaoEmail }">
	                           			<td><input class="form-control" placeholder=" 예) email@gmail.com" type="email" name="email"></td>
	                           			</c:when>
	                           			<c:otherwise>
	                           			<td><c:out value="${ kakaoEmail }"/></td>
	                           			</c:otherwise>
                           			</c:choose>
                           		</tr>
                           		<tr>
                           			<th>전화번호</th>
                           			<td><input class="form-control" placeholder="전화번호" type="text" name="tel"></td>
                           		</tr>
                           </table>
                          
                            <div class=" col-md-12">
                                <button type="submit" class="send">회원가입</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>
     table {
     	font-size : 17px;
     	width : 80%;
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
     max-width : 400px;
     	margin-top : 50px;
     }
     
     .c-out {
     		padding-left : 10px;
     		margin-bottom : 15px;
     		height: 80px;
     	}
     	
     	footer {
    
     		margin-top : 100px;
     	}
</style>

<script>
	if('${ loginMember }' == '') {
		location.href="<%= request.getContextPath()%>/member/login.jsp"
	}
		
	$(document).ready(function() {
		$('#goBoardListBtn').click(function() {
			location.href = "<%= request.getContextPath()%>/board/boardList.do"
		})
	})
	
	function doWrite()	{
		
		let f = document.accountOpenForm
		
		if(f.accountPwd1.value == '') {
			alert('계좌 비밀번호를 설정하세요')
			f.accountPwd1.focus()
			return false
		}
		
		if(f.accountPwd2.value == '') {
			alert('계좌 비밀번호 재입력하세요')
			f.accountPwd2.focus()
			return false
		}
		
		
		if(f.accountNickName.value == '') {
			alert('계좌별칭을 설정하세요')
			f.balance.focus()
			return false
		}
		
		if(f.balance.value == '') {
			alert('입금금액을 입력하세요')
			f.balance.focus()
			return false
		}		
			
		return true
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
                        <h2>[ YR Bank ] 계좌 개설</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- contact -->
    <div class="contact">
        <div class="container">
          
                <div class="col-md-12">

                   <form class="main_form" action="<%= request.getContextPath()%>/account/accountOpenProcess.do" method="post"
					name="accountOpenForm" onsubmit="return doWrite()">
					  <input type="hidden" name="accountOwner" value="${ loginMember.name }">
					  <input type="hidden" name="userId" value="${ loginMember.id }">
                           <table>
                           		<tr class="c-out">
                           			<th>이름</th>
                           			<td>
                           			<div class="row">
                           				<div class="col-md-12">
                           					<c:out value="${ loginMember.name }" />
                           				</div>
                           			</div>
                           			</td>
                           		</tr>
                           		<tr class="c-out">
                           			<th>생년월일</th>
                           			<td>
                           			<div class="row">
                           				<div class="col-md-12">
                           					<c:out value="${ loginMember.ss1 }" /> -<c:out value="${ sex }xxxxxx"></c:out>
                           				</div>
                           			</div>
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>계좌 비밀번호</th>
                           			<td>  <input class="form-control" placeholder="숫자 4자리를 입력해주세요" type="password" name="accountPwd1"></td>
                           		</tr>	
                           		<tr>
                           			<th>비밀번호 재확인</th>
                           			<td>  <input class="form-control" placeholder="계좌비밀번호 재확인" type="password" name="accountPwd2"></td>
                           		</tr>
                           		<tr>
                           			<th>계좌 별칭</th>
                           			<td><input class="form-control" placeholder="계좌 별칭" type="text" name="accountNickName"></td>
                           		</tr>
                           		<tr>
                           			<th>입금금액</th>
                           			<td>
                           			<div class="row">
	                           			<div class="col-md-10">
	                           			<input class="form-control" placeholder="금액을 입력하세요 (단위 : 원)" type="text" name="balance">
	                           			</div> 
	                           			<div class="dash col-md-1">
	                           			   원
	                           			</div>
	                           			
                           			</div>
                           			</td>
                           		</tr>
                           	
                           </table>
                          
                            <div class=" col-md-12 openAcc-btn">
                                <button type="submit" class="send">계좌개설하기</button>
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
<%-- <body class="main-layout">
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
                        <h2> [ YR Bank ] 계좌 개설 </h2>
                    </div>
                </div>
            </div>
        </div>
        </div>
        
   <div class="contact">
        <div class="container">
        <div class="row">
			<div class="col-md-12">
			<form class="main_form" action="<%= request.getContextPath()%>/account/accountOPenProcess.do" method="post"
					name="accountOpenForm" onsubmit="return doWrite()">
			  <table>
                           		<tr>
                           			<th>이름</th>
                           			<td>
									<div class="c-out">
									<c:out value="${ loginMember.name }" />
									</div>
									</td>
                           		</tr>
                           		<tr>
                           			<th> 생년월일 </th>
                           			<td>
                           			<div class="row">
	                           			<div class="col-md-6">
	                           			<c:out value="${ loginMember.ss1 }" />
	                           			</div> 
	                           		
                           			</div>
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>계좌 비밀번호</th>
                           			<td>  <input class="form-control" placeholder="숫자 4자리를 입력해주세요" type="password" name="accountPwd1"></td>
                           		</tr>	
                           		<tr>
                           			<th>비밀번호 재확인</th>
                           			<td>  <input class="form-control" placeholder="계좌비밀번호 재확인" type="password" name="accountPwd2"></td>
                           		</tr>
                           		<tr>
                           			<th>입금 금액</th>
                           			<div class="row">
                           			<td><input class="form-control" placeholder="입금할 금액을 입력하세요" type="text" name="balance"></td>
                           			<div>
                           			원
                           			</div>
                           			</div>
                           		</tr>
                           </table>
                          
                            <div class=" col-md-12">
                                <button type="submit" class="send">계좌 개설하기</button>
                            </div>
                        
                    </form>
                </div>
            </div>
        </div>      
     </div>
        
      </section> 

      footer
      <footer>
         <jsp:include page="/include/footer.jsp"></jsp:include>
      </footer>
      end footer
      
      <!-- Javascript files--> 
  		<jsp:include page="/include/javascriptFiles.jsp"></jsp:include>
</body> --%>
</html>
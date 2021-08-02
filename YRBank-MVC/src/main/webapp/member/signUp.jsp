<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
   		
   		<jsp:include page="/include/head.jsp"></jsp:include>
   	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   	
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
<script>	
	 function doWrite(){
		
		let f = document.signUpForm
		if(f.id.value == '') {
			alert('아이디를 입력하세요')
			f.id.focus()
			return false
		}
		
		if(f.password1.value == '') {
			alert('비밀번호를 입력하세요')
			f.pwd.focus()
			return false
		}
		
		if(f.password2.value == '') {
			alert('재확인 비밀번호를 입력하세요')
			f.pwd2.focus()
			return false
		}
		
		if(f.name.value == '') {
			alert('이름을 입력하세요')
			f.name.focus()
			return false
		}
		
		if(f.ss1.value == '') {
			alert('주민등록번호를 입력하세요')
			f.birth.focus()
			return false
		}
		if(f.ss2.value == '') {
			alert('주민등록번호를 입력하세요')
			f.birth.focus()
			return false
		}
		 
		 if(f.email.value == '') {
				alert('이메일을 입력하세요')
				f.gender.focus()
				return false
			}
		
		 
		if(f.tel.value == '') {
			alert('전화번호를 입력하세요')
			f.phone.focus()
			return false
		}
		
		return true
	} 
	
 	$(document).ready(function(){
		
  		$('#pwd-success').hide()
		$('#pwd-fail').hide() 
		 
		$('#password2').on("propertychange change keyup paste input",
        	function() {
				let val = $(this).val()
				if(val == $('#password1').val()) {
					$('#pwd-success').show()
					$('#pwd-fail').hide()
					$('#btnJoin').attr('disabled', false)
				} else {
					$('#pwd-success').hide()
					$('#pwd-fail').show()
					$('#btnJoin').attr('disabled', true)
				}
				if(val == '') {
					$('#pwd-success').hide()
					$('#pwd-fail').hide()
					$('#btnJoin').attr('disabled', true)
				}
		
			})
		
	})	
	

$(document).ready(function(){
		$("#id").keyup(function() {
		  		var user_id = $('#id').val();
		  		var pattern1 = /^[a-z]+[a-z0-9]{5,19}$/g ;
		  		
		  		if (pattern1.test(user_id)){//정규식이 통과한 경우
		  			$.ajax({
				  			url : '${pageContext.request.contextPath}/member/index/checkMember.do',
				  			type : 'get',
				  			dataType: "json",
				  			data : {"id" :user_id},
				  			success : function(data){
				  				
				  				if(data == 1) {
				  				$('#check_id').text("사용 중인 아이디 입니다.");
		  						$('#submit').attr("disabled", "disabled");		
				  				} else {
				  						$('#check_id').text("사용가능한 아이디 입니다.");
				  						$("#btnJoin").removeAttr("disabled");		  				
				  				}
				  			}, error : function(){
				  			}
				  		});
		  		}else if (user_id ==""){
		  			$('#check_id').text("아이디를 입력해 주세요");
					$('#btnJoin').attr("disabled", "disabled");	
		  		} 	else {
		  			$('#check_id').text("형식에 맞지 않는 번호입니다.");
					$('#btnJoin').attr("disabled", "disabled");	
		  			//정규식 통과에 실패한 경우
		  		}
		});
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

                    <form class="main_form" action="<%= request.getContextPath()%>/member/signUpProcess.do" name="signUpForm" method="post">

                        
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
                           			<td>  <input class="form-control" placeholder="비밀번호" type="password" name="password1" id="password1"></td>
                           		</tr>	
                           		<tr>
                           			<th>비밀번호 재확인</th>
                           			<td>  <span><input class="form-control" placeholder="비밀번호 재확인" type="password" name="password2" id="password2"></span>
                           			  <span id="pwd-success" style="color:blue;">비밀번호가 일치합니다.</span>
									  <span id="pwd-fail" style="color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
									  </td>
                           			
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
                                <button type="submit" class="send" id="btnJoin">회원가입</button>
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
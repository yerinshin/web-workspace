<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<!--  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->

<style>
		.button input {		
   		 	margin-top : 30px;
   			border-radius : 12px;
   		}
   			
     	table {
     		font-size : 17px;
     	}
     		
     	th {
     		text-align : center;
     		width : 30%;
     	}
    		
    	input.form-control {
     		margin-top : 20px;
     	}
     	
     	.send {
     		margin-top : 20px;
     		
     	
     	}
     	
     	
     	
     	.c-out {
     		padding-left : 10px;
     		margin-bottom : 15px;
     	}
     	
     	#goBoardListBtn {
     		margin-left : 230px;
     	}
     	
     	#writeBoardBtn {
     		margin-right : 200px;
     	}
     	
     	.btn {
     	
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
		
		let f = document.writeForm
		
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}
		
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
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
      
      
      <section>
      
        <div class="brand_color">
         <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>리플달기</h2>
                    </div>
                </div>
            </div>
         </div>
    	</div>
      
      <div class="contact">
        <div class="container">
            <div class="col-md-12">
            
             <form action="<%= request.getContextPath() %>/board/boardReplyProcess.do" method="post" 
                    class="main_form" name="writeForm" onsubmit="return doWrite()">
                  <input type="hidden" name="writer" value="${ loginMember.id }">
                  <input type="hidden" name="parentBoardNo" value="${ parentBoardNo }">
         
                  <input type="hidden" name="groupNo" value="${ board.groupNo }">
					<table>
						<tr>
							<th>제목</th>
							<td>
								<input class="form-control" type="text" size="60" name="title">
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
							<div class="c-out">
								<c:out value="${ loginMember.id }" />
						</div>
							</td>
						</tr>
						<tr id="content">
							<th>내용</th>
							<td>
								<textarea class="textarea" rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>

					</table>
				<div class="col-md-12">
				<div class="row button">
				
				
		            <input class="send" type="button" value="목록" id="goBoardListBtn">
		        	<input class="send" type="submit" value="등록" id="writeBoardBtn">
				</div>
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
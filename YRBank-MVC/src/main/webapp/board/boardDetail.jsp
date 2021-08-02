<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
   	<jsp:include page="/include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
	.contact {
		margin-top : 100px;
		margin-bottom : 100px;
	}
     table {
    	font-size : 20px;
     }
     		
     th {
      	width : 150px;
     	text-align : center;
     }
     
    #first-row {
    	text-align : center;
    }
    
    button {
   		margin : 0px auto;
   		border-radius : 12px;
   	}
   	

   	
   	.send {
   		margin-top: 40px;
   	}
   	
    #th-tag {

	 background-color : rgb(204,204,204,0.2); 
	
    }
    
    #td-tag {
    	color : black;
    }
    
    #content {
    	height : 400px;
    }
    
</style>

<script>
$(document).ready(function(){
	
	/* if(msg != null) {
		alert(msg)
	} */
	
	$('#goListBtn').click(function(){
		location.href = "<%= request.getContextPath() %>/board/boardList.do"
	})
	
	$('#updateBtn').click(function(){
		boardNo = ${ board.no }
		location.href = "<%= request.getContextPath() %>/board/boardUpdate.do?no="+boardNo
	//  location.href = "updateForm.jsp?no=${ param.no }"
	})
	
	$('#deleteBtn').click(function(){
		boardNo = ${ board.no }
		location.href = "<%= request.getContextPath() %>/board/boardDelete.do?no="+boardNo
	})
	
	$('#goReplyBtn').click(function(){
		
		boardNo = ${ board.no }
		location.href= "<%= request.getContextPath() %>/board/boardReply.do?no="+boardNo
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
                    <div class="titlepage">
                        <h2>글 상세 내용</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- contact -->
    <div class="contact">
        <div class="container">
          
                <div class="col-md-12">
					 <table class="table">
                           		<tr id="first-row">
                           			<th id="th-tag">번호</th>
                           			<td><c:out value="${ board.no }" /></td>     
                           			<th id="th-tag">조회수</th>
                           			<td>${ board.viewCnt }</td> 
                           			<th id="th-tag">등록일</th>
									<td>${ board.regDate }</td>                  			
                           		</tr>
                           		<tr>
                           			<th id="th-tag">제목</th>
                           			<td colspan="5" id="td-tag"><c:out value="${ board.title }" /></td>
                           	
                           		</tr>	
                           		<tr>
                           			<th id="th-tag">작성자</th>
                           			<td colspan="5" id="td-tag">${ board.writer }</td>
                           		</tr> 
                           		<tr id="content">
                           			<th id="th-tag" >내용</th>
                           			<td colspan="5" id="td-tag">${ board.content }</td>
                           		</tr>

                           </table>
                           <div class="row send-btn"> 
							<button class="read-more" id="goListBtn">목록</button>
                           <button class="read-more" id="updateBtn" >수정</button>
							<button class="read-more" id="deleteBtn">삭제</button>
							
							<button class="send" id="goReplyBtn">답글</button>
                           </div>
							

                   
                </div>
            </div>
        </div>
    
      </section>
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
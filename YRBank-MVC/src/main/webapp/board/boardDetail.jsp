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
   	}
   	
    #th-tag {
  /*   background-color:#dee2e6; */
 /*  background-color : rgb(255,204,051,0.5); */
	 background-color : rgb(204,204,204,0.2); 
	
    }
    
    #td-tag {
    	color : black;
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
                           		<tr>
                           			<th id="th-tag" >내용</th>
                           			<td colspan="5" id="td-tag">${ board.content }</td>
                           		</tr>
                           		<%-- <tr>
                           			<th class="table-light">조회수</th>
                           			<td>${ board.viewCnt }</td>
                           		</tr> --%>
                           		<%-- <tr>
                           			<th class="table-light">등록일</th>
									<td colspan="5">${ board.regDate }</td>
                           		</tr> --%>
                           </table>
                           <button class="send" id="updateBtn" >수정</button>
							<button class="send" id="deleteBtn">삭제</button>
							<button class="send" id="goListBtn">목록</button>
                           
<%--                            <div class="container col-md-12">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title mb-3">${ board.title }</h1>
            <h2 class="text-muted mb-4">
                <i class="far fa-user"></i> ${ board.writer }
                ·
                <i class="far fa-clock"></i>${ board.regDate }
                ·
                <i class="fas fa-align-justify"></i>${ board.viewCnt }
            </h2>
            <h2> class="card-text">${board.content }</h2>
        </div>
        <div class="card-body">
            <a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
            <a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
        </div>
        <div class="card-body">
            <a href='<c:url value='/board/boardList'/>' class="btn btn-info" role="button">목록으로</a>
        </div>
    </div>
</div>
 --%>

                   
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/head.jsp"></jsp:include>
	
<style>
	
     table {
    	font-size : 23px;
    	border : 2px;
     }
     		
     th, td {
     	text-align : center;
     }
     
     
     
     td#title {
     	padding-left : 50px;
     	text-align : left;
     }
	
	#re{
	/* 	color:#d74351; */
		margin-right:10px;
	}
    .list-table {
    	margin-top : 100px;
    }
    
    .add-btn {
    	margin : 50px 0px 30px 0px;
    
    }
    
    button {
    	border-radius : 12px;
    }
    
     .send {
     	max-width : 400px;
     	margin-top : 80px;
     }
    
    footer {
    	margin-top: 100px;
    }
</style>
<script>
	<%--
	$(document).ready(function() {
		$('.addBtn').click(function() {
			location.href= '<%= request.getContextPath()%>/board/boardWrite.do'
		})
	})
	--%>
	
	function writeBoard() {
		location.href= "<%= request.getContextPath()%>/board/boardWrite.do"
	}
	
	function doAction(no, viewCnt) {
		//jstl의 해석이 먼저이기 때문에 javascript안에도 jstl사용 가능. choose안의 when태그에 의해서 javascrpit코드가 나뉘어서 실행됨
	
		//jstl은 이미 서버에서 먼저 해석이 되어 servlet에 들어가 있음. (둘중 하나의 문장만) -> response되어있는 코드에는 두개중에 하나의 문장만 들어있음
		//그럼 웹브라우저가 location.href 나 confirm 중 들어있는 코드만 해석해서 javascript문법 실행시킴
		<c:choose>
			<c:when test="${ not empty loginMember }">	
				location.href = '<%= request.getContextPath() %>/board/boardDetail.do?no='+ no +'&type=boardList';	
			</c:when>
			<c:otherwise>
				if(confirm('로그인이 필요한 페이지입니다\n로그인페이지로 이동하시겠습니까?'))
					location.href = "<%= request.getContextPath()%>/member/login.do"
						</c:otherwise>
					</c:choose>
				}
	</script>
</head>
<body>
	<header>
		<jsp:include page="/include/header.jsp"/>
	</header>
	
	<section>
	 <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Q&A 목록</h2>
                    </div>
                </div>
            </div>
        </div>
   	 </div>
   	 
   	 
   	 <div class="contact list-table">
        <div class="container">
            <div class="col-md-12">
		   	 <table class="table table-striped table-hover">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">등록일</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				   <c:forEach items="${ boardList }" var="board" varStatus="loop">	
	
					<tr>
						<td>${ board.rowNum }</td>
						<td id="title" class="row">
						
							<c:if test= "${ board.level gt 1 }">
							<c:forEach begin="1" end="${ board.level }">
									&nbsp;&nbsp;	<!-- 답변글일경우 글 제목앞에 공백을 준다. -->
							</c:forEach>
							
							<div id="re">
									└<img src="<%= request.getContextPath() %>/resources/images/reply-img.png" /> 
							</div>
							</c:if>
						
						
						<%-- 	<a href="<%= request.getContextPath() %>/board/detail.do?no=${ board.no }"> 
							<a href="#" onclick="doAction()"> --%>
							<a href="javascript:doAction(${ board.no }, ${ board.viewCnt })">  <%-- href로 경로 이동하지 않고, 자바스크립트의 문법 실행 --%>
								
								<c:out value="${ board.title }" /> 
							</a>
						</td>
						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
						<td>${ board.viewCnt }</td>
					</tr>
				</c:forEach>
				  </tbody>
				</table>
				<c:if test="${ not empty loginMember }">
					<div class="col-md-12 add-btn">
					<button class="send" onclick="writeBoard()">새글등록</button>
					</div>
				</c:if>
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
</html>
</html>
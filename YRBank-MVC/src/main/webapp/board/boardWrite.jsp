<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/head.jsp"></jsp:include>
	
	<style>
		.button {
   			margin : 0px auto;
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
	<%--
		//파일 확장자 체크
		if(checkExt(f.attachfile1))
			return false
		if(checkExt(f.attachfile2))
			return false
	--%>		
			
		return true
	}
	
<%--
	function checkExt(obj) {
		let forbidName = ['exe','java','jsp','js','class']
		let fileName = obj.value		//파일obj.value 가 파일명
		
		let ext = fileName.substring(fileName.lastIndexOf('.')+1)
		console.log(ext)
		
		for(let i = 0; i < forbidName.length; i++ ){
			if(forbidName[i] == ext){
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다')
				return true
			}
		}
		return false
	}
--%>
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
                        <h2>게시글 등록</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="contact">
        <div class="container">
            <div class="col-md-12">
            
             <form action="<%= request.getContextPath() %>/board/boardWriteProcess.do" method="post" 
                    class="main_form" name="writeForm" onsubmit="return doWrite()">
                  <input type="hidden" name="writer" value="${ loginMember.id }">
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
						<tr>
							<th>내용</th>
							<td>
								<textarea class="textarea" rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>
						<%--
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="file" name="attachfile1">
								<input type="file" name="attachfile2">
							</td>
						</tr>
						 --%>
					</table>
				<div class="row button">
				<div class="col-md-2">
				</div>
		            <input class="send" type="button" value="목록" id="goBoardListBtn">
		        	<input class="send" type="submit" value="등록">
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
</html>
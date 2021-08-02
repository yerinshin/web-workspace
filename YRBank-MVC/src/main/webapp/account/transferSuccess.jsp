<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<style>
	div.nice-select{
		display : none;
	}
	
	#select {
		height : 67px;
		font-size : 23px;
	}
	
	table {
		width : 900px;
     	font-size : 25px;
     }
     		
     th {
     	text-align :center;
        padding-right : 25px;
     	padding-left:30px;
     	width : 40%;
     }
     td {
     	padding-left : 15px;
     	}
     		
     input.form-control {
     	font-size :23px;
     	margin-top : 20px;
     }
     

     #send-btn {
     	font-size : 20px;
     	max-width : 400px;
     	height : 63px; 
     	margin-top : 50px;
     }
     
     div.brand_color {
     
     margin-bottom : 150px;
     }
     
     
     
     section {
     	margin-bottom : 150px;
     	
     }
     
     h2{
     	font-size : 40px;
     	font-weight : bold;
     }
     h4 {
     	font-size : 27px;
     }
     
     #accountCheck {
     	padding : 40px 40px;
     }
     
     #transfer-btn {
     	font-size : 25px;
     	max-width : 450px;
     
     }
</style>
<script>
	$(document).ready(function(){
		$('#transfer-btn').click(function(){
			location.href='<%= request.getContextPath()%>/account/accountList.do'
		})
	})
</script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
try {
  function sendLinkDefault() {
    Kakao.init('992a4f6229c471e14baf1883c1918b4a')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '${ loginMember.name } 님로부터의 이체',
        description: '${ transInfo.otherAccOwner }님의 ${ transInfo.othersBankName }계좌에 ${ transInfo.transMoney }원 송금되었습니다.',
        imageUrl:
            '<%= request.getContextPath()%>/resources/images/kakao-message-img.JPG',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      buttons: [
        {
          title: '이체 상세 확인',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    })
  }
; window.kakaoDemoCallback && window.kakaoDemoCallback() }
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
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
                        <h2>계좌이체</h2>
                    </div>
                </div>
            </div>
         </div>
    	</div>
    	
    	
    	
    	
    	<!-- contact -->
    <div class="contact">
        <div class="container">

                <div class="col-md-12">
                
<div class="choose_bg">
         <div class="container">
            <div class="white_bg" id="accountCheck">
           		
           		<h2> v 이체 완료 </h2>
      
           		<br>
      
       			<h4>${ transInfo.otherAccOwner } 님의</h4>
      			<h4>${ transInfo.othersBankName } ${ transInfo.othersAccNo } 계좌에</h4>
      			<h4>${ transInfo.transMoney }원 이체완료</h4>
      			<br><br>
          
      			     <br>
      			     <div class="row">
      			      <button class="send" id="transfer-btn"><strong>확인</strong></button>  
      			      <button class="send" id="transfer-btn" onclick="sendLinkDefault();" value="Default"><strong>메세지보내기</strong></button>  
      			     </div>
        		 </div>
     		  </div>
      		</div>
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
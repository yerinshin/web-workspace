<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>카톡 공유</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
try {
  function sendLinkDefault() {
    Kakao.init('992a4f6229c471e14baf1883c1918b4a')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'dd',
        description: 'dd',
        imageUrl:
          '<%= request.getContextPath()%>/resources/images/kakao-message-img.JPG',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845,
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 보기',
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
<body>
 



   	<input type="button" onClick="sendLinkCustom();" value="Custom"/>
    <input type="button" onClick="sendLinkDefault();" value="Default"/> 
</html>
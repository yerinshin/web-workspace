<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$('#idCheckBtn').click(function(){
			location.href="idCheck.jsp?id="+$('#id').val()
		})
	})
</script>
<script>
	function openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=post]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=basicAddr]').val(data.address);
				$('[name=detailAddr]').val(data.buildingName);
			}
		}).open();
	}
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
			<h2>회원가입</h2>
		<hr width="80%">
		<br>
		<form action="signUp.jsp" method="post">
			*는 필수 입력 항목입니다.
			<table border="1" width="80%">
				<tr>
					<th width="25%">*아이디</th>
					<td>
						<input type="text" name="id" id="id">
						<input type="button" value="중복확인" id="idCheckBtn">
					</td>
				</tr>
				<tr>
					<th width="25%">*이름</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th width="25%">*비밀번호</th>
					<td>
						<input type="password" name="password1">
					</td>
				</tr>
				<tr>
					<th width="25%">*비밀번호 확인</th>
					<td>
						<input type="password" name="password2">
					</td>
				</tr>
				<tr>
					<th width="25%">이메일</th>
					<td>
						<input type="text" name="emailId">
						@<select name="emailDomain">
				    		<option value="naver.com">naver.com</option>
				    		<option value="daum.net">daum.net</option>
				    		<option value="google.com">google.com</option>
				    		<option>직접입력</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="25%">전화번호</th>
					<td>
						xxx-xxxx-xxxx 형식으로 입력하세요.<br>
						<input type="type" name="tel1" size="7" pattern="(010|011|017)">
						- <input type="type" name="tel2" size="12" pattern="[0-9]{4}">
						- <input type="type" name="tel3"size="12" pattern="[0-9]{4}">
					</td>
				</tr>
				<tr>
					<th width="25%">우편번호</th>
					<td>
						<input type="text" name="post" style="width:80px; height:26px;" />
						<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button>
					</td>
				</tr>
				<tr>
					<th width="25%">주소</th>
					<td>
						<input type="text" name="basicAddr" style="width:300px; height:30px;" readonly />
					</td>
				</tr>
				<tr>
					<th width="25%">상세 주소</th>
					<td>
						<input type="text" name="detailAddr" style="width:300px; height:30px;" />
					</td>
				</tr>
			</table>	
			<br>
			<input type="submit" value="회원가입">	
		</form>
	</div>
</body>
</html>
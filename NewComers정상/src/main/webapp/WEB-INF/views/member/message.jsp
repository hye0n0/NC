<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8"> 
<title>Insert title here</title>
	
</head>
<body>
	
	<form name="emailForm" action="emailForm.do" method="post">
	<table class="emailTable">
		<tr>
		<th>이메일</th>
		<td><input type="email" class="form-control" name="emailSend" id="emailSend" placeholder="이메일" 
								onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" >
			<button onclick="emailAuthentication()" id="emailSnedBtn" type="button">인증 메일 전송</button></td>
		</tr>
		<th>인증번호</th>
		<td><input type="text" class="form-control" id="emailCode" name="emailCode" placeholder="인증번호" 
								onfocus="this.placeholder = ''" onblur="this.placeholder = '인증번호'" >
			<button onclick="emailCodeCheck()" id="emailCodeCheck()" type="button" disabled="disabled" >인증</button>
			<input type="hidden" name="authPass" vlaue="false"></td>
	</table>
	</form>
	<button type="button" id="okBtn" name="okBtn" value="okBtn" onclick="sendMail();">확인</button>
	<button type="button" id="noBtn" name="noBtn" value="noBtn" onclick="window.close();">취소</button>

<script type="text/javascript">
	
	function check(pattern, taget, message) {
		alert("체크실행")
		if(pattern.test(taget)) {
	    	return true;
	  	  }
	    alert(message);
	    taget.focus();
	    return false;
		}
	
	const form = document.emailForm;

	function emailValCheck(){
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.emailSend.value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false;
		}
	    return true;
	}
	
	function emailAuthentication(){
		alert("이메일인증")
		if (!emailValCheck()){
	    	return false;
	   	   }
		var url = "confirmEmail.do?email=" + document.emailForm.email.value;
		//fetch(url);
		location.href = url;
		
		}
	

	

</script>
</body>
</html>
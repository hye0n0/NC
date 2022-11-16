<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="col-lg-6">
		<div class="login_form_inner">
			<h3>이메일 인증</h3>
			<form class="row login_form" action="#" id="register_form" method="post">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" id="id" name="id"  required="required"><br>
						<button class="button button-login w-100" type="button" value="No" id="idBtn" onclick="idCheck()">ID Check</button><br><br>
				
					<input type="text" class="form-control" id="email" name="email" placeholder="email" onblur="this.placeholder ='email'"><br>
					<button  class="button button-login w-100" type="button"  value="submit" id="emailCheck" onclick="emailSend()">Send Email</button>
					<button id="saveNum" value="1"></button>
				</div>
				
					

			</form>
		</div>
	</div>
	

	<!--===================이메일 인증 스크립트 ==================-->
	<script>

	function formSubmit(){
		alret ("등록된 아이디 있는지 검색")
 		if(document.getElementById('idBtn').value == 'No'){
  			alert("아이디를 확인해주세요.");
  			return false;
  		}
	}

	  //Id 중복 체크.
  	function idCheck(){

	  let id = document.getElementById('id').value;
	  console.log(id)
	  let url = "ajaxIdCheck.do?id="+id;
	  fetch(url)
	  	.then(response => response.text())
	  	.then(data => {
	  		if(data ==1){
	  			alert("해당 아이디에 대한 정보가 없습니다.");
	  			//document.getElementById('id').value ="";
	  			//document.getElementById('id').focus();
	  			
	  		} else {
	  			alert("아이디가 확인되었습니다. 이메일을 입력해주세요.");
	  			document.getElementById('idBtn').value = "Yes";
	  		}
	  	})
  }

	document.getElementById('saveNum').style.visibility = "hidden";
	
	function check(pattern, taget, message) {

			if(pattern.test(taget)) {
		    	return true;
		  	  }
		    alert(message);
		   // taget.focus();
		    return false;
			}

	function emailValCheck(){
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let email = document.getElementById("email").value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false;
		}
	    return true;
		}


	function emailSend(){ //인증번호 발송	
 		if(document.getElementById('idBtn').value == 'No'){
  			alert("아이디를 확인해주세요.");
  			return false;
  		}
	
		if(!emailValCheck()){
			return false;
			
		} else {
			alert("임시비밀번호를 발송중입니다. 잠시만 기다려주세요");
			let email = document.getElementById("email").value;
			let id = document.getElementById('id').value;
			let url= "confirmEmail.do?email="+email + "&id=" + id;
			console.log(url);
			fetch(url)
				.then(response => response.text())
				.then(data=>{
					console.log(data);
					if(data != "failed"){
						alert("임시비밀번호 발급이 완료되었습니다.");
						document.getElementById("emailCheck").disabled=true;
						//document.getElementById("certNum").focus();
						document.getElementById("saveNum").value=data;
						if(window.confirm("로그인창으로 이동하시겠습니까?")){
							window.open("memberLoginForm.do","NewComers");
						}else{
							window.close();
						}
					}else{
						alert("이메일 정보가 일치하지 않습니다. 다시 입력해주세요.");
					}
					
				})
			}
}

// function authCodeCheck(){
// 		var url ="authCodeCheck.do?inputedCode="+ document.getElementById('inputAuthCode').value;
// 		fetch(url)
// 			.then(response => response.text())
// 			.then(data=>{
// 				if()
// 			})
		
// }




		
</script>
</body>
</html>
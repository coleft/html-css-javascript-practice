<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
</head>
<body>
<form name='frm_find' method='post' action = 'FindPwd.do'>
   <span>아이디</span>
   <input type='text' value='아이디 입력' name='mId'/><br/>
   <span>이메일</span>
   <input type='text' value='이메일 입력' name='email'/><br/>
   <input type='button' name='btnSend' value='이메일로 발송'/>	<!-- ajax일땐 submit ㄴㄴ why? --> 
</form>
<div class = 'msg'></div>
<script>
var frm = document.frm_find;
frm.btnSend.onclick = function(){
	console.log(frm.mId.value, frm.email.value);
	var xhr = new XMLHttpRequest();
	
	var param = `?mId=\${frm.mId.value}&email=\${frm.email.value}`;
	xhr.open('post', 'FindPwd.do'+param);
	xhr.send(frm);
	
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState == 4){
			var data = xhr.responseText;
			var msg = document.querySelector('.msg');
			msg.innerHTML = data;
		}
	}
}

</script>
</body>
</html>
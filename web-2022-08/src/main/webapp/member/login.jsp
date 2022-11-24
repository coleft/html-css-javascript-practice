<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = 'stylesheet' href = './css/login_div.css'/>
<title>member/login.jsp</title>
</head>
<body>
<div id = 'login_div' class = 'login'>
	<form name = 'frm_login' method = 'post' action = 'jsp/login_result.jsp'>
		<div class = 'login_id_text'>
			<span>아이디</span>
			<input type = 'text' name = 'mId' value = 'a001'/><br/>
		</div>
		<div class = 'login_pwd_text'>
			<span>비밀번호</span>
			<input type = 'password' name = 'pwd' value = '1111'/><br/>
		</div>
		<br/>
		<input type = 'submit' value = '로그인'/>
		<input type = 'button' name = 'btnFindPwd' value = '암호찾기' onclick = "location.href='index.jsp?inc=jsp/findPwd.jsp'"/>
	</form>
</div>

</body>
</html>
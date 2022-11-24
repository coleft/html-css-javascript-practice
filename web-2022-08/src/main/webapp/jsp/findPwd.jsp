<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
</head>
<body>
<h3>아이디와 이메일 입력 시 암호 메일로 발송</h3>
<form name='frm_find' method='post' action = 'index.jsp?inc=jsp/findPwdResult.jsp'>
   <span>아이디</span>
   <input type='text' value='아이디 입력' name='mId'/><br/>
   <span>이메일</span>
   <input type='text' value='이메일 입력' name='email'/><br/>
   <input type='submit' name='btnSend' value='이메일로 발송'/> 
</form>
</body>
</html>
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
   <input type='submit' name='btnSend' value='이메일로 발송'/> 
</form>

</body>
</html>
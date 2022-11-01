<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/useBean2</title>
</head>
<body>
<h2>시험 성적 입력 </h2>
<form name = 'frm_useBean' method='post' action='useBean2_result.jsp'>
	<span>아이디</span>
	<input type = 'text' name = 'id' value = 'a001'/><br/>
	<span>국어</span>
	<input type = 'text' name = 'kor' value = '73'/><br/>
	<span>영어</span>
	<input type = 'text' name = 'eng' value = '85'/><br/>
	<span>수학</span>
	<input type = 'text' name = 'mat' value = '99'/><br/>
	<input type = 'submit' value='쿼리전송'/>
</form>
</body>
</html>
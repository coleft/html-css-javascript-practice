<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/useBean.jsp</title>
</head>
<body>
<h2>useBean사용을 위한 form</h2>
<form name = 'frm_useBean' method='post' action='useBean_result.jsp'>
	<span>이름</span>
	<input type = 'text' name = 'irum' value = 'hong'/><br/>
	<span>주소</span>
	<input type = 'text' name = 'address' value = '서울대 입구'/><br/>
	<input type = 'submit' value = '쿼리전송' />
</form>
</body>
</html>
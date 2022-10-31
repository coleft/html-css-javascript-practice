<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/logout.jsp</title>
</head>
<body>
<%
	session.setAttribute("mId", null);
	response.sendRedirect("login.jsp"); //페이지 이동
%>
</body>
</html>
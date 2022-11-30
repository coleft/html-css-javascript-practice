<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery/gugudan_result</title>
</head>
<body>
	<%
		int dan = Integer.parseInt(request.getParameter("dan"));
	String fmt = "";
	for(int i = 1; i<10; i++){
		fmt += String.format("%d * %d = %d<br/>", dan, i, (dan*i));
	}
	%>
	<%=fmt %>
</body>
</html>
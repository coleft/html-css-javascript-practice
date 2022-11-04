<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/el.jsp</title>
</head>
<body>

<%
	String findStr = request.getParameter("findStr");
%>

	<h2>EL test</h2>
	<form>
		<span>Value</span>
		<input type = 'text' name = 'findStr' value = '${param.findStr}'/>
		<input type = 'text' name = 'findStr' value = '<%=findStr %>'/>
		<input type = 'submit'/>
	</form>
</body>
</html>

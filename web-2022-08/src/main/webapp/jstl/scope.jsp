<%@page import="student.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/scope.jsp</title>
</head>
<body>
<%
	StudentVo vo = new StudentVo();
	vo.setId("a0001");
	vo.setName("hong");
	vo.setPhone("010-1111-1111");
	
	request.setAttribute("vo", vo);
%>

<ul>
	<li>id : ${vo.id}</li>
	<li>Name : ${vo.name}</li>
	<li>Phone : ${vo.phone}</li>
</ul>

</body>
</html>
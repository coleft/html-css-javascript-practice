<%@page import="student.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/param_scope.jsp</title>
</head>
<body>

<%

	StudentVo vo = new StudentVo();
	vo.setName(request.getParameter("name"));	//여기서 쓰고 있지만, 컨트롤단임.
	vo.setAddress(request.getParameter("address"));
	vo.setPhone("010-7777-9292");

	request.setAttribute("vo", vo);

%>

	<h2>param+scope</h2>
	<form name = 'frm' method = 'post'>
		<span>성명</span>
		<input type = 'text' name = 'name' value = '${param.name}' /><br/>
		<span>주소</span>
		<input type = 'text' name = 'address' value = '${param.address}' />
		<br/>
		<input type = 'submit' value = '전송'/>
	</form>
	<hr/>
	<div>
		<ul>
			<li>Name : ${vo.name} </li>			<!-- 필드명 아니라 name, address, phone은 게터입니다. -->
			<li>Address : ${vo.address} </li>
			<li>Phone : ${vo.phone} </li>
		</ul>
	</div>
</body>
</html>

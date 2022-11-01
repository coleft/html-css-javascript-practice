<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/useBean_result.jsp</title>
</head>
<body>
<h3>useBean 태그를 사용하지 않는 경우</h3>
<%
String irum = request.getParameter("irum");
String address = request.getParameter("address");
%>
<ul>
	<li>IRUM : <%=irum %></li>
	<li>Address : <%=address %></li>
</ul>
<h3>useBean태그를 사용한 경우</h3>
<jsp:useBean id = 'vo' class = "jsp.BeanTestVo"/>
<jsp:setProperty property="*" name="vo"/>
<ul>
	<li>IRUM : <%=vo.getIrum() %></li>
	<li>Address : <%=vo.getAddress() %></li>
</ul>
</body>
</html>
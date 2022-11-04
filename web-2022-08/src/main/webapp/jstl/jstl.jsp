<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/jstl.jsp</title>
</head>
<body>
<h3>c:out</h3>
<c:out value="kang e.s."/><br/>
<c:out value="<h2>hi</h2>" /><br/>
<c:out value="<h2>hi</h2>" escapeXml="false"/><br/>
<h3>c:set</h3>
<c:set var = 'id' value = 'a001'/>
=> id : ${pageScope.id}, ${id}
<br/>
<c:set var='phone' value = '010-3333-3333' scope='request'/>
=> phone : ${pageScope.phone}, ${requestScope.phone}
<br/>
<%
	String phone = (String)request.getAttribute("phone");
	out.print(phone);
%>
<h2>c:remove</h2>
<c:remove var='phone' scope='request'/>
<br/>
After : ${requestScope.phone }...

<br/>

<h2>c:if</h2>
<c:set var='n1' value = '100'/>
<c:set var='n2' value = '200'/>
<c:if test = "${n1<n2}">n1이 n2보다 작음</c:if>

</body>
</html>


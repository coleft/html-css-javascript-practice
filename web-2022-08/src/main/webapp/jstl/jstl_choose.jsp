<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/jstl_choose.jsp</title>
</head>
<body>
<%
	int v = 80;
	request.setAttribute("v", v);
%>
<div style = 'border: 3px solid #00f;padding:10px;'>
	당신의 성적은 ${v } 이며, 등급은
	<c:choose>
		<c:when test='${v ge 90 }'>최우수</c:when>
		<c:when test='${v ge 80 }'>우수</c:when>
		<c:when test='${v ge 70 }'>상</c:when>
		<c:otherwise>중</c:otherwise>
	</c:choose>
	등급 입니다.
</div>


</body>
</html>
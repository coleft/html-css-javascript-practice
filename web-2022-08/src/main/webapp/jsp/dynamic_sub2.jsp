<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));	//request로 받은 파라미터는 무조건 문자열이다.
	for(int i = 1; i<10; i++){
		int r = dan*i;
		out.print(r + " ");
	}
%>
</body>
</html>
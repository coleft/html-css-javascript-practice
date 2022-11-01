<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/useBean2_result</title>
</head>
<body>
<h3>useBean태그를 사용하지 않는 경우</h3>
<%
	String id = request.getParameter("id");
	int kor =  Integer.parseInt(request.getParameter("kor"));
	int eng =  Integer.parseInt(request.getParameter("eng"));
	int mat =  Integer.parseInt(request.getParameter("mat"));
	int tot =  kor+eng+mat;
	double avg = (tot/3.0);
%>
<ul>
	<li>ID : <%=id %></li>
	<li>KOR : <%=kor %></li>
	<li>ENG : <%=eng %></li>
	<li>MAT : <%=mat %></li>
	<li>총점 : <%=tot %></li>
	<li>평균 : <%=avg %></li>
</ul>
<h3>useBean태그를 사용하는 경우</h3>
<jsp:useBean id = 'vo' class = "jsp.BeanTestVo2"/>
<jsp:setProperty property="*" name="vo"/>
<ul>
	<li>ID : <%=vo.getId() %></li>
	<li>KOR : <%=vo.getKor() %></li>
	<li>ENG : <%=vo.getEng() %></li>
	<li>MAT : <%=vo.getMat() %></li>
	<li>총점 : <%=vo.getTot() %></li>
	<li>평균 : <%=vo.getAvg() %></li>
</ul>
</body>
</html>
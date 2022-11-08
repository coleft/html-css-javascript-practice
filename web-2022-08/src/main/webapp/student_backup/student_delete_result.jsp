<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "pageVo" class = "student.Page"/>
<jsp:setProperty property="*" name = "pageVo"/>

<jsp:useBean id = "sVo" class = 'student.StudentVo' />
<jsp:setProperty property="*" name = "sVo"/>
	
<form name = 'frm' method = 'post'>
	<input type = 'text' name = 'findStr' value = "<%=pageVo.getFindStr()%>"/>
	<input type = 'text' name = 'nowPage' value = "<%=pageVo.getNowPage()%>"/>
</form>
	
<%
StudentDao dao = new StudentDao();
boolean b = dao.delete(sVo);
%>

<%if( !b ){ %>
	<script>
		alert('자료 저장 중 오류 발생');		
	</script>	
<% } %> 

	<script>
		var frm = document.frm;
		frm.action = "index.jsp?inc=student/student_list.jsp";
		frm.submit();		
	</script>

</body>
</html>
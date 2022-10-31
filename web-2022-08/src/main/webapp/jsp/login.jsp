<%@page import="jdbc.Login"%>
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
	if(request.getMethod().equals("POST")){
		String mId = request.getParameter("mId");
		Login l = new Login();
		boolean b = l.login(mId, "");
		if(b){ 
			session.setAttribute("mId", mId);	//세션에 값 넣고
			session.setMaxInactiveInterval(5);
		}else{
			out.print("<script>alert('꺼지셈~')</script>");
		}
	}	
	String sessionId = (String)session.getAttribute("mId");
%>
	<form name = 'frm_login' method = 'post'>
	<%if(sessionId == null){ %>
		<span>아이디</span>
		<input type = 'text' name = 'mId' value = 'hong'/>
		<span>암호</span>
		<input type = 'password' name = 'pwd' value = '1111'/>
		<input type = 'button' value = '로그인' name = 'btnLogin'/>
	<%}else{ %>
		<span><%=sessionId %> 방가</span>
		<input type = 'button' value = '로그아웃' name = 'btnLogout'/>
	<%} %>
	</form>
	
<script>
var frm = document.frm_login;

if(frm.btnLogin != null){	//아래까지 if 가 없는 경우?? 로그아웃 화면에서 btnLogin이 없는데....???
	frm.btnLogin.onclick = function(){
		frm.action = "login.jsp";
		frm.submit();
	}
}
if(frm.btnLogout != null){
	frm.btnLogout.onclick = function(){
		frm.action = "logout.jsp";
		frm.submit();
	}
}
</script>
	
</body>
</html>
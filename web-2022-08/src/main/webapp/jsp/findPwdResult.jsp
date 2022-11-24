<%@page import="jdbc.FindPwd"%>
<%@page import="jdbc.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id = 'login_result_body' onload="sendMail()">
<%
String mId = request.getParameter("mId");
String email = request.getParameter("email");
FindPwd fp = new FindPwd();
String pwd = fp.findPwd(mId, email);

System.out.println(pwd);

%>

 <form name='form_mail' method='post'>
   <label>수 신</label><input type='text' name='receiver' value="su0328bi@naver.com"><br/>
   <label>제 목</label><input type='text' name='subject'  value="방가..."><br/>
   <div class='content'>
   <label>내 용</label><textarea rows="5" cols="60" name="content"><%=pwd %></textarea>
   <input type='hidden' name='sender'>
   </div>
   <hr/>
 </form> 
<script>
 var frm = document.form_mail;
 function sendMail(){
  frm.sender.value="su0328bi@naver.com";
  frm.action='./SendNaverServlet.do';
  frm.submit();
 }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>jsp/application.jsp</title>
   </head>
   <body>
      <%
      // 어플리케이션 영역에 저장된 접속자를 가져옴.
      Object o = application.getAttribute("cnt");
      int cnt=1;
      if(o==null){ //방문자가 없는 경우
         cnt = 1;
      }else {
         cnt = (Integer) o;
         cnt ++;
      }
      application.setAttribute("cnt", cnt);
      %>
      <b>오늘 방문자수 : <%=cnt %></b>
   </body>
</html>
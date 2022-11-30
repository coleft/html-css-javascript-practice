<%@page import="member.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.MyFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mybatis/mybatis_test.jsp</title>
</head>
<body>
<h2>mybatis test</h2>
<%

JSONArray array = new JSONArray();
SqlSession sqlSession = MyFactory.getFactory().openSession(); //멤버요소 전부 가져옴
List<MemberVo> list = sqlSession.selectList("member.select", "1");//h가 member의 parameter에 들어감. resultset rs.next안해줘도됨

for(MemberVo vo : list){
   out.print("<li>" + vo.getName());
   out.print("<li>" + vo.getPhone());
   out.print("<li>-------------------------------");
}



%>
</body>
</html>
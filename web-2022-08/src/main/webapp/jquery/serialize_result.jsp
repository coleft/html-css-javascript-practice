<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] hobby = request.getParameterValues("hobby");
JSONObject obj = new JSONObject();
JSONArray array = new JSONArray();	//hobby값 저장

obj.put("name", request.getParameter("name"));
obj.put("gender", request.getParameter("gender"));
obj.put("msg", "서버에 잘 저장되었습니다.");



/* array = new JSONArray(Arrays.asList(hobby)); */

for(String h : hobby){
	array.add(h);
}

obj.put("hobby", array);
out.print(obj.toJSONString());
%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* JSON은 태그 다 없애야해 안그러면 파싱에러가 뜬다. */

/* file name : ajax/theater.jsp */

/* 지역에 따른 상영관을 JSONArray로 반환 */
JSONArray theater = new JSONArray();
String city = request.getParameter("city");
System.out.println(city);
switch(city){
case "서울":
	theater.add("서울 극장 A");
	theater.add("서울 극장 B");
	theater.add("서울 극장 C");
	theater.add("서울 극장 D");
	theater.add("서울 극장 E");
	break;
case "부산":
	theater.add("부산 극장 A");
	theater.add("부산 극장 B");
	theater.add("부산 극장 C");
	theater.add("부산 극장 D");	
	break;
case "대구":
	theater.add("대구 극장 A");
	theater.add("대구 극장 B");
	break;
}

out.print(theater.toJSONString());

%>
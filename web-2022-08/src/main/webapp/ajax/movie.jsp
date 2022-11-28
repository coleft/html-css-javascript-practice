<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* JSON은 태그 다 없애야해 안그러면 파싱에러가 뜬다. */
/* file name : ajax/movie.jsp */
/* 상영관에 따른 영화제목을 JSONArray로 반환 */

JSONArray movie = new JSONArray();
String theater = request.getParameter("theater");
System.out.println(theater);
switch(theater){
case "서울 극장 A":
case "부산 극장 A":
case "대구 극장 A":
	movie.add("영화제목 1");
	movie.add("영화제목 2");
	break;
case "서울 극장 B":
case "부산 극장 B":
	movie.add("영화제목 3");
	movie.add("영화제목 4");
	break;
case "서울 극장 C":
case "부산 극장 C":
	movie.add("영화제목 5");
	movie.add("영화제목 6");	
	break;
case "서울 극장 D":
	movie.add("영화제목 7");
	movie.add("영화제목 8");	
	break;	
case "서울 극장 E":
	movie.add("영화제목 9");
	movie.add("영화제목 10");	
	break;
}

out.print(movie.toJSONString());

%>
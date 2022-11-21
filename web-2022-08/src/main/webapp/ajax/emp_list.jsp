<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String findStr = request.getParameter("findStrEmp");
	Connection conn = new DBConn().getConn();
	PreparedStatement ps = null;
	ResultSet rs = null;
	JSONArray jsonArray = new JSONArray();
	
	String sql = " select employeeNumber, lastName, phone, email " 
				+ " from employees join offices "
				+ " on employees.officeCode = offices.officeCode "
				+ " where employeeNumber like ? or lastName like ? ";
	ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ps.setString(2, "%" + findStr + "%");
	
	rs = ps.executeQuery();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("employeeNumber", rs.getString("employeeNumber"));
		obj.put("lastName", rs.getString("lastName"));
		obj.put("phone", rs.getString("phone"));
		obj.put("email", rs.getString("email"));
		
		jsonArray.add(obj);
	}
	out.print(jsonArray.toJSONString());	
%>
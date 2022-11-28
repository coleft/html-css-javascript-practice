<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String customerName = request.getParameter("customerName");
	String phone = request.getParameter("phone");
	
	Connection conn = new DBConn().getConn();
	PreparedStatement ps = null;
	ResultSet rs = null;
	JSONArray jsonArray = new JSONArray();
	
	String sql = " select customerNumber, customerName, phone, addressLine1 " 
				+ " from customers "
				+ " where customerName like ? or phone like ? ";
	ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + customerName + "%");
	ps.setString(2, "%" + phone + "%");
	
	rs = ps.executeQuery();
	while(rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("customerNumber", rs.getString("customerNumber"));
		obj.put("customerName", rs.getString("customerName"));
		obj.put("phone", rs.getString("phone"));
		obj.put("addressLine1", rs.getString("addressLine1"));
		
		jsonArray.add(obj);
	}
	
	out.print(jsonArray.toJSONString());		
%>







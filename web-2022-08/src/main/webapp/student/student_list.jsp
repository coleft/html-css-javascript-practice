<%@page import="student.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_list</title>
		<link rel = 'stylesheet' href = 'css/student_list.css'>
		<script defer src = 'js/student.js'></script>
	</head>
	<body>
	<jsp:useBean id = "pageVo" class = "student.Page"/>
	<jsp:setProperty property = "*" name = "pageVo"/>
	<%
	StudentDao dao = new StudentDao();
	List<StudentVo> list = dao.select(pageVo);
	%>
	
		<form id = "table" name = 'frm_search' method = 'post'>
			<h1>학생정보 조회</h1>		
			<div id = studentSearch>
				<input type = "button" value = "입력" name = 'btnInsert' />
				<input type = "search" name = 'findStr' value = "<%=pageVo.getFindStr()%>"/>
				<input type = "button" value = "조회" name = 'btnSelect'/>
				<input type='text' name = 'nowPage' value = "<%=pageVo.getNowPage()%>"/>
				<!-- <input type = 'text' name = 'id'/> -->
			</div>
		</form>
		<div id = "r1">
			<span class = "c1">No</span>
			<span class = "c2">아이디</span>
			<span class = "c3">성명</span>
			<span class = "c4">성별</span>
			<span class = "c5">연락처</span>
			<span class = "c6">주소</span>
			<span class = "c7">이메일</span>
			<span class = "c8">우편번호</span>
		</div>	
		<% for(int i=0; i<list.size(); i++){
			StudentVo v = list.get(i);
		%>
         <div class='item' onclick = "view('<%=v.getId()%>')">
            <span class='c1'><%=i+1 %></span>
            <span class='c2'><%=v.getId() %></span>
            <span class='c3'><%=v.getName() %></span>
            <span class='c4'><%=v.getGender() %></span>
            <span class='c5'><%=v.getPhone() %></span>
            <span class='c6'><%=v.getAddress() %></span>
            <span class='c7'><%=v.getEmail() %></span>
            <span class='c8'><%=v.getZipcode() %></span>
           </div>
      <%} %>
				
		
		<div id = "bottom_line">
		</div>
		<div class = "pageNumber"><!-- page 이동 버튼 -->
			<%if(pageVo.getStartPage()>1){ %>
				<input type = "button" style="cursor: pointer;" value = "처음" onclick = 'movePage(1)'/>
				<input type = "button" style="cursor: pointer;" value = "이전" onclick = 'movePage(<%=pageVo.getStartPage()-1%>)'/>
			<%} %>
			
			<%for(int i = pageVo.getStartPage(); i<=pageVo.getEndPage(); i++ ){ %>
				<input type = "button" style="cursor: pointer;" value = "<%=i%>" onclick = 'movePage(<%=i%>)'/>
			<%} %>
			
			<%if(pageVo.getTotPage()>pageVo.getEndPage()){ %>
				<input type = "button" style="cursor: pointer;" value = "다음" onclick = 'movePage(<%=pageVo.getEndPage()+1%>)'/>
				<input type = "button" style="cursor: pointer;" value = "끝으로" onclick = 'movePage(<%=pageVo.getTotPage()%>)'/>
			<%} %>
		</div>						
	</body>
</html>
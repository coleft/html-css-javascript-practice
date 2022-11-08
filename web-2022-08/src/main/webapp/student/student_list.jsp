<%@page import="student.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_list</title>
		<link rel = 'stylesheet' href = 'css/student_list.css'>
		<script defer src = 'js/student.js'></script>
	</head>
	<body>
	
	<%-- <%
	StudentDao dao = new StudentDao();
	List<StudentVo> list = dao.select(pageVo);
	%> --%> <!-- 컨트롤단이 없어서 MVC에 더 가깝다. -->
	
		<form id = "table" name = 'frm_search' method = 'post'>
			<h1>학생정보 조회</h1>		
			<div id = studentSearch>
				<input type = "button" value = "입력" name = 'btnInsert' />
				<input type = "search" name = 'findStr' value = "${pageVo.findStr }"/>
				<input type = "button" value = "조회" name = 'btnSelect'/>
				<input type='text' name = 'nowPage' value = "${pageVo.nowPage }"/>
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
		
		<%-- <% for(int i=0; i<list.size(); i++){
			StudentVo v = list.get(i);
		%> --%>
		<c:forEach var='v' items='${list }' varStatus='status'>
         <div class='item' onclick = "view('${v.id}')">           
            <span class='c1'>${status.count }</span>
            <span class='c2'>${v.id }</span>
            <span class='c3'>${v.name }</span>
            <span class='c4'>${v.gender }</span>
            <span class='c5'>${v.phone }</span>
            <span class='c6'>${v.address }</span>
            <span class='c7'>${v.email }</span>
            <span class='c8'>${v.zipcode }</span>
           </div>
		</c:forEach>
      <%-- <%} %> --%>

		<div id = "bottom_line">
		</div>
		<div class = "pageNumber"><!-- page 이동 버튼 -->
			<%-- <%if(pageVo.getStartPage()>1){ %> --%>
			<c:if test="${pageVo.startPage>1 }">	
				<input type = "button" style="cursor: pointer;" value = "처음" onclick = 'movePage(1)'/>
				<input type = "button" style="cursor: pointer;" value = "이전" onclick = 'movePage(${pageVo.startPage-1})'/>
			</c:if>
			<%-- <%} %> --%>
			
			
			<c:forEach var='i' begin='${pageVo.startPage }' end='${pageVo.endPage }'>
				<input type = "button" style="cursor: pointer;" value = "${i }" onclick = 'movePage(${i})'/>
			</c:forEach>
			
			<c:if test="${pageVo.totPage gt pageVo.endPage }">
				<input type = "button" style="cursor: pointer;" value = "다음" onclick = 'movePage(${pageVo.endPage+1})'/>
				<input type = "button" style="cursor: pointer;" value = "끝으로" onclick = 'movePage(${pageVo.totPage})'/>
			</c:if>
		</div>						
	</body>
</html>
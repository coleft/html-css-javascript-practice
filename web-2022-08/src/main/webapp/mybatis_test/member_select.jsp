<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = 'stylesheet' href = 'member.css'>
<title>mybatis/member_select.jsp</title>
<script defer src = 'member.js'></script>
</head>
<body>
<div id = 'member'>
	<h2>회원관리</h2>
	<form name = 'frm' method = 'post' class = 'frm'>
		<input type = 'button' value = '입력' class = 'btnInsert'/>
		<input type = 'search' name = 'findStr' />
		<input type = 'button' value = '검색' class = 'btnSearch'/>	
		<input type = 'text' name = 'nowPage' value ='${nowPage }'/>
		<input type = 'text' name = 'id'/>	
	</form>
	<div class = 'items'>
		<div class = 'item_title'>
			<span class = 'no'>NO</span>
			<span class = 'id'>ID</span>
			<span class = 'name'>성명</span>
			<span class = 'gender'>성별</span>
			<span class = 'phone'>연락처</span>
			<span class = 'mdate'>가입일자</span>
		</div>
		<div class = 'item_list' onclick = "view('hong')"/>
			<c:forEach var = 'vo' begin = '1' end = '10'>
				<div class = 'item'>
					<span class = 'no'>${vo }</span>
					<span class = 'id'>ID</span>
					<span class = 'name'>성명</span>
					<span class = 'gender'>성별</span>
					<span class = 'phone'>연락처</span>
					<span class = 'mdate'>가입일자</span>
				</div>
			</c:forEach>
		</div>
		<div class = 'btn_zone'>
			<input type = 'button' value = '맨첨' class = 'btnFirst' onclick = 'move(1)'/>
			<input type = 'button' value = '이전' class = 'btnPrev' onclick = 'move(1)'/>
			
			<c:forEach var = 'i' begin='1' end='5'>
				<input type = 'button' value = '${i }' class = 'btnMove' onclick = 'move(${i})'/>
			</c:forEach>
			
			<input type = 'button' value = '다음' class = 'btnNext' onclick = 'move(10)'/>
			<input type = 'button' value = '맨끝' class = 'btnLast' onclick = 'move(100)'/>
		
			
		</div>
	</div>
</div>
</body>
</html>
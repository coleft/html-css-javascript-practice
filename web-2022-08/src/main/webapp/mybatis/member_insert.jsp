<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer src = 'member.js'></script>
<title>mybatis/member_insert.jsp</title>
</head>
<body>
<div id = 'member'>
	<h2>회원정보입력</h2>
	<form name = 'frm' class = 'frm' method = 'post' enctype = 'multipart/form-data'>
		<label>아이디</label>
		<input type = 'text' name = 'id' value = 'h001'/><br/>
		<label>성명</label>
		<input type = 'text' name = 'name' value = '홍길동'/><br/>
		<label>성별</label>
		<label><input type = 'radio' name = 'gender' value = 'm'/>남자</label>
		<label><input type = 'radio' name = 'gender' value = 'f'/>여자</label>
		<br/>
		<label>연락처</label>
		<input type = 'text' name = 'phone' value = '010-1111-2222'/><br/>
		<label>가입일</label>
		<input type = 'date' name = 'mdate'/><br/>
		<label>프로필 사진</label>
		<input type = 'file' name = 'att'/><br/>
		<input type = 'button' value = '저장' class = 'btnInsertR'/>
		<input type = 'button' value = '취소' class = 'btnSelect'/>
		
		<input type = 'search' name = 'findStr' value = '${pVo.findStr }'/>
		<input type = 'text' name = 'nowPage' value ='${pVo.nowPage }'/>
	</form>
</div>
</body>
</html>
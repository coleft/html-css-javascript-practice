<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer src = 'member.js'></script>
<title>mybatis/member_view.jsp</title>
</head>
<body>
<div id = 'member'>
	<h2>정보수정</h2>
	<form name = 'frm' class = 'frm' method = 'post'>
		<label>아이디</label>
		<input type = 'text' name = 'id' value = '${bVo.id }'/><br/>
		<label>성명</label>
		<input type = 'text' name = 'name' value = '${bVo.name }'/><br/>
		<label>성별</label>
		<label><input type = 'radio' name = 'gender' value = 'm'/>남자</label>
		<label><input type = 'radio' name = 'gender' value = 'f'/>여자</label>
		<br/>
		<label>연락처</label>
		<input type = 'text' name = 'phone' value = '${bVo.phone }'/><br/>
		<label>가입일</label>
		<input type = 'date' name = 'mdate' value = '${bVo.mdate }'/><br/>
		<label>프로필 사진</label>
		<img src = '../upload/${bVo.sysFile }'/>
		<input type = 'button' value = '수정' class = 'btnUpdate'/>
		<input type = 'button' value = '삭제' class = 'btnDeleteR'/>
		<input type = 'button' value = '취소' class = 'btnSelect'/>
		
		<input type = 'text' name = 'findStr' value='${pVo.findStr }'/>
		<input type = 'text' name = 'nowPage' value='${pVo.nowPage }'/>
		<input type = 'text' name = 'delFile' value='${bVo.sysFile }'/>
		
	</form>
</div>
<script>
var gender = '${bVo.gender}';
var frm = $('.frm')[0];
if(gender=='m') frm.gender[0].checked=true;
else			frm.gender[1].checked=true;


</script>
</body>
</html>
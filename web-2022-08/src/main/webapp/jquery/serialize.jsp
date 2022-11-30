<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = '../lib/jquery-3.6.1.min.js'></script>
<title>jquery/serialize.jsp</title>
</head>
<body>
<h3>serialize</h3>
<form id = 'frm'>
	<label>성명</label>
	<input type = 'text' name = 'name' value = '춘향이'/><br/>
	<label>성별</label>
	<label><input type = 'radio' name = 'gender' value = 'm' checked/>남자</label>
	<label><input type = 'radio' name = 'gender' value = 'f' />여자</label>
	<br/>
	<label>취미</label>
	<label><input type = 'checkbox' name = 'hobby' value = '승마' checked/>승마</label>
	<label><input type = 'checkbox' name = 'hobby' value = '활쏘기'/>활쏘기</label>
	<label><input type = 'checkbox' name = 'hobby' value = '달리기'/>달리기</label>
	<label><input type = 'checkbox' name = 'hobby' value = '검술' checked/>검술</label>
	<br/>
	<input type = 'button' value = '전송' id = 'btn'/>
</form>
<fieldset><legend>Serialize Result</legend>
	<div id = 'result'></div>
</fieldset>
<script>
$('#btn').on('click', function(){
	//1) form 태그 안에 있는 항목들 모두 파라미터 작성
	var param = $('#frm').serialize();
	console.log(param);
	$.get('serialize_result.jsp', param, function(data){
		var str = `
			<ul>
				<li>name : \${data.name}</li>
				<li>gender : \${data.gender}</li>
				<li>hobby : \${data.hobby}</li>
				<li>msg : \${data.msg}</li>
			</ul>
		`;
		$('#result').html(str);
	}, 'json')
})
</script>
</body>
</html>
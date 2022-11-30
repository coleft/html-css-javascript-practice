<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<span>단수입력</span>
	<input type = 'text' id = 'dan' value = '5'/>
	<input type = 'button' value = '구구단' id = 'run'/>
	<div class = 'result'>
	</div>
</div>
<script>
	$('#run').on('click', function(){
		var dan = $('#dan').val();
		var dan = document.querySelector('#dan').value;
		$('.result').load('gugudan_result.jsp?dan='+dan);
	})
</script>
</body>
</html>
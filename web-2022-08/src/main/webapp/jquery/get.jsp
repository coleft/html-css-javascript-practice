<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = '../lib/jquery-3.6.1.min.js'></script>
<script>
	//window.onload = function(){}
	$(document).ready(function(){
		var param = "id=hong&pwd=1234&msg=방가...";
		$.get('get_json.jsp', 
				param, 
				function(data){
			console.log('id',  data.id);
			console.log('pwd', data.pwd);
			console.log('msg', data.msg);
			
			   $('#result').html(JSON.stringify(data));
			
		}, 'json')	//json없으면 데이터가 구조화되지 않는다.		
	})
</script>
<title>jquery/get.jsp</title>
</head>
<body>
<div id = 'result'>
	
</div>	
</body>
</html>
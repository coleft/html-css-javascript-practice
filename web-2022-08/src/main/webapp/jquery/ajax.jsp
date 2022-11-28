<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = '../lib/jquery-3.6.1.min.js'></script>
<title>jquery/ajax.jsp</title>
</head>
<body>
<h3>$.ajax를 사용한 파일 로드</h3>
<input type = 'button' value = '$.ajax' id = 'btn'/>
<div id = 'result'></div>
<script>
$(document).ready(function(){
	$('#btn').on('click', function(){
		
		$.ajax({
			'type' : 'POST',
			'url' : 'load_test.jsp111',
			'dataType' : 'html',
			'success' : function(receiveData, status){
				$('#result').text(receiveData);	//append, text, html 등등
				
			},
			'error' : function(xhr, status, error){
				alert(status + "," + error);
			}
			
		})
		
	})
	
	
});
</script>
</body>
</html>
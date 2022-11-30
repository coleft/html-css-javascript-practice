<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = '../lib/jquery-3.6.1.min.js'></script>
<title>jquery/load.jsp</title>
</head>
<body>
<div id = 'load'>
	<input type = 'button' value = '페이지 전체 읽기' id = 'btnFull'/>
	<input type = 'button' value = 'part1만 읽기' id = 'btnPart1'/>
	<input type = 'button' value = 'part2만 읽기' id = 'btnPart2'/>
	
	<div class = 'result'></div>
</div>
<script>

	var $r = $('#load>.result')
	
	$($r).css({
		'background-color' : '#ddd',
		'padding' : '20px',
		'min-height' : '50px'
	})
	
	$('#load>#btnFull').on('click', function(){
		$r.load('load_test.jsp');	//이게 xhr 선언부터 send까지 전부임
	})
	
	$('#load>#btnPart1').on('click',function(){
		$r.load('load_test.jsp #part1');
	})
	
	$('#load>#btnPart2').on('click', function(){
		$r.load('load_test.jsp #part2');
	})
	
</script>	
</body>
</html>
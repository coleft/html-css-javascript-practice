<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CDN형태 -->
<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js" 
integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
crossorigin="anonymous"></script> --><!-- integrity나 crossorigin은 지워도 돼 크게 영향 없다. -->
<script src = '../lib/jquery-3.6.1.min.js'></script>
<script defer src='../js/jquery_main.js'></script>
<link rel = 'icon' href = '../images/favicon.png'/><!-- favicon 패비콘 만들기 -->
<title>jquery/jquery_main.jsp</title>
</head>
<body>
<main>
	<header><a href = jquery_main.jsp'>jQuery Example</a>
	<nav id = 'buttons'>
		<input type = 'button' value = 'load.jsp 불러오기' id = 'btnLoad'/>		
		<input type = 'button' value = 'gugudan.jsp 불러오기' id = 'btnGuGuDan'/>
		<input type = 'button' value = 'GET' id = 'btnGet'/>
		<input type = 'button' value = 'POST' id = 'btnPost'/>
		<input type = 'button' value = '고객정보' id = 'cusInfo'/>
	</nav>
	</header>
	<div id = 'content'>Le' Go!</div>
	<footer></footer>
</main>
</body>
</html>

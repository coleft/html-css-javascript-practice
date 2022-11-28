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
<title>jquery/jquery_main.jsp</title>
</head>
<body>
<main>
	<header>jQuery Example
	<nav id = 'buttons'>
		<input type = 'button' value = 'load.jsp 불러오기' id = 'btnLoad'/>		
		<input type = 'button' value = 'gugudan.jsp 불러오기' id = 'btnGuGuDan'/>
	</nav>
	</header>
	<div id = 'content'>Le' Go!</div>
	<footer></footer>
</main>
</body>
</html>

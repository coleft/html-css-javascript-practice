<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/ajax_test.jsp</title>
<style>
#output>div{
	display : inline-block;
	width : 350px;
	padding : 20px;
	box-sizing : border-box;
	min-height : 250px;
	border : 3px solid #aaa;
	vertical-align : top;
}
#output>#student{
	width : 706px;
	margin-top : 5px;
}
#output>#employee{
	width : 706px;
	margin-top : 5px;
}
#output>#append1{
	width : 706px;
}
#output>#append2{
	width : 706px;
	padding-left : 35px;
}
.movie_items{
	display : inline-block;
	min-height : 180px;
	border-radius : 17px;
	box-shadow : 17px;
}
#region{
	width : 200px;
	font-size : 20px;
	text-align : center;
	background-color : #34fea3;
	padding : 5px;
}
#theaterA{
	width : 200px;
	font-size : 20px;
	text-align : center;
	background-color : #34a3fe;
	padding : 5px;
}
#movieA{
	width : 200px;
	font-size : 20px;
	text-align : center;
	background-color : #fea334;
	padding : 5px;
}
.opt{
	width : 150px;
	height : 120px;
}
</style>
<script defer src = 'ajax_test.js'></script>
</head>
<body>
<h2>Ajax Test</h2>
<input type = 'button' value = 'Load Text File' id = 'btnLoadText'/>
<input type = 'button' value = 'Load Html File' id = 'btnLoadHtml'/>
<input type = 'button' value = 'Load JSP File' id = 'btnLoadJSP'/>
<input type = 'button' value = 'Load Json File' id = 'btnLoadJson'/>
<input type = 'button' value = '학생정보 조회' id = 'btnStudent'/>
<input type = 'button' value = '직원정보 조회' id = 'btnEmployee'/>

<input type = 'button' value = 'Append1' id = 'btnAppend1' />
<input type = 'button' value = 'Append2' id = 'btnAppend2' />

<hr/>
<div id = 'output'>
	<div id = 'text'></div>
	<div id = 'html'></div>
	<div id = 'jsp'></div>
	<div id = 'json'></div>
	<div id = 'student'>
		<div id = 'frm'></div>
		<div id = 'list'></div>
	</div>
	<div id = 'employee'>
		<div id = 'frm_employee'></div>
		<div id = 'list_employee'></div>
	</div>
	
	<div id = 'append1'>
		<div>
			<input type = 'button' id = 'btnInsert' value = '추가'/>
			<input type = 'button' id = 'btnDelete' value = '삭제'/>
		</div>
		<div id = 'appendZone'>
		</div>
	</div>
	<div id = 'append2'>
		<div id = 'region' class = 'movie_items'>
			<span>지역</span><br/>
			<select id = 'city' class = 'opt' size = '3'>
				<option value = '서울'>서울</option>
				<option value = '부산'>부산</option>
				<option value = '대구'>대구</option>
			</select>
		</div>
		<div id = 'theaterA' class = 'movie_items'>
			<span>상영관</span><br/>
			<select id = 'theater' class = 'opt' size = '3'></select>
		</div>
		<div id = 'movieA' class = 'movie_items'>
			<span>영화제목</span><br/>
			<select id = 'movie' class = 'opt' size = '3'></select>
		</div>
	</div>
</div>
</body>
</html>












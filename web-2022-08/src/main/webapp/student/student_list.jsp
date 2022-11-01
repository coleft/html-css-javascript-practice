<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_list</title>
		<link rel = 'stylesheet' href = 'css/student.css'>
	</head>
	<body>
		<h1>학생정보 조회</h1>		
		<div id = "table">
			<div id = studentSearch>
				<input type = "button" value = "입력"
					onclick = "location.href = 'student_input_form.jsp'">
				<input type = "text">
				<input type = "button" value = "조회">
			</div>
			<div id = "r1">
				<span class = "c1">No</span>
				<span class = "c2">아이디</span>
				<span class = "c3">성명</span>
				<span class = "c4">성별</span>
				<span class = "c5">연락처</span>
				<span class = "c6">주소</span>
				<span class = "c7">이메일</span>
				<span class = "c8">우편번호</span>
			</div>			
			<div id = "r2" style="cursor: pointer;"
				onclick = "location.href = 'student_modify.jsp'">
				<span class = "c1">1</span>
				<span class = "c2">a002</span>
				<span class = "c3">kim2</span>
				<span class = "c4">f</span>
				<span class = "c5">9999</span>
				<span class = "c6">서울 강남구 봉은사로111길 5</span>
				<span class = "c7">6666</span>
				<span class = "c8">06083</span>
			</div>
			<div id = "r3" style="cursor: pointer;"
				onclick = "location.href = 'student_modify.jsp'">
				<span class = "c1">2</span>
				<span class = "c2">a003</span>
				<span class = "c3">hong gil</span>
				<span class = "c4">m</span>
				<span class = "c5">9999</span>
				<span class = "c6">서울 금천구 시흥대로 88가길 3</span>
				<span class = "c7">6666</span>
				<span class = "c8">08620</span>
			</div>
			<div id = "r4" style="cursor: pointer;"
				onclick = "location.href = 'student_modify.jsp'">
				<span class = "c1">3</span>
				<span class = "c2">b001</span>
				<span class = "c3">kim</span>
				<span class = "c4">m</span>
				<span class = "c5">010-1111-2222</span>
				<span class = "c6">서울 강남구 강남대로112길 12</span>
				<span class = "c7">kim@jobtc.kr</span>
				<span class = "c8">06120</span>
			</div>
			<div id = "r5" style="cursor: pointer;"
				onclick = "location.href = 'student_modify.jsp'">
				<span class = "c1">4</span>
				<span class = "c2">a010</span>
				<span class = "c3">김씨</span>
				<span class = "c4">m</span>
				<span class = "c5">123456</span>
				<span class = "c6">서울 강남구 봉은사로55길 17</span>
				<span class = "c7">kim@jobtc.kr</span>
				<span class = "c8">06097</span>
			</div>
			<div id = "r6" style="cursor: pointer;"
				onclick = "location.href = 'student_modify.jsp'">
				<span class = "c1">5</span>
				<span class = "c2">a001</span>
				<span class = "c3">김씨</span>
				<span class = "c4">m</span>
				<span class = "c5">123-1234</span>
				<span class = "c6">서울 강북구 삼양로123길 6-8</span>
				<span class = "c7">na@jobtc.kr</span>
				<span class = "c8">01029</span>
			</div>
			<div id = "bottom_line">
			</div>
			<div class = "pageNumber">
				<input type = "button" style="cursor: pointer;" 
				value = "1">
			</div>
		</div>				
	</body>
</html>
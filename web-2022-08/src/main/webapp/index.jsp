<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>웹 프로젝트</title>
		<link rel = 'stylesheet' href = 'css/index.css'>
		<script defer src='js/student.js'></script>
	</head>
	<body>
<%
String inc = "temp.html";
if(request.getParameter("inc")!=null){
	inc = request.getParameter("inc");
}

String sessionId = (String)session.getAttribute("sessionId");
%>
		
		<main class = 'realmain'>
			<div class = 'login'>
			<%if(sessionId == null){ %>
				<a href = 'index.jsp?inc=member/login.jsp' style="color:darkblue;">로그인</a>
			<%}else{ %>
				[<%=sessionId %>님 방가]
				<a href = 'member/logout.jsp' style="color:darkblue;">로그아웃</a>
			<%} %>
			
			</div>
			<header>
				<img src = "images/서울.gif" id='logo' style="cursor:pointer;" onclick="location.href='index.jsp'"/>
				<nav>
					<a href='student.do'>학생관리</a>
					<a href='index.jsp?inc=javascript/score_crud.html'>성적관리</a>
					<a href='index.jsp?inc=javascript/member_control.jsp'>회원관리</a>
					<a href='index.jsp?inc=member/member_control.jsp'>회원관리(II)</a>
					<a href='#'>제품관리</a>
					<a href='#'>생산관리</a>
					<a href='#'>방명록</a>
					<a href='#'>게시판</a>
				</nav>
			</header>
			<div class = 'content'>
				<jsp:include page = "<%=inc%>"/>
			</div>			
			<footer>
				대한민국
			</footer>
		</main>
	</body>
</html>
 
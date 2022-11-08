<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl/formatNumber</title>
</head>
<body>
<h2>formatNumber | parseNumber</h2>
<fmt:formatNumber value='12345.6789' var='su' pattern='#,###,###.##'/>
su = ${su } <br/>
<fmt:formatNumber value='12345.6789' var='su2' pattern='0,000,000.0000000'/>
su = ${su2 } <br/>
<hr/>
<fmt:parseNumber value='${su }' var='nSu' pattern = '#,###,###.##'/>
nSu = ${nSu } <br/>
<fmt:parseNumber value='${su }' var='nSu' pattern = '#,###,###.##' integerOnly = 'true'/>
nSu = ${nSu } <br/>
<fmt:parseNumber value='${su }' var='nSu' pattern = '#######.##' integerOnly = 'true'/>
nSu = ${nSu } <br/>
</body>
</html>
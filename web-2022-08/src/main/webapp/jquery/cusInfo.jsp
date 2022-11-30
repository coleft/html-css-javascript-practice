<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery/post.jsp</title>
</head>
<body>
<h2>POST</h2>
<form name = 'frm' method = 'post'>
	<label>고객명</label>
	<input type = 'text' name = 'customerName' value = 'Signal'/><br/>
	<label>연락처</label>
	<input type = 'text' name = 'phone' value = '40'/><br/>
	<input type = 'button' name = 'btnSend' id = 'btnSend' value = '고객정보조회'/>
</form>
<hr/>
<div id = 'result'></div>
<script>
	$('#btnSend').on('click', function(){
		var param = $('form').serialize();
		$.post('cusInfo_result.jsp', param, function(data){	

			var rst = '<div>';
			for(j of data){
				var temp = `
					<div class = 'row'>
						<span>\${j.customerNumber}</span>
						<span>\${j.customerName}</span>
						<span>\${j.phone}</span>
						<span>\${j.addressLine1}</span>
					</div>
				`;
				rst += temp;
			}
			
			$('#result').html(rst);
			$('.row').css('display', 'table-row');
			$('.row>span').css({
				'display' : 'table-cell',
				'padding' : '0 10px'
			})
			
		}, 'json')
	})
</script>
</body>
</html>
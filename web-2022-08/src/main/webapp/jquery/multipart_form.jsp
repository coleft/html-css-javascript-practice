<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src = '../lib/jquery-3.6.1.min.js'></script>
<title>jquery/multipart_form.jsp</title>
</head>
<body>
<h2>Multipart Form</h2>
<form id = 'frm' enctype = 'multipart/form-data'>
	<label>작성자</label>
	<input type = 'text' name = 'id' value = '홍길자'/>
	<label>첨부파일</label>
	<input type = 'file' name = 'att' multiple = 'multiple'/><br/>
	<input type = 'button' value = '전송' id = 'btnSend'/>
</form>
<fieldset><legend>전송결과</legend>
	<div id = 'result'></div>
</fieldset>
<script>
$('#btnSend').on('click', function(){
	var data = new FormData($('#frm')[0]);
	
	$.ajax({	//맵구조의 특성상 키값의 순서는 상관없다.
		type : 'POST',
		url : 'ajaxFileUpload.do',
		contentType : false,
		processData : false,
		data : data,
		dataType : 'json', /* 수신 데이터의 형식 */
		success : function(receiveData){
			
			var str = '<ul>';
				str += '<li>첨부파일'
					+ 	 '<ol>';
			for(f of receiveData.att){
					str += '<li>' + f + '</li>';
			}
			str += 	  '  </ol>'
				+	'  <li>id : ' + receiveData.id + '</li>'
				+   '  <li>msg :' + receiveData.msg+ '</li>'
				+   '</ul>';
			
			
			$('#result').html(str);
		}
	})
})
</script>
</body>
</html>
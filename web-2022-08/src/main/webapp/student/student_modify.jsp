<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_modify</title>
		<link rel = 'stylesheet' href = '../css/student.css'>
		<script src = '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>		
	</head>
	<body>
		<h2>학생정보 수정</h2>
		<div id = "student_modify.jsp">
			<div>
				<span class = 'cc1'>아이디</span>
				<span class = 'cc2'><input type = "text" size = '18' id='id1'></span>
			</div>
			<div>
				<span class = 'cc1'>성명</span>
				<span class = 'cc2'><input type = "text" size = '14'>
				</span>
			</div>
			<div>
				<span class = 'cc1'>성별</span>
				<span class = 'cc2'>
					<label>
					<input type = "radio" name = "sex" value = "m">
					남자</label>
					<label>
					<input type = "radio" name = "sex" value = "f">
					여자</label>
					</span>
			</div>
			<div>
				<span class = 'cc1'>연락처</span>
				<span class = 'cc2'><input type = "text" size = '14' id='phone1'></span>
			</div>
			<div>
				<span class = 'cc1' id='code1'>우편번호</span>
				<span class = 'cc2'><input type = "text"
						size = '10' id='code2'></span>
				<input type = "button" value = "우편번호 검색" id='code3'/>
			</div>
			<div>
				<span class = 'cc1'>주소</span>
				<span class = 'cc2'><input type = "text" size = '36' id='address1'></span>
			</div>
			<div>
				<span class = 'cc1'>이메일</span>
				<span class = 'cc2'><input type = "text" size = '18' id='email1'></span>
			</div>
			<br/>	
			<div>
				<span class = 'cc1'></span>
				<span class = 'cc2'><input type = "button" id='btn_save' value = "저장">
					  <input type = "button" value = "삭제">
					  <input type = "button" value = "취소"></span>
			</div>
		</div>
		<script>
			let code1 = document.querySelector('#code1');
			let code2 = document.querySelector('#code2');
			let code3 = document.querySelector('#code3');
			let address1 = document.querySelector('#address1');
			
			let btn_save = document.querySelector('#btn_save');
			
			code3.onclick = function(){
				new daum.Postcode({
					onComplete : function(data){
						address1.value=data.address;
						code2.value=data.zonecode;
					}
				}).open();
			}
			
			//아이디 영숫자 + 연락처 패턴 + 이메일 패턴 + 암호와 암호확인 값 동일 체크
			btn_save.onclick = function(){
				let reg_id = /^[a-zA-Z0-9]+$/;
				let str_id = document.querySelector('#id1').value;
				let tf_id = msg(reg_id, str_id);
				
				if(tf_id==false){
					alert("아이디는 영문과 숫자의 조합으로만 부탁드립니다.")
					document.querySelector('#id1').value='';				
				}
				if(str_id.length > 15){
					alert("아이디는 15글자 이내로 작성 부탁드립니다.")
					document.querySelector('#id1').value='';				
				}
				
				let reg_phone = /^\d{2,3}-\d{3,4}-\d{4}$/;
				let str_phone = document.querySelector('#phone1').value;
				let tf_phone = msg(reg_phone, str_phone);
				
				if(tf_phone==false){
					alert("전화번호를 다시 작성해주세요.");
					document.querySelector('#phone1').value='';
				}
				
				let reg_email = /^[a-zA-z]+\w+@[a-zA-z]+(\.\w+){1,2}$/;
				let str_email = document.querySelector('#email1').value;
				let tf_email = msg(reg_email, str_email);
				
				if(tf_email==false){
					alert("이메일을 형식에 맞게 다시 작성해주세요.");
					document.querySelector('#email1').value='';
				}
				
			}
			
			
			
			function msg(reg, str){
				var b = reg.test(str);
				return b;					
			}
			
			
			
			
		</script>
	</body>
</html>
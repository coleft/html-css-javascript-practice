<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>member_control.html</title>
		<link rel='stylesheet' href='css/member_control.css'>
		<script defer src='js/member_control2.js'></script>
		<style>
			#photo_file{
				display:none;
			}
			#photo{
				width:60px;
				height:75px;
				border:2px solid #aaa;
				border-radius:7px;
			}
			#photo:hover{
				cursor:pointer;
			}
			#profile_photo{
				display: inline-block;
			}
			#right_profile{
				display: inline-block;
			}
		</style>
	</head>
	<body class = 'member_control_body'>
		<main class = 'member_control_main'>
			<div class = 'main_title'>
				회원관리 CRUD
			</div>
			<form name = 'frm_member' enctype = 'multipart/form-data' method = 'post' action = 'memberUpload.do'>
				<div id = 'profile_photo'>
					<img src='./test/img/19.PNG' class = 'img' id='photo'/>
					<input type='file' name = 'photo'  id='photo_file' />
					<input type = 'hidden' name = 'delFile' />
				</div>
				<div id = 'right_profile'>
					<span>아이디</span>
					<input type='text' name='id' value='a001'><br/>
					<span>성명</span>
					<input type='text' name='name' value='hong'/><br/>
					<span>성별</span>
					<label><input type='radio' name='gender' value='m'>남자</label>
					<label><input type='radio' name='gender' value='f'>여자</label>
					<br/>
					<span>연락처</span>
					<input type='text' name='phone' value='010-1111-1234'/><br/>
				</div>
				<hr/>
				<span></span>
				<input type = 'button' value='CREATE' name= 'btnAppend' onclick= 'add(this.form)'/>
				<input type = 'button' value='UPDATE' name= 'btnUpdate' onclick= 'update(this.form)'/>
				<input type = 'button' value='DELETE' name= 'btnDelete' onclick= 'deleteFunc(this.form)'/>
			</form>
			<div id = 'list'>
				<form name = 'frmSearch2' method = 'post'>
					<input type = 'text' size = '30' name = 'findStr'/>
					<input type = 'button' value = '검색' name = 'btnFind'/>
				</form>
				<div id = 'title'>
					<span class='id'>아이디</span>
					<span class='name'>성명</span>
					<span class='gender'>성별</span>
					<span class='phone'>전화번호</span>
				</div>
				<div id = 'items'>
					<div class='item'>
					</div>
				</div>
			</div>
		</main>
		<output id = 'message_output'></output>
		<script>
		let btnFile = document.querySelector('#photo_file');		
		let photo = document.querySelector('#photo');
		
		photo.onclick = function(){
			btnFile.click();
		}
		
		btnFile.onchange = function(ev){
			let file = ev.srcElement.files[0];
			let reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload=function(fev){
				let tempImg = new Image();
				tempImg.src = this.result;
				photo.src = tempImg.src;
			}
		}		
	</script>
	</body>
</html>
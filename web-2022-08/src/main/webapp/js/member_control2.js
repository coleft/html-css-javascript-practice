/**
 *	학생관리 CRUD 
 *	작성일 : 2022.08(pwg) 
 */
 
 let data=[
	{'id' : 'a001','name' : 'hong','gender' : 'm', 'phone' : '010-1111-1234'},
	{'id' : 'b001','name' : 'kim','gender' : 'f', 'phone' : '010-2222-3333'},
	{'id' : 'c001','name' : 'lee','gender' : 'f', 'phone' : '010-4444-4444'}	
];

 let frm = document.frm_member;
 let frmSearch2 = document.frmSearch2;
 frmSearch2.btnFind.onclick = list;
 
 function list(){
	 let template;
	 let items = document.querySelector('#items');
	 items.innerHTML = '';
	 
	 var xhr = new XMLHttpRequest();
	 xhr.open('post', 'memberServlet.do?findStr='+frmSearch2.findStr.value);
	 xhr.onreadystatechange = function(){
		if(xhr.status = 200 && xhr.readyState == 4){
			console.log(xhr.responseText);
			
			var data = JSON.parse(xhr.responseText);
			
			for(v of data){	//v는 각각의 배열을 뜻한다.
				template =
			 `
				<div class='item' onclick='view("${v.id}")'>
					<span class='id'>${v.id}</span>
					<span class='name'>${v.name}</span>
					<span class='gender'>${v.gender}</span>
					<span class='phone'>${v.phone}</span>
				</div>
			 `
				items.innerHTML += (template);
			}
			
		}	
	}
	xhr.send(frmSearch);	//위로 옮겨도 될듯 속도차이 
}

//배열에 저장된 id,name,phone,성별을 template에 집어 넣기.
function view(id){
   let img = document.querySelector('.img');
   
   var xhr = new XMLHttpRequest();
   xhr.open('post','memberServlet.do?job=view&id='+id);
   xhr.send();
   xhr.onreadystatechange = function(){
      if(xhr.status==200 && xhr.readyState==4){
         var obj = JSON.parse(xhr.responseText);
         
         frm.reset();
         
         frm.id.value = obj.id;
         frm.name.value = obj.name;
         frm.phone.value = obj.phone;
         if(obj.gender=='m'){
            frm.gender[0].checked=true;
         }else{
            frm.gender[1].checked=true;
         }
      	img.src='./upload/' + obj.sysFile;
      	frm.delFile.value = obj.sysFile;
      }
   }
}

//데이터 추가
function add(frm){
	// console.log(frm.id.value); 여기서 찍을 수 있으면 배열에 넣을 수 있다는 것.
	let gender;
	let items = document.querySelector('#items');
	
	// 성별 체크 유무
	if(!frm.gender[0].checked&&!frm.gender[1].checked){
		alert('성별을 체크해 주세요.');
		return;	//함수 실행을 끊는다.
	}
	
	// 이름 입력 여부 체크
	if(frm.name.value==''){
		alert('성명을 확인해 주세요.');
		frm.name.focus();
		return;
	}
	
	// 연락처 입력 여부 체크
	if(frm.phone.value == ''){
		alert('연락처를 확인해주세요.');
		alert.phone.focus();
		return;
	}
	
	// enctype이 있는 form을 multipart 타입으로 변환
	var fd = new FormData(frm);
	var xhr = new XMLHttpRequest();
	xhr.open('post', 'memberUpload.do');
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState==4){
			msg = xhr.responseText;
			alert(msg);
			document.frmSearch2.btnFind.click();
		}
	}
	xhr.send(fd);	
	
}

function update(frm){
	/*
	let index = data.findIndex(d=>d.id==frm.id.value);
	let g; // 성별
	if(frm.gender[0].checked) g=frm.gender[0].value;
	else g= frm.gender[1].value;	
	if(index>=0){	//수정할 데이터가 있는 경우
		data[index].name = frm.name.value;
		data[index].phone = frm.phone.value;
		data[index].gender = g;
		list();
		alert('데이터가 수정되었습니다.');
	}else{
		alert('수정할 데이터가 없습니다.');
	}
	*/
	// console.log(frm.id.value); 여기서 찍을 수 있으면 배열에 넣을 수 있다는 것.
	
	var yn = confirm("정말 수정?");
	if( !yn ) return;
	
	let gender;
	let items = document.querySelector('#items');
	
	// 성별 체크 유무
	if(!frm.gender[0].checked&&!frm.gender[1].checked){
		alert('성별을 체크해 주세요.');
		return;	//함수 실행을 끊는다.
	}
	
	// 이름 입력 여부 체크
	if(frm.name.value==''){
		alert('성명을 확인해 주세요.');
		frm.name.focus();
		return;
	}
	
	// 연락처 입력 여부 체크
	if(frm.phone.value == ''){
		alert('연락처를 확인해주세요.');
		alert.phone.focus();
		return;
	}
	
	// enctype이 있는 form을 multipart 타입으로 변환
	var fd = new FormData(frm);
	var xhr = new XMLHttpRequest();
	xhr.open('post', 'memberUpload.do?job=update');
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState==4){
			msg = xhr.responseText;
			alert(msg);
			document.frmSearch2.btnFind.click();
		}
	}
	xhr.send(fd);	
}

function deleteFunc(frm){
	/*
		let index = data.findIndex(d=>d.id==frm.id.value);
		if(index>=0){
			data.splice(index,1);
			list();
			frm.id.value='';
			frm.name.value='';
			frm.phone.value='';
			frm.gender[0].checked=false;
			frm.gender[1].checked=false;
		}else{
			alert('삭제할 자료를 찾지 못했다.');
		}
	*/
	
	var yn = confirm("정말 삭제?");
	if( !yn ) return;
	
	var id = frm.id.value;
	var delFile = frm.delFile.value;
	var url = `memberServlet.do?job=delete&id=${id}&delFile=${delFile}`;
	var xhr = new XMLHttpRequest();
	xhr.open('post', url);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState==4){
			var msg = xhr.responseText;
			alert(msg);
			document.frmSearch2.btnFind.click();
		}
	}	
	
}





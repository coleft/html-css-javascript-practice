 /**
 *	성적 CRUD 
 *	작성일 : 2022.08(pwg) 
 */
 let data=[
	{'id' : '2022000001','subject' : '건축학개론', 'grade' : '78'},
	{'id' : '2021000001','subject' : '기초통계학', 'grade' : '48'},
	{'id' : '2022000001','subject' : '경영학개론', 'grade' : '83'},	
];
 let template;
 function list(){
	 let items = document.querySelector('#items');
	 items.innerHTML = '';
	 for(v of data){	//v는 각각의 배열을 뜻한다.
		template =
	 `
		<div class='item' onclick='view("${v.id}")'>
			<span class='id'>${v.id}</span>
			<span class='subject'>${v.subject}</span>			
			<span class='grade'>${v.grade}</span>
		</div>
	 `	
		items.innerHTML += (template);
	}
}
list();




//평균 값 구하기
function avg(){
	const grades = [];	
	for(key in data){
		grades.push(data[key].grade);
	}
	let sum = 0;
	for(i=0;i<grades.length;i++){
		
		sum += parseInt(grades[i]);
	}
	
	document.querySelector('.ffff').innerHTML = sum/grades.length;
}

	
	



//배열에 저장된 id,name,phone,성별을 template에 집어 넣기. 
function view(id){
	let index = data.findIndex(d=>d.id==id);	//~한...(to) //배열 자체의 순서인 것 같다.
	console.log('찾은 위치:', index);
	let frm = document.frm_member;
	frm.id.value = data[index].id;
	frm.subject.value = data[index].subject;
	frm.grade.value = data[index].grade;	
}

//데이터 추가
function add(frm){
	// console.log(frm.id.value); 여기서 찍을 수 있으면 배열에 넣을 수 있다는 것.	
	let v;	
	
	//id 입력 여부 체크
	if(frm.id.value==''){
		alert('id를 입력하시오.');
		frm.id.focus();
		return;
	}
	
	//과목 입력 여부 체크
	if(frm.subject.value==''){
		alert('과목명을 입력하시오.');
		frm.subject.focus();
		return;
	}
	
	//성적 입력 여부 체크
	if(frm.grade.value == ''){
		alert('성적을 입력하시오.');
		alert.grade.focus();
		return;
	}	
	
	console.log(frm.id.value);
		
	//form 값을 {}로 만들어 data에 push한다.
	v={'id' : frm.id.value, 'subject' : frm.subject.value, 
	'grade':frm.grade.value };
	data.push(v);
	list();
}



function update(frm){
	let index = data.findIndex(d=>d.id==frm.id.value);	
	if(index>=0){	//수정할 데이터가 있는 경우
		data[index].subject = frm.subject.value;
		data[index].grade = frm.grade.value;
		list();
		alert('데이터가 수정되었습니다.');
	}else{
		alert('수정할 데이터가 없습니다.');
	}
}



function deleteFunc(frm){
		let index = data.findIndex(d=>d.id==frm.id.value);
		if(index>=0){
			data.splice(index,1);
			list();
			frm.id.value='';
			frm.subject.value='';
			frm.grade.value='';			
		}else{
			alert('삭제할 자료를 찾지 못했다.');
		}
}
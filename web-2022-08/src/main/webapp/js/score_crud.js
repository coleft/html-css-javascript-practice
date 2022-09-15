/**
 * 
 */

let list=[]; //전체 데이터를 저장한 배열
let frm = document.frm;
let item = document.querySelector('.item');
let items = document.querySelector('.items'); 

function Score(serial, id, subject, score){
   this.serial = serial;
   this.id = id;
   this.subject = subject;
   this.score = score;
   this.output = function(){
      let str =`
         <div class='item' onclick='view("${this.serial}")'>
            <span class='serial'>${this.serial}</span>
            <span class='id'>${this.id}</span>
            <span class='subject'>${this.subject}</span>
            <span class='score'>${this.score}</span>
         </div>
      `;
      return str;
   }
}

//시리얼 자동생성
frm.serial.onclick = function(){	
	let random = parseInt(Math.random()*1000);
	frm.serial.value=random;
}

//출력 중복 방지용 임시배열생성
let temp_list = [];

//저장하기
frm.btnSave.onclick = function(){
	let index = list.findIndex(k=>k.serial==frm.serial.value);
	if(index>=0){
		alert('serial number를 재설정하시오.');
		return;
	}
	var a = new Score(frm.serial.value, frm.id.value, frm.subject.value, frm.score.value);		
	list.push(a);
	temp_list.push(a);	
}

//출력하기
frm.btnOutput.onclick = function(){	
	let items = document.querySelector('.items'); 
	for(d of temp_list){
		let str = d.output();
		items.innerHTML += str;
   }
   temp_list=[];
}

//검색
frm.findSerial.onclick = function(){
	let index = list.findIndex(k=>k.serial==frm.serial.value);
	frm.id.value=list[index].id;
	frm.subject.value=list[index].subject;
	frm.score.value=list[index].score;
}

//right에서 선택시 left에 출력
function view(serial){
	let index = list.findIndex(k=>k.serial==serial);
	frm.serial.value = list[index].serial;
	frm.id.value = list[index].id;
	frm.subject.value = list[index].subject;
	frm.score.value = list[index].score;
}

//수정
frm.btnUpdate.onclick = function(){
	let index = list.findIndex(k=>k.serial==frm.serial.value);	
	list[index].id=frm.id.value;
	list[index].subject=frm.subject.value;
	list[index].score=frm.score.value;
	items.innerHTML = [];
	for(d of list){
		let str = d.output();
		items.innerHTML += str;
   }
}

//삭제
frm.btnDelete.onclick = function(){
	let index = list.findIndex(k=>k.serial==frm.serial.value);
	list.splice(index,1);
	items.innerHTML = [];
	for(d of list){
		let str = d.output();  
		items.innerHTML += str;
   }   
}








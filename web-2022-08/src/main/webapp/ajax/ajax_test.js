/**
 *
 */
 
 var btnText = document.querySelector('#btnLoadText');
 var btnHtml = document.querySelector('#btnLoadHtml');
 var btnJsp = document.querySelector('#btnLoadJSP');
 var btnJson = document.querySelector('#btnLoadJson');
 
 var divText = document.querySelector('#text');
 var divHtml = document.querySelector('#html');
 var divJsp = document.querySelector('#jsp');
 var divJson = document.querySelector('#json');
 
 var cnt = 0;
 var btnInsert = document.querySelector('#btnInsert');
 
 btnInsert.addEventListener('click', function(){
	var appendZone = document.querySelector('#appendZone');
	cnt++;
	// 추가할 div를 생성
	var div = document.createElement("div");   // 1)
	div.style.backgroundColor = '#ddd';
	div.style.padding = '5px';
	div.style.marginBottom = '2px';
	
	var txt = document.createElement("input"); // 2)
	txt.setAttribute("type", "text");
	txt.setAttribute("value", "하이" + cnt);
	div.appendChild(txt);
	
	var btn = document.createElement("input");
	btn.setAttribute("type","button");
	btn.setAttribute("value", "삭제"+cnt);	
	div.appendChild(btn);
	btn.addEventListener('click', function(ev){
		var tag = ev.srcElement;
		var parent = tag.parentNode;
		appendZone.removeChild(parent);
	})
	
	appendZone.appendChild(div);
})
 
 /* 삭제 버튼 ---------------------- */
 var btnDelete = document.querySelector('#btnDelete');
 btnDelete.addEventListener('click', function(){
	var appendZone = document.querySelector('#appendZone');
	appendZone.innerHTML = '';
	cnt = 0;
}) 
 
 var btnAppend2 = document.querySelector('#btnAppend2');
 btnText.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();//1)객체 생성
	xhr.open('get', 'data.txt'); //2) 객체 초기화
	xhr.onreadystatechange = function(){// 3)이벤트 핸들러 작성
		//5) 정상적으로 요청하고, 모든 응답정보를 수신 받았을 때
		if(xhr.status == 200 && xhr.readyState == 4){
			divText.innerHTML = xhr.responseText;
		}
	}
	xhr.send();// 4) 서버에게 요청처리
})
 
 btnHtml.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'data.html');
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			divHtml.innerHTML = xhr.responseText;
		}
	}
	xhr.send();
})
 
 btnJsp.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'data.jsp?dan=5');
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState == 4){
			divJsp.innerHTML = xhr.responseText;
		}
	}
	xhr.send();
})
 
 btnJson.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'data_json.jsp');
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			var data = xhr.responseText;
			var json = JSON.parse(data);
			var html = "<ul>" 
					 	+ "<li>id : " + json.id
					 	+ "<li>name : " + json.name
					 	+ "<li>phone : " + json.phone
					 + "</ul>";
			divJson.innerHTML = html;
		}
	}
	xhr.send();
	
})


std = function(){
	var btnSearch = document.querySelector('#btnSearch');
	var divList = document.querySelector('#list');
	
	btnSearch.addEventListener('click', function(){
		var xhr = new XMLHttpRequest();
		var findStr = document.frm.findStr.value;
		xhr.open('get', 'student_list.jsp?findStr=' + findStr);
		xhr.onreadystatechange = function(){
			if(xhr.status==200 && xhr.readyState==4){
				var jsonArray = JSON.parse(xhr.responseText);
				var html = "<div>";
				for(obj of jsonArray){	// in으로 하면 안 나옴
					html += "<div>"
						 + "	<span>" + obj.id + "</span>"
						 + "	<span>" + obj.name + "</span>"
						 + "	<span>" + obj.phone + "</span>"
						 + "	<span>" + obj.address + "</span>"
						 + "</div>";
				}				
				html += "</div>";
				divList.innerHTML = html;
			}
		}
		xhr.send();
	})
}

// 학생 정보 조회
var btnStudent = document.querySelector('#btnStudent');
var frm = document.querySelector('#frm');
var list = document.querySelector('#list');
btnStudent.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'student_form.html');
	xhr.onreadystatechange = function(){
		if(xhr.status==200&&xhr.readyState==4){
			frm.innerHTML = xhr.responseText;
			std();
		}
	}
	xhr.send();
})



emp = function(){	
	var btnSearchEmp = document.querySelector('#btnSearchEmp');
	var divListEmp = document.querySelector('#list_employee');
	btnSearchEmp.addEventListener('click', function(){
		var xhr = new XMLHttpRequest();
		var findStrEmp = document.emp_form.findStrEmp.value;
		xhr.open('get', 'emp_list.jsp?findStrEmp=' + findStrEmp);
		xhr.onreadystatechange = function(){
			if(xhr.status==200 && xhr.readyState==4){
				var jsonArray = JSON.parse(xhr.responseText);
				var html = "<div>";
				for(obj of jsonArray){	// in으로 하면 안 나옴
					html += "<div>"
						 + "	<span>" + obj.employeeNumber + "</span>"
						 + "	<span>" + obj.lastName + "</span>"
						 + "	<span>" + obj.phone + "</span>"
						 + "	<span>" + obj.email + "</span>"
						 + "</div>";
				}
				
				html += "</div>";
				divListEmp.innerHTML = html;
			}
		}
		xhr.send();
	})
}

//직원정보조회
var btnEmployee = document.querySelector('#btnEmployee');
var frm_employee = document.querySelector('#frm_employee');
var list_employee = document.querySelector('#list_employee');
btnEmployee.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'emp_form.html');
	xhr.onreadystatechange = function(){
		if(xhr.status==200&&xhr.readyState==4){
			frm_employee.innerHTML = xhr.responseText;
			emp();
		}
	}
	xhr.send();
})

var theater = document.querySelector("#theater");
var movie = document.querySelector("#movie");
var city = document.querySelector("#city");

city.addEventListener("click", function(){
	var v = city.value;
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'theater.jsp?city=' + v);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200&&xhr.readyState==4){
			var data = JSON.parse(xhr.responseText);
			theater.length = 0;
			for(d of data){
				var op = new Option(d,d); //첫번째가 text
				theater.appendChild(op);
			}
		}
	}
})

theater.addEventListener('click', function(){
	var v = theater.value;
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'movie.jsp?theater=' + v);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){	//전송이 불안전하면 수신받은 데이터 정상이 아닐거야
			movie.length=0;
			var data = JSON.parse(xhr.responseText);
			console.log(data);
			for(d of data){
				var op = new Option(d,d);
				movie.appendChild(op);
			}
		}
	}
})







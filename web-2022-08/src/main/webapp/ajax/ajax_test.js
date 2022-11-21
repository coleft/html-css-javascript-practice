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





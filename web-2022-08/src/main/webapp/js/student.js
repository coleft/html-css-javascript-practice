/**
 * 
 */

 /* 저장버튼 처리 */
 var frmInput = document.frm_input;
 if(frmInput != null){
	frmInput.btnCancel.onclick = function(){
		frmInput.action = 'index.jsp?inc=student/student_list.jsp';
		frmInput.submit();
	}
	
	frmInput.btnSave.onclick = function(){
		frmInput.action = 'index.jsp?inc=student/student_input_result.jsp';
		frmInput.submit();
	}
}

 /* 조회 화면 처리 => 두번째 기능이 매우 중요합니다. */
 var frmSearch = document.frm_search;
 if(frmSearch != null){
	frmSearch.btnInsert.addEventListener('click', function(){
		frmSearch.action = 'index.jsp?inc=student/student_input_form.jsp';
		frmSearch.submit();
	});
	
	frmSearch.btnSelect.onclick = function(){
		frmSearch.action = 'index.jsp?inc=student/student_list.jsp';
		frmSearch.nowPage.value=1;
		frmSearch.submit();
	}	
}

function movePage(nowPage){
	frmSearch.action = 'index.jsp?inc=student/student_list.jsp';
	frmSearch.nowPage.value=nowPage;
	frmSearch.submit();	
}

function view(id){
	frmSearch.action = 'index.jsp?inc=student/student_modify.jsp&id='+id;
	frmSearch.submit();
}

/*
function view(id){
	frmSearch.action = 'index.jsp?inc=student/student_modify.jsp';
	frmSearch.id.value=id;
	frmSearch.submit();
}
*/

/* 상세보기, 수정, 삭제 ---------------------------------------- */
var btnSelect = document.querySelector('#btnSelect');
if(btnSelect != null){
	btnSelect.onclick = function(){
		var frm = document.frm_student;
		frm.action = 'index.jsp?inc=student/student_list.jsp';
		frm.submit();
	}
}



/* 수정----- */
var btnModify = document.querySelector('#btnModify');
if(btnModify != null){
	btnModify.onclick = function(){
		var frm = document.frm_student;
		frm.action = 'index.jsp?inc=student/student_modify_result.jsp';
		frm.submit();
	}
}

var btnDelete = document.querySelector('#btnDelete');
if(btnDelete != null){
	btnDelete.onclick = function(){
		var frm = document.frm_student;
		frm.action = 'index.jsp?inc=student/student_delete_result.jsp';
		frm.submit();
	}
}











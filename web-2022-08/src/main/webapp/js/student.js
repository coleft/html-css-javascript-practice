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


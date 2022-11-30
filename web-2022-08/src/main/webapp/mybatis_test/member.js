/**
 * 	member.js
 */
 
 $('.btnInsert').on('click', function(){	//form을 매개변수로
	var param = $('.frm').serialize();
	$.post('member_insert.jsp', param, function(data){
		$('section').html(data);
	})
})
 
 $('.btnInsertR').on('click', function(){	//form을 매개변수로
	var frm = $('.frm')[0];
	var data = new FormData(frm);
	
	$.ajax({
		type : 'POST', 
		url :  'abc.do',
		data : data,
		contentType : false,
		processData : false,
		success : function(resp){
			$('section').html(resp);
		}
		
	})
})


$('.btnUpdate').on('click', function(){	//form을 매개변수로
	var param = $('.frm').serialize();
	$.post('member_update.jsp', param, function(data){
		$('section').html(data);
	})
})
 
$('.btnUpdateR').on('click', function(){	//form을 매개변수로
	var frm = $('.frm')[0];
	frm.enctype = 'multipart/form-data';
	var data = new FormData(frm);
	
	$.ajax({
		type : 'POST', 
		url :  'abc.do',
		data : data,
		contentType : false,
		processData : false,
		success : function(resp){
			$('section').html(resp);
		}
		
	})
})

$('.btnDeleteR').on('click', function(){	//form을 매개변수로
	var yn = confirm('정말 삭제?');
	if( !yn ) return;
	
	var param = $('.frm').serialize();
	$.post('member_select.jsp', param, function(data){
		$('section').html(data);
	})
})
 
 
 $('.btnSelect').on('click', function(){
	var frm = $('.frm')[0];	
	frm.enctype = '';
	var param = $(frm).serialize();
	$.post('member_select.jsp', param, function(data){
		$('section').html(data);
	})
})
 
 $('.btnSearch').on('click', function(){
	var frm = $('.frm')[0];
	frm.nowPage.value=1;
	
	var param = $(frm).serialize();
	$.post('member_select.jsp', param, function(data){
		$('section').html(data);
	})
})

view = function(id){
	var frm = $('.frm')[0];
	frm.id.value = id;
	var param = $(frm).serialize();
	$.post('member_view.jsp', param, function(data){
		$('section').html(data);
	})
}

move = function(nowPage){
	var frm = $('.frm')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	$.post('member_select.jsp', param, function(data){
		$('section').html(data);
	})
}


























/**
 * 		js/jquery_main.js
 */
 $('*').css('box-sizing', 'border-box');	//구조 바뀐거 보이나 하나만 쓸 때...
 
 $('main').css({	//여러개 쓰려면 중괄호
	'border' : '3px solid #bbb',
	'width' : '1000px',
	'min-height' : '500px',
	'box-shadow' : '3px 3px 5px #999',
	'margin' : '20px auto',
	'position' : 'relative'
})

$('header, footer').css({
	'padding' : '20px',
	'background-color' : '#ddd'
})

$('footer').css({
	'position' : 'absolute',
	'bottom' : '2px',
	'width' : '100%'
})

$('div#content').css('color', '#00f')

//동적으로 바뀔 때만 css를 script로 통제한다.


$('#btnLoad').on('click',function(){
	$('div#content').load('load.jsp')
})

$('#buttons').css({
	'float' : 'right'
})


$('#btnGuGuDan').on('click',function(){
	$('div#content').load('gugudan.jsp')
})

$('#btnGet').on('click', function(){
	$('#content').load('get.jsp');
})

$('nav>#btnPost').on('click', function(){
	$('#content').load('post.jsp');
})

$('nav>#cusInfo').on('click', function(){
	$('#content').load('cusInfo.jsp');
})



/*
var btnLoad = document.querySelector('#btnLoad');
var content = document.querySelector('#content');
btnLoad.addEventListener('click', function(){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'load.jsp');
	xhr.onreadystatechange = function(){
		if(xhr.status == 200 && xhr.readyState == 4){
			content.innerHTML = xhr.responseText;
		}
	}
	xhr.send();
})
*/
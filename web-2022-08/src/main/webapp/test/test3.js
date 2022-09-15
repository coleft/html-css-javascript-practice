/**
 * 
 */
 
 function check(){
	let id = document.querySelector('#id').value;
	let pw = document.querySelector('#pw').value;
	let status='';
		
	if(id=='kim' && pw=='1111'){		
		status += 'pass'
	}else{
		status += 'fail';
	}
	
	document.querySelector('#result').innerHTML = status;
	
	return;		
}


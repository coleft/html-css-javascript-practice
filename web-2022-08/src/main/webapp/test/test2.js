/**
 * 
 */
function com_mult(){
	let integer1 = document.querySelector('#integer1').value;
	let integer2 = document.querySelector('#integer2').value;	
	let x = integer1;	
	while(x<integer2-1){		
		x++
		if(x%3!=0 && x%5!=0){
			console.log(x);
		}
	}
	return;		
}
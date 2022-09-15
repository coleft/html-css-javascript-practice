/**
 * 
 */ 
let pics="";
for(let i=0;i<26;i++){
	pics += "<div class='package'><img class='pic' src='./img/" 
			+ i + ".PNG'></div>"		
}
document.querySelector('#pics').innerHTML = pics;
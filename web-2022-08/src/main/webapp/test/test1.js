/**
 * 
 */
 
 array = [

{ 'name': 'hong1', 'id' : 'a001', 'phone' : '1234' , 'email' : 'a001@abc.kr'},

{ 'name': 'hong2', 'id' : 'a002', 'phone' : '1235', 'email' : 'a002@abc.kr'},

{ 'name': 'hong3', 'id' : 'a003', 'phone' : '1236', 'email' : 'a003@abc.kr'},

{ 'name': 'hong4', 'id' : 'a004', 'phone' : '1237', 'email' : 'a004@abc.kr'},

]

let template;

function list(){
	let items = document.querySelector('#items');	
	for(v of array){	
	template =
 `
	<div class='item'>
		<span class='name'>${v.name}</span>
		<span class='id'>${v.id}</span>
		<span class='phone'>${v.phone}</span>
		<span class='email'>${v.email}</span>
	</div>
 `	
		items.innerHTML += (template);
	}
}

list();
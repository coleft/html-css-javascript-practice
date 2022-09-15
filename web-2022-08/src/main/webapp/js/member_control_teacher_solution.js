/**
 *	이 문서는 member_control에 기반한 mission 풀이임(평균 구하기) 
 */
 
 function list(){
	let items = document.querySelector('#items');
	items.innerHTML = '';
	let tot = 0;
	for(index in data){
		v = data[index];
		template = 
		 `
		<div class='item' onclick='view("${index}")'>
			<span class='id'>${v.id}</span>
			<span class='subject'>${v.subject}</span>			
			<span class='grade'>${v.grade}</span>
		</div>
	 `
	 items.innerHTML += (template);
	 tot += Number(v.score);
	}	
	
	items.innerHTML += (tot/data.length).toFixed(1);
	
}
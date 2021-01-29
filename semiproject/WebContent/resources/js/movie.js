(()=>{
	let list = document.querySelector('.navi');
	let check = 'no';
	
	
	let nationExtendView = ()=>{
		let nation = ['한국','일본','미국','홍콩','영국','프랑스','중국','러시아','독일','스페인'];
		createElement(nation);
	}
	
	let yearExtendView = ()=>{
		let year = ['1950년대','1960년대','1970년대','1980년대','1990년대','2000년대','2010년대','2020년대'];
		createElement(year);
	}
	
	let createElement = (nation)=>{
		let div = document.createElement('div');
		div.className = 'navi-extend-wrapper';
		let ul = document.createElement('ul');
		
		for(let i = 0; i < nation.length; i++){
			let li = document.createElement('li');
			li.className = "navi-extend-list";
			let a = document.createElement('a');
			a.href = location.reload;
			a.innerHTML = nation[i];
			li.appendChild(a);
			ul.appendChild(li);
		}
		div.append(ul);
		list.appendChild(div);
	}
	

	let delView = () =>{
		document.querySelector('.navi-extend-wrapper').outerHTML = '';
	}
	
	document.querySelector('.nation-view').addEventListener('click',()=>{
		
		if(check == 'no'){
			nationExtendView();
			check = 'yes';
		} else {
			delView();
			check = 'no';
		}

	});
	
	document.querySelector('.year-view').addEventListener('click',()=>{
		if(check == 'no'){
			yearExtendView('연도별 조회 테스트');
			check = 'yes';
		} else {
			delView();
			check = 'no';
		}
	});

})();
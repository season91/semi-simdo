document.querySelector('.create-img').addEventListener('click',(event)=>{
	document.querySelectorAll('.profile-img-example').forEach((e)=>{
		if(e.checked){
			let innerImg = document.querySelector('.profile-img>img');
			if(innerImg){
				innerImg.src = '/resources/image/' + e.dataset.url;
			}else{
				innerImg = document.createElement('img');
				innerImg.src = '/resources/image/' + e.dataset.url;
				document.querySelector('.profile-img').appendChild(innerImg);
			};
		};
	})
})

function mySubmit(){
	let userEmail = "${sessionScope.user.userEmail}";
	let headerObj = new Headers();
	headerObj.append('content-type', "application/x-www-form-urlencoded");
	
	fetch("/user/quit.do",{
		method : "post",
		headers : headerObj,
		body : "userEmail="+userEmail
	}).then(response => {
		if(response.ok){
			alert('회원 탈퇴가 완료되었습니다.');
			location.href = "${context}/index.do";
		}else{
			alert('회원 탈퇴 중 에러가 발생했습니다.');
		}
	}).catch(error=>{
		error.alertMessage();
	})
	
}

document.querySelector('.frm_revise').addEventListener('submit',(e)=>{
	let password = document.querySelector('#userPw').value;
	let pwRegExp = /^(?!.*[ㄱ-힣])(?=.*\W)(?=.*\d)(?=.*[a-zA-Z])(?=.{8,})/;
	
	if(password){
		if(!(pwRegExp.test(password))){
			e.preventDefault();
			alert('비밀번호는 숫자,영문자,특수문자 조합의 8글자 이상이어야 합니다.');
			document.querySelector('#userPw').value = '';
		}
	}
	
	let nickname = document.querySelector('#userNm').value;
	let nmRegExp = /^(?=.{0,6}$).*/;
	
	if(!(nmRegExp.test(nickname))){
		e.preventDefault();
		alert('닉네임은 6자 이하여야 합니다.');
		document.querySelector('#userNm').value = '';
	}
	
})

function checkLogin() {
	
	//1) 아이디 5~10글자 이내인지 검사
	 	let uid = document.getElementById("uid").value;
	 	uid = uid.trim();
	 	
	 	if(!(uid.length>=5 && uid.length<=10)){
			 alert("아이디 5~10글자 이내로 입력해 주세요!");
			 document.getElementById("uid").focus();
			 return false;
		 }//if end
	
	
    //2) 비밀번호 4글자이상이면서, 숫자형 기호만 입력
    let passwd=document.getElementById("passwd").value;
	passwd = passwd.trim();
	
	 if(!(passwd.length>=4)){
		 alert("비밀번호 4글자 이상 입력해주세요!");
		 document.getElementById("passwd").focus();
		 return false;
	 }//if end
	
	/* 
	if(isNaN(passwd) || passwd.length<4){
		alert("비밀번호 4글자 이상 입력해주세요!");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	*/
	
	return true;
	
}//checkLogin() end














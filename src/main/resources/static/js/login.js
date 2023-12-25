
function oninputPhone(target) {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

function oninputDate(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '') // 숫자 이외의 문자 제거
        .replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"); // YYYYMMDD를 YYYY-MM-DD 형식으로 변환
}



function checkLogin() {
	
	//1) 아이디 5~10글자 이내인지 검사
	 	let uid = document.getElementById("uid").value;
	 	uid = uid.trim();
	 	
	 	if(!(uid.length>=5 && uid.length<=10)){
	 		 document.getElementById("panel1").innerHTML = "아이디 5~10글자 이내로 입력해 주세요!";
			 document.getElementById("uid").focus();
			 return false;
		 }//if end
	
	
    //2) 비밀번호 4글자이상이면서, 숫자형 기호만 입력
    let passwd=document.getElementById("passwd").value;
	passwd = passwd.trim();
	
	 if(!(passwd.length>=4)){
 		 document.getElementById("panel2").innerHTML = "비밀번호 4글자 이상 입력해주세요!";
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


function findIDCheck() {
	//1) 이름 2글자 이상인지?
 	let uname = document.getElementById("uname").value;
 	uname = uname.trim();
 	
 	if(!(uname.length>1)){
		 document.getElementById("panel1").innerHTML = "이름 2글자 이상 입력해 주세요!";
		 document.getElementById("uname").focus();
		 return false;
	 }//if end

	
    //2)이메일 5글자 이고 '@' 포함하고 있는지?
	 let email = document.getElementById("email").value;
	 email=email.trim();
	 
	 if(email.length<5 || email.contains("@")){
		 document.getElementById("panel2").innerHTML = "이메일 5글자 이상 형식에 맞게 입력해주세요";
		 document.getElementById("email").focus();
	     return false;
	 }//if end


	 //3)생일 8글자 인지?
	 let birth = document.getElementById("birth").value;
	 birth=birth.trim();
	 
	 if(!(birth.length==8)){
		 document.getElementById("panel3").innerHTML = "생일 8글자 입력해주세요";
		 document.getElementById("email").focus();
	     return false;
	 }//if end

	return true;
	
}//findIDCheck() end


function findPasswdCheck() {
	//1) 아이디 2글자 이상인지?
 	let uid = document.getElementById("uid").value;
 	uid = uid.trim();
 	
 	if(!(uid.length>=5 && uid.length<=10)){
 		 document.getElementById("panel1").innerHTML = "아이디 5~10글자 이내로 입력해 주세요!";
		 document.getElementById("uid").focus();
		 return false;
	 }//if end

	
    //2)이메일 5글자 이고 '@' 포함하고 있는지?
	 let email = document.getElementById("email").value;
	 email=email.trim();
	 
	 if(email.length<5 || email.contains("@")){
		 document.getElementById("panel2").innerHTML = "이메일 5글자 이상 형식에 맞게 입력해주세요";
		 document.getElementById("email").focus();
	     return false;
	 }//if end

	return true;
	
}//findIDCheck() end






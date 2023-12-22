
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



function checkSignup() {
	
	//1) 아이디 5~10글자 이내인지 검사
	 	let uid = document.getElementById("uid").value;
	 	uid = uid.trim();
	 	
	 	if(!(uid.length>=5 && uid.length<=10)){
			 alert("아이디 5~10글자 이내로 입력해 주세요!");
			 document.getElementById("uid").focus();
			 return false;
		 }//if end
	
	
    //2)비밀번호 5~10글자 이면 문자,숫자,기호를 포함할 것 얘) dhfdg852@
     let passwd = document.getElementById("passwd").value;
	 passwd=passwd.trim();
	 
	 if(passwd.length<5 || passwd.length>10){
		 alert("비밀번호 5~10글자로 입력해주세요");
		 document.getElementById("passwd").focus();
		 return false;
	 }//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
     let repasswd = document.getElementById("repasswd").value;
	 repasswd=repasswd.trim();
	 
	 if(!(passwd==repasswd)){
		 alert("비밀번호 확인이 일치하지 않습니다");
		 document.getElementById("repasswd").focus();
		 return false;
	 }//if end
    
    
    //4)이름 두글자 이상 인지?
     let mname = document.getElementById("mname").value;
	 mname=mname.trim();
	 
	 if(mname.length<2 || isNaN(mname)==false){
		 alert("이름 2글자 이상 입력해주세요");
		 document.getElementById("mname").focus();
		 return false;
	 }//if end

    //5)이메일 5글자 인지?
	 let email = document.getElementById("email").value;
	 email=email.trim();
	 
	 if(email.length<5){
		 alert("이메일 5글자 이상 입력해주세요");
		 document.getElementById("email").focus();
	     return false;
	 }//if end
	
	return true;
	
}//checkSignup() end







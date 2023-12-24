
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
	
	
	 //1) 이름 두글자 이상 인지?
     let mname = document.getElementById("mname").value;
	 mname=mname.trim();
	 
	 if(mname.length<2 || isNaN(mname)==false){
		 document.getElementById("panel1").innerHTML = "이름 2글자 이상 입력해주세요";
		 document.getElementById("mname").focus();
		 return false;
	 }//if end
	 
	 
	//2)아이디 5~10글자 이내인지 검사
	 	let uid = document.getElementById("uid").value;
	 	uid = uid.trim();
	 	
	 	if(!(uid.length>=5 && uid.length<=10)){
			 document.getElementById("panel2").innerHTML = "아이디 5~10글자 이내로 입력해 주세요!";
			 document.getElementById("uid").focus();
			 return false;
		 }//if end


    //3)이메일 5글자 이고 '@' 포함하고 있는지?
	 let email = document.getElementById("email").value;
	 email=email.trim();
	 
	 if(email.length<5 || email.contains("@")){
		 document.getElementById("panel3").innerHTML = "이메일 5글자 이상 형식에 맞게 입력해주세요";
		 document.getElementById("email").focus();
	     return false;
	 }//if end
	
	
    //4)비밀번호 5~10글자 이면 문자,숫자,기호를 포함할 것 얘) dhfdg852@
     let passwd = document.getElementById("passwd").value;
	 passwd=passwd.trim();
	 
	 if(passwd.length<5 || passwd.length>10){
		 document.getElementById("panel4").innerHTML = "비밀번호 5~10글자로 입력해주세요";
		 document.getElementById("passwd").focus();
		 return false;
	 }//if end
	
	
    //5)비밀번호와 비밀번호확인이 서로 일치하는지?
     let repasswd = document.getElementById("repasswd").value;
	 repasswd=repasswd.trim();
	 
	 if(!(passwd==repasswd)){
		 document.getElementById("panel5").innerHTML = "비밀번호 확인이 일치하지 않습니다";
		 document.getElementById("repasswd").focus();
		 return false;
	 }//if end
    
    

	 

    // 유효성 체크 성공 시
	return true;
	
}//checkSignup() end







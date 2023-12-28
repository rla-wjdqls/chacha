
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

// 우편번호 찾기 찾기 화면을 넣을 element
  var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }

function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("addr2").value = extraAddr;
                  
                  } else {
                      document.getElementById("addr2").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('zipcode').value = data.zonecode;
                  document.getElementById("addr1").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("addr2").focus();

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';

                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);

          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }



function checkSignup() {
	
	 //1) 이름 두글자 이상 인지?
     let uname = document.getElementById("uname").value;
	 uname=uname.trim();
	 
	 if(uname.length<2 || !isNaN(uname)){
		 document.getElementById("panel1").innerHTML = "이름 2글자 이상 입력해주세요";
		 document.getElementById("uame").focus();
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
	 
	 if(email.length<5 || !email.includes("@")){
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
	 
	 if((passwd !==repasswd)){
		 document.getElementById("panel5").innerHTML = "비밀번호 확인이 일치하지 않습니다";
		 document.getElementById("repasswd").focus();
		 return false;
	 }//if end
    
    
     //6)전화번호 11자리 입력했는지 확인
     let tel = document.getElementById("tel").value;
	 tel=tel.trim();
	 
	 if(tel.length!==13){
		 document.getElementById("panel6").innerHTML = "전화번호 11자리 입력해주세요";
		 document.getElementById("tel").focus();
		 return false;
	 }//if end
    
    
     //7)생년월일 8자리 입력했는지 확인
     let birth = document.getElementById("birth").value;
	 birth=birth.trim();
	 
	 if(birth.length!==10){
		 document.getElementById("panel7").innerHTML = "생년월일 8자리 입력해주세요";
		 document.getElementById("birth").focus();
		 return false;
	 }//if end
    
    
    
    // 유효성 체크 성공 시
	return true;
	
}//checkSignup() end




function checkModify() {

    //1)이메일 5글자 이고 '@' 포함하고 있는지?
	 let email = document.getElementById("email").value;
	 email=email.trim();
	 
	 if(email.length<5 || !email.includes("@")){
		 document.getElementById("panel3").innerHTML = "이메일 5글자 이상 형식에 맞게 입력해주세요";
		 document.getElementById("email").focus();
	     return false;
	 }//if end
	
	
    //2)비밀번호 5~10글자 이면 문자,숫자,기호를 포함할 것 얘) dhfdg852@
     let passwd = document.getElementById("passwd").value;
	 passwd=passwd.trim();
	 
	 if(passwd.length<5 || passwd.length>10){
		 document.getElementById("panel4").innerHTML = "비밀번호 5~10글자로 입력해주세요";
		 document.getElementById("passwd").focus();
		 return false;
	 }//if end
	
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
     let repasswd = document.getElementById("repasswd").value;
	 repasswd=repasswd.trim();
	 
	 if((passwd !==repasswd)){
		 document.getElementById("panel5").innerHTML = "비밀번호 확인이 일치하지 않습니다";
		 document.getElementById("repasswd").focus();
		 return false;
	 }//if end
    
    
     //4)전화번호 11자리 입력했는지 확인
     let tel = document.getElementById("tel").value;
	 tel=tel.trim();
	 
	 if(tel.length!==13){
		 document.getElementById("panel6").innerHTML = "전화번호 11자리 입력해주세요";
		 document.getElementById("tel").focus();
		 return false;
	 }//if end
    
       
    
    
    // 유효성 체크 성공 시
	return true;
	
}//checkModify() end








function helpCheck(){ 
	//제목 2글자 이상 입력
	let texttitle=document.getElementById("texttitle").value;//제목 가져오기
	texttitle=texttitle.trim();
    if(texttitle.length<2){
        alert("제목 5글자 이상 입력해 주세요");
        document.getElementById("texttitle").focus(); //제목칸에 커서 생성
        return false; //전송하지 않음
    }//if end
    
    //내용 5글자 이상 입력
	let text=document.getElementById("text").value;
	text=text.trim();                               
	if(text.length<5){
	    alert("내용 5글자 이상 입력해 주세요");
    	document.getElementById("text").focus();    
    	return false;                                 
	}//if end  
	

}//end
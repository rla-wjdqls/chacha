<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
		
		
	<!--비밀번호 맞으면 수정페이지(myInfoModify)로 넘어감 -->
	<div class="container">
	<br><br>
		<h4>회원정보</h4><br>
		<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
		<br><hr><br>
		<div class="container-line">
			<h5>회원 탈퇴 하시려면 비밀번호를 입력하셔야 합니다.<h5>
			<br>
			<form class="withcheck" id="withwcheck" action="myInfoWithdraw" method="POST" onsubmit="return checkWithdraw()" >
				<input type="password" placeholder="비밀번호를 입력해주세요" name="passwd" id="passwd">
				<input type="submit" value="확인" class="login__button">
			</form>
		</div>
		</div>
	</div>

<!-- 본문 끝 -->


<script>

 function checkWithdraw() {
	
    let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	 
	 if(passwd.length<5 || passwd.length>10){
		 alert("비밀번호 5~10글자로 입력해주세요");
		 return false;
	 }//if end
	 
 }//checkWithdraw() end

</script>







<%@ include file="./mypageFooter.jsp" %>      
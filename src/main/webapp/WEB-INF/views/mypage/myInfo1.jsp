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
			<h5>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.<h5>
			<br>
			<form class="modifycheck" id="modifycheck" action="myInfoModify" method="post" onsubmit="return checkModify()" >
				<input type="password" placeholder="비밀번호를 입력해주세요" name="passwd" id="passwd">
				<input type="submit" value="확인" class="login__button">
		</div>
		</div>
	</div>




<!-- 본문 끝 -->


<script>

 function checkModify() {
	
    let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	 
	 if(passwd=='dhfdg852@'){ //세션 아이디 값과 일치하면 true 
		 return true;
	 }//if end
	 
 }//checkModify() end

</script>





<%@ include file="./mypageFooter.jsp" %>      
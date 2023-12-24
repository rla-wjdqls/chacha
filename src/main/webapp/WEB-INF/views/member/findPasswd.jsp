<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
    
<title>findPasswd.jsp</title>

</head>

<body>

  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
      </div>
      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register" id="login-in" action="" method="post" onsubmit="return findPasswdCheck()" >
			<h1 class="login__title">비밀번호 찾기</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid">
          </div>
 	      <span id="panel1" class="panel1"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email">
          </div>
          <span id="panel2" class="panel2"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)" maxlength=8>
          </div>
		  <span id="panel3" class="panel3"></span><!-- 이메일 중복 관련 메세지 -->
			<br>
			<div class="save_id_box">
				<a href="/member/findID" class="login__forgot4">아이디찾기</a>
			</div>
			<input type="submit" value="비밀번호 찾기" class="login__button"/>
			
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>


<script>

function findPasswd() {
	
	
	
}

</script>


	<script src="/js/login.js"></script>
	
	</body>

</html>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
    
<title>findID.jsp</title>

</head>

<!-- 아이디 찾기 성공 시, 결과창으로 이동-->
<!-- 폼 제출 -> 이름, 이메일, 생일 DB 데이터와 일치하는지 확인 -> 아이디 가져오기 -->

<!-- 아이디 찾기 실패 시, alert창 으로 알림 -->

<body>

  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
      </div>
      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register" id="login-in" action="findID" method="post" onsubmit="return findIDCheck()" >
			<h1 class="login__title">아이디 찾기</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="이름" class="login__input" name="uname" id="uname">
          </div>
		  <span id="panel2" class="panel2"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email">
          </div>
          <span id="panel2" class="panel2"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)"  maxlength=8>
          </div>
		  <span id="panel2" class="panel2">아이디 혹은 비밀번호가 일치하지 않습니다.</span><!-- 이메일 중복 관련 메세지 -->
			<br>
			<div class="error_msg">
			<!-- 아이디 혹은 비밀번호가 일치하지 않습니다. <br>입력한 내용을 다시 확인해 주세요.로그인 실패 시 메세지 -->
			</div>
			<div class="save_id_box">
				<a href="/member/findPasswd" class="login__forgot2">비밀번호 찾기</a>
			</div>
			<input type="submit" value="아이디 찾기" class="login__button"/>
			
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>






	<script src="/js/login.js"></script>
	
	</body>
	
</html>






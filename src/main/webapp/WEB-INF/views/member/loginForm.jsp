<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
    
<title>loginForm.jsp</title>

</head>

<body>


 
  <div class="login">
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
      </div>
      <div class="login__forms">
		
		<!--login form -->
		<form action="" class="login__register" id="login-in">
			<h1 class="login__title">로그인</h1>
			<div class="login__box">
				<i class='bx bx-user login__icon'></i> <input type="text"
					placeholder="아이디" class="login__input" name="uid" id="uid" required autofocus>
			</div>
			<div class="login__box">
				<i class='bx bx-lock login__icon'></i> <input type="password"
					placeholder="비밀번호" class="login__input" name="passwd" id="passwd" required>
			</div>
			<br>
			<div class="error_msg">
			<!-- 아이디 혹은 비밀번호가 일치하지 않습니다. <br>입력한 내용을 다시 확인해 주세요.로그인 실패 시 메세지 -->
			</div>
			<br>
			<!-- 아이디 저장 -->
			<div class="save_id_box">
				<span class="form_chk"> 
					<input id="formSaveId" type="checkbox" id="c_id" name="c_id"/> 
					<label for="formSaveId">아이디 저장</label>
				</span> 
				<a href="member/findID" class="login__forgot">아이디/비밀번호 찾기</a>
			</div>
			<!-- // 아이디 저장 -->
					
			<input type="submit" value="로그인" class="login__button"/>


			<!-- sns 로그인 -->
			<!-- 					<div class="sns_login_box">
				<ul class="sns_login_list">		
					<li class="sns_login_item">
						<img src="/img/naver_login.png" alt="naver_login" class="naver_login" > 
					</li>
					<li class="sns_login_item">
						<img src="/img/kakao_login.png" alt="kakao_login" class="kakao_login"> 
					</li>
				</ul>
			</div> -->

			<div class="sns_login_box">
				<div class="sns_login_item">
					<img src="/img/naver_login.png" alt="naver_login"
						class="naver_login">
				</div>
				<div class="sns_login_item">
					<img src="/img/kakao_login.png" alt="kakao_login"
						class="kakao_login">
				</div>
			</div>

			<!-- // sns 로그인 -->
			<br>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>

	<!-- <script src="/js/login.js"></script> -->
	
	</body>

</html>






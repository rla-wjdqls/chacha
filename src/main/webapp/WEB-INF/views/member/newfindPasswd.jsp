<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo">
		<h1></h1>	
      </div>
      <br><br><br>
      <div class="login__forms">
		<!--login form -->
		<form class="login__register" id="login-in" action="newfindPasswdResult" method="post" onsubmit="return findPasswdCheck()" >
			<h1 class="login__title">비밀번호 찾기</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid" required>
          </div>
		  <span id="panel1" class="panel1"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email" required>
          </div>
          <span id="panel2" class="panel2"></span><!-- 이메일 중복 관련 메세지 -->
		  <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)"  maxlength=8 required>
          </div>
		  <span id="panel3" class="panel3"></span><!-- 이메일 중복 관련 메세지 -->
			<br>
			<div class="save_id_box">
				<a href="/member/newfindID" class="login__forgot2">아이디 찾기</a>
			</div>
			<input type="submit" value="비밀번호 찾기" class="login__button"/>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/newsignupForm">회원가입</a></span>
			</div>
		</form>
	</div>
	<br><br><br>



<script src="/js/login.js"></script> 
	


<%@ include file="../footer.jsp" %>      
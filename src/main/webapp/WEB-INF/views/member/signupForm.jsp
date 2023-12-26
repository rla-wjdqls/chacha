<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/signup.css">

    
<title>signupForm.jsp</title>

</head>
<body>
  <div class="signup">
    <div class="signup__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
      </div>
    
      <div class="login__forms">
      
		<!-- signupform -->
        <form class="login__register" id="login-in" method="post" action="insert" onsubmit="return checkSignup()">
          <h1 class="login__title">회원가입</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="이름" class="login__input" name="uname" id="uname" required>
          </div>
		  <span id="panel1" class="panel1"></span><!-- 이름 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid" required>
          </div>
 	      <span id="panel2" class="panel2"></span><!-- 아이디 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email" required>
          </div>
          <span id="panel3" class="panel3"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호" class="login__input" name="passwd" id="passwd" required>
          </div>
          <span id="panel4" class="panel4"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호 확인" class="login__input" name="repasswd" id="repasswd" required>
          </div>
          <span id="panel5" class="panel5"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-phone-call login__icon'></i>
             <!-- 01012345678 입력하면 010-1234-5678 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="전화번호 숫자 11자리" class="login__input" name="tel" id="tel" oninput="oninputPhone(this)" maxlength=13 required>
          </div>
          <span id="panel6" class="panel6"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 숫자 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)" maxlength=8 required>
          </div>
		  <span id="panel7" class="panel7"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-map login__icon'></i>
            <input type="text" placeholder="우편번호(선택)" class="login__input" name="zipcode" id="zipcode" readonly>
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="기본주소(선택)" class="login__input" name="addr1" id="addr1" readonly>
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="나머지 주소(선택)" class="login__input" name="addr2" id="addr2">
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          
          <!--추후 클릭 시 버튼 변경 추   -->
          <input type="button" value="중복확인" class="btn_js_1" onclick="">
          <input type="button" value="중복확인" class="btn_js_2" onclick="">
          <input type="button" value="주소찾기" class="btn_js" onclick="DaumPostcode()">
          
          
     	  <input type="submit" value="회원가입" class="login__button">
          <br>
          <div>
            <span class="login__account login__account--account">이미 계정이 있으신가요?</span>
            <span class="login__signup login__signup--signup" id="sign-in">
            <a href="/member/loginForm">로그인</a></span>
          </div>
        </form>
      </div>
    </div>
   </div>
   
   
   <!-- ----- DAUM 우편번호 API 시작 ----- -->
   
  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  </div>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/js/signup.js"></script>
   
</body>
</html>






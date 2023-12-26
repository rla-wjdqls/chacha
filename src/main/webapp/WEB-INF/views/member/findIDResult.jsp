<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
    
<title>findIDResult.jsp</title>

<style>

.login__register__1 {
  position: absolute;
  margin-bottom: 150px;
  bottom: -5rem;
  width: 460px;
  left: 50%;
  transform: translateX(-50%); /* 가로 방향으로 -50%만큼 이동해서 가운데 정렬 */
  box-sizing: border-box;
  background-color: var(--color-lighten);
  padding: 30px;
  border-radius: 1rem;
  text-align: center;
  box-shadow: 0 8px 20px rgba(35, 0, 77, 0.2);
  animation-duration: 0.4s;
  animation-name: animateLogin;

}

</style>

</head>

<!-- 아이디 찾기 성공 시, 결과창으로 이동-->
<!-- 폼 제출 -> 이름, 이메일, 생일 DB 데이터와 일치하는지 확인 -> 아이디 가져오기 -->

<!-- 아이디 찾기 실패 시, alert창 으로 알림 -->

<body>

  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1 class="h1">그냥 데려가개</h1>	
      </div>
      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register__1" id="login-in" action="findIDResult" method="post" onsubmit="return findIDCheck()" >
			<h1 class="login__title">아이디 확인</h1>
          <div class="login__box">
			<p class="login__input" name="uname" id="uname">회원님의 아이디는 "${uid}" 입니다</p>
          </div>
			<br>
			<div class="save_id_box">
				<a href="/member/findPasswd" class="login__forgot2">비밀번호 찾기</a>
			</div>
			<a href="/member/loginForm"><input type="button" value="로그인" class="login__button"/></a>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>
	</div>




<script src="/js/login.js"></script> 
	
	</body>
	
</html>



<!--비밀번호 찾기 추가-->
<!--로그인 하러가기 추가-->

	






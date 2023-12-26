<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
    
<title>findPasswdResult.jsp</title>

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

<!--추후 임시비밀번호 발급 고려 -->

<body>

  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
      </div>
      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register__1" id="login-in" action="findPasswdResult" method="post" onsubmit="return findPasswdCheck()" >
			<h1 class="login__title">비밀번호 확인</h1>
          <div class="login__box">
          <!--값 있으면 비밀번호 띄어주고 null 혹은 빈 값이면 실패 메시지 띄어줌 -->
			<p class="login__input" name="uname" id="uname">
			<!-- 입력한 정보에 해당하는 아이디값 찾아와서 조건에 따라 결과 확인 -->
			<c:set var="passwd" value="${passwd}" />
			<c:choose>
			    <c:when test="${empty passwd}">
			        일치하는 비밀번호가 없습니다. 다시 시도해 주세요
			    </c:when>
			    <c:otherwise>
			        회원님의 비밀번호는 "${passwd}" 입니다
			    </c:otherwise>
			</c:choose>
			</p>
          </div>
			<br>
			<div class="save_id_box">
				<a href="/member/findID" class="login__forgot2">아이디 찾기</a>
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



<!--아이 찾기 추가-->
<!--로그인 하러가기 추가-->

	

















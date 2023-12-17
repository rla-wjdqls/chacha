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
      <div class="login__img">
        <img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
      </div>
      <div class="login__forms">
<!--         login form -->
        <form action="" class="login__register" id="login-in">
          <h1 class="login__title">Sign In</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="Username" class="login__input">
          </div>
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="text" placeholder="Password" class="login__input">
          </div>
          <a href="#" class="login__forgot">Forgot Password? </a>
          
          <a href="#" class="login__button">Sign In</a>
          
          <div>
            <span class="login__account login__account--account">Don't Have an Account?</span>
            <span class="login__signin login__signin--signup" id="sign-up">Sign Up</span>
          </div>
        </form>
        

   
   <script src="/js/login.js"></script>
   
</body>
</html>






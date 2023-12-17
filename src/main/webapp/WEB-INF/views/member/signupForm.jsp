<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/signup.css">
    
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
          <h1 class="login__title">Create Account</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="Username" class="login__input">
          </div>
          <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="Email" class="login__input">
          </div>
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="text" placeholder="Password" class="login__input">
          </div>
          
          <a href="#" class="login__button">Sign Up</a>
          
          <div>
            <span class="login__account login__account--account">Already have an Account?</span>
            <span class="login__signup login__signup--signup" id="sign-in">Sign In</span>
          </div>
          <div class="login__social">
             <a href="#" class="login__social--icon"><i class='bx bxl-facebook'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-twitter'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-google'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-github'></i></a>
          </div>
        </form>
        
<!--         create account form -->
        <form action="" class="login__create none" id="login-up">
          <h1 class="login__title">Create Account</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="Username" class="login__input">
          </div>
          
          <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="Email" class="login__input">
          </div>
          
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="text" placeholder="Password" class="login__input">
          </div>
          
          <a href="#" class="login__button">Sign Up</a>
          
          <div>
            <span class="login__account login__account--account">Already have an Account?</span>
            <span class="login__signup login__signup--signup" id="sign-in">Sign In</span>
          </div>
          
          <div class="login__social">
             <a href="#" class="login__social--icon"><i class='bx bxl-facebook'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-twitter'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-google'></i></a>
             <a href="#" class="login__social--icon"><i class='bx bxl-github'></i></a>
          </div>
        </form>
      </div>
    </div>
   </div>
   
   <script src="/js/signup.js"></script>
   
</body>
</html>






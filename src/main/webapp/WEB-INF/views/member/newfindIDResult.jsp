<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1 class="h1"></h1>	
      </div>
      

      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register__1" id="login-in" action="newfindIDResult" method="post" onsubmit="return findIDCheck()" >
			<h1 class="login__title">아이디 확인</h1>
          <div class="login__box">
			<p class="login__input" name="uname" id="uname"> 
			<!-- 입력한 정보에 해당하는 아이디값 찾아와서 조건에 따라 결과 확인 -->
			<c:set var="uid" value="${uid}" />
			<c:choose>
			    <c:when test="${empty uid}">
			        일치하는 아이디가 없습니다. 다시 시도해 주세요
			    </c:when>
			    <c:otherwise>
			        회원님의 아이디는 "${uid}" 입니다
			    </c:otherwise>
			</c:choose>
			</p>
          </div>
			<br>
			<div class="save_id_box">
				<a href="/member/newfindPasswd" class="login__forgot2">비밀번호 찾기</a>
			</div>
			<a href="/member/newloginForm"><input type="button" value="로그인" class="login__button"/></a>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/newsignupForm">회원가입</a></span>
			</div>
		</form>
	</div>
	
	




<script src="/js/login.js"></script> 
	


<%@ include file="../footer.jsp" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->

<%
			Cookie[] cookies = request.getCookies();//사용자 PC에 저장된 모든 쿠키값 가져오기
			String c_id = "";
			if(cookies != null){ //쿠키값들이 존재하는지?
				for(int i=0; i<cookies.length; i++){
				   Cookie cookie = cookies[i]; //쿠키 하나씩 가져오기
				   if(cookie.getName().equals("c_id")==true){
					   c_id = cookie.getValue(); //쿠키 변수값 가져오기
				   }//if end
				}//for end
			}//if end
%> 

  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1></h1>	
      </div>
      
      <div class="login__forms">
		<!--login form -->
		<form class="login__register" id="login-in" action="loginProc" method="post" onsubmit="return checkLogin()" >
			<h1 class="login__title">로그인</h1>
			<div class="login__box">
				<i class='bx bx-user login__icon'></i> 
				<input type="text" class="login__input" name="uid" id="uid" value="<%=c_id%>" placeholder="아이디" required autofocus>
			</div>
			<span id="panel1" class="panel1"></span><!-- 이메일 중복 관련 메세지 -->
			<div class="login__box">
				<i class='bx bx-lock login__icon'></i> 
				<input type="password" placeholder="비밀번호" class="login__input" name="passwd" id="passwd" required>
			</div>
			<span id="panel2" class="panel2"></span><!-- 이메일 중복 관련 메세지 -->
			<br>
			<!-- 아이디 저장 -->
			<div class="save_id_box">
			<span class="form_chk"> 
				<label>
					<input type="checkbox" id="c_id" name="c_id" value="SAVE" <%if(!c_id.isEmpty()) {out.print("checked");}%>>&nbsp;ID 저장
				</label>
			</span> 
				<a href="/member/newfindID" class="login__forgot1">아이디찾기</a>
				<a href="/member/newfindPasswd" class="login__forgot2">비밀번호 찾기</a>
			</div>
			<!-- // 아이디 저장 -->
					
			<input type="submit" value="로그인" class="login__button"/>

			<!-- 소셜 로그인 버튼 노출 영역 -->
			<div class="login-container">
			    <div id="naver_id_login"></div>
			    <a id="kakao-login-btn" href="javascript:kakaoLogin()">
			        <img src="/img/kakao_login.png" alt="kakao_login" name="kakao_id_login" class="kakao_id_login" id="kakao_id_login" width="50" height="50">
			    </a>
			</div>
			<br>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>
		</div>
		</div>
		</div>
		
<script src="/js/login.js"></script>


<script>
	 var naver_id_login = new naver_id_login("hT38Ty_ojTPdrxKZegTp", "http://localhost:9095/member/loginForm");
	 var state = naver_id_login.getUniqState();
	 naver_id_login.setButton("green", 1,45);
	 naver_id_login.setDomain("http://localhost:9095/member/loginForm");
	 naver_id_login.setState(state);
	 naver_id_login.init_naver_id_login();
	

	 // 접근 토큰 값 출력 확인
	 //alert(naver_id_login.oauthParams.access_token);
	 
	
	 // 네이버 사용자 프로필 조회
	 naver_id_login.get_naver_userprofile("naverSignInCallback()");

	 <!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
	 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	 function naverSignInCallback() {
	   var s_email = naver_id_login.getProfileData('email');
	   var s_uname = naver_id_login.getProfileData('name');

	   var params = {
	     s_email: s_email,
	     s_uname: s_uname
	   };

	   $.ajax({
	     type: "POST",
	     url: "navercallback",
	     contentType: "application/json; charset=utf-8",
	     data: JSON.stringify(params),
	     dataType: "json",
	  	// 성공 시 처리
	     success: function (result) { // 서버로부터 받은 JSON 결과를 콘솔에 출력
	       console.log(result); // result : "c"

	       if (result.result === 'c') {
	      // 클라이언트 측에서 페이지 이동 처리
	         window.location.href = "http://localhost:9095/"; // 리다이렉트할 URL로 변경
	       } else {
	         alert('로그인 실패..'); 
	       }
	     },
	     // 오류 처리
	     error: function (xhr, status, error) {
	       console.error('서버 오류:', error);
	     }
	   });
	 }
	 
	 
	 //카카오 로그인 시작
	 
	Kakao.init("7497fed553cee5c17ab37c2bd5304c4d"); //자바스크립트 키 입력하여 초기화
  	//Kakao.isInitialized();
  	//console.log(Kakao.isInitialized()); 
	 
  	function kakaoLogin() {
  	// 카카오 로그인 버튼 생성
  	  	Kakao.Auth.login({
  	  	  //container: '#kakao_id_login', // 컨테이너 지정
  	  	  success: function(authObj) {
  	  	    // 로그인 성공 시 처리
  	  	    console.log(authObj);

  	  	    // 사용자 정보를 가져오는 함수 호출
  	  	    getUserInfo();
  	  	  },
  	  	  fail: function(err) {
  	  	    // 로그인 실패 시 처리
  	  	    console.error(err);
  	  	  }
  	  	});

	}

  	// 사용자 정보를 가져오는 함수
  	function getUserInfo() {
  	  Kakao.API.request({
  	    url: '/v2/user/me',
  	    success: function(response) {
  	      console.log(response);
  	      
  		 // 사용자 정보를 서버로 전송
  	     sendUserInfoToServer(response.properties.nickname, response.kakao_account.email);
  	 
  	 	 // alert 창으로 사용자 정보 보여주기
  	      //alert('닉네임: ' + response.properties.nickname + '\n이메일: ' + response.kakao_account.email);
  	    }
  	  });
  	}

	 // 사용자 정보를 서버로 전송하는 함수
	  	function sendUserInfoToServer(nickname, email) {
	  	  var params = {
	  	    s_uname: nickname,
	  	    s_email: email
	  	  };
	
	  	  $.ajax({
	  	    type: "POST",
	  	    url: "kakaocallback", // 실제 서버 엔드포인트로 변경해야 합니다.
	  	    contentType: "application/json; charset=utf-8",
	  	    data: JSON.stringify(params),
	  	    dataType: "json",
	  	    success: function (result) {
	  	      console.log(result);
	
	  	    if (result.result === 'c') {
	  	      // 클라이언트 측에서 페이지 이동 처리
	  	         window.location.href = "http://localhost:9095/"; // 리다이렉트할 URL로 변경
	  	       } else {
	  	         alert('로그인 실패..'); 
	  	       }
	  	     },
	  	     // 오류 처리
	  	     error: function (xhr, status, error) {
	  	       console.error('서버 오류:', error);
	  	     }
	  	   });
	  	 }
	 
	
</script>
	 


<%@ include file="../footer.jsp" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/login.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
<title>loginForm.jsp</title>

<script>

/*
function doNaverLogin() {
    const clientId = 'hT38Ty_ojTPdrxKZegTp';
    const redirectUri = encodeURIComponent('http://localhost:9095/member/navercallback');
    const state = '1234';
    		
    const url = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=' + clientId + 
    		    '&redirect_uri=' + redirectUri + '&state=' + state; 

    window.location.href = url;
}

onclick="javascript:doNaverLogin()"

*/

function doKakaoLogin() {
    const clientId = '86b472b7f7dba25b96f6589488ffca31';
    const redirectUri = encodeURIComponent('http://localhost:9095/member/kakaocallback');
    const response_type = 'code';
    		
    const url = 'https://kauth.kakao.com/oauth/authorize?client_id=' + clientId + 
    		    '&redirect_uri=' + redirectUri + '&response_type=' + response_type; 

    window.location.href = url;
}

</script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body>
  
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
			
			
		    String clientId = "hT38Ty_ojTPdrxKZegTp";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://localhost:9095/member/navercallback", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
		         + "&client_id=" + clientId
		         + "&redirect_uri=" + redirectURI
		         + "&state=" + state;
		    session.setAttribute("state", state);
%> 
  
  <div class="login"> 
  
    <div class="login__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1>그냥 데려가개</h1>	
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
				<a href="/member/findID" class="login__forgot1">아이디찾기</a>
				<a href="/member/findPasswd" class="login__forgot2">비밀번호 찾기</a>
			</div>
			<!-- // 아이디 저장 -->
					
			<input type="submit" value="로그인" class="login__button"/>


			<!-- sns 로그인 -->
			<div class="sns_login_box">
				<div class="sns_login_item">
					 <a href="<%=apiURL%>"><img src="/img/naver_login.png" alt="naver_login" class="naver_login"></a>
				</div>
				<div class="sns_login_item">
					<img src="/img/kakao_login.png" alt="kakao_login" class="kakao_login" onclick="javascript:doKakaoLogin()">
				</div>
			</div>

			<!-- // sns 로그인 -->
			<br>
			<div>
				<span class="login__account login__account--account">계정이 없으신가요?</span> 
				<span class="login__signin login__signin--signup" id="signup"> <a href="/member/signupForm">회원가입</a></span>
			</div>
		</form>

	<script src="/js/login.js"></script>
	<!-- 카카오톡 소셜 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	

	 
  <!-- 네이버아디디로로그인 초기화 Script 
<script type="text/javascript">
	var naver_id_login = new naver_id_login("hT38Ty_ojTPdrxKZegTp", "http://localhost:9095/member/navercallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("http://localhost:9095/member/loginForm.jsp");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>-->
<!-- //네이버아디디로로그인 초기화 Script -->
	
	
	</body>

</html>






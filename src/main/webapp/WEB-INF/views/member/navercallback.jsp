<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<!DOCTYPE html>
<html>
  <head>
    <title>네이버로그인</title>

	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
  <body>
 
callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

<div id="naver_id_login"></div>


<script>


	
	var naver_id_login = new naver_id_login("hT38Ty_ojTPdrxKZegTp", "http://localhost:9095/member/navercallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 1,40);
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

		

	
	
</script>
 
  
  
  	<script>
		//loginForm 스크립
		var naver_id_login = new naver_id_login("hT38Ty_ojTPdrxKZegTp", "http://localhost:9095/");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 1,40); //네이버 로그인 버튼 설정
		naver_id_login.setDomain("http://localhost:9095/member/loginForm"); //상태 토큰 비교를 위한 domain 설정
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	
		
	</script>
  
  
  </body>
</html>



























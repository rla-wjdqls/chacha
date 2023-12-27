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
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
  <body>
 
<%--  <%
 	//네이버 로그인 접근토큰 획득 예제
    String clientId = "hT38Ty_ojTPdrxKZegTp";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "TABoMS2S6U";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:9095/member/navercallback", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    //apiURL=https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&redirect_uri=YOUR_CALLBACK_URL&code=C227xgqSPGITtNFJu3&state=637716244029871198000934319598239885507
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      //System.out.print("responseCode="+responseCode); //responseCode=200
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %> --%>
 


<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">


	var naver_id_login = new naver_id_login("${naverClientID}", "http://localhost:9095/member/navercallback");

	// 접근 토큰 값 출력
	//alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	//naver_id_login.get_naver_userprofile("naverSignInCallback()");
	



	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	//function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
	//	alert(naver_id_login.getProfileData('email'));
	//}

	// 네이버 사용자 프로필 조회
	//naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	

	
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->
  
  
  
  
  </body>
</html>
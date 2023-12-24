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
		  <span id="panel1" class="panel1"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid" required>
			<!-- <span id="panel1"></span>아이디 중복 관련 메세지 -->
          </div>
 	      <span id="panel2" class="panel2"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email" required>
          </div>
          <span id="panel3" class="panel3"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호" class="login__input" name="passwd" id="passwd" required>
          </div>
          <span id="panel4" class="panel4"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호 확인" class="login__input" name="repasswd" id="repasswd" required>
          </div>
          <span id="panel5" class="panel5"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-phone-call login__icon'></i>
             <!-- 01012345678 입력하면 010-1234-5678 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="전화번호 숫자 11자리" class="login__input" name="tel" id="tel" oninput="oninputPhone(this)" maxlength=13 required>
          </div>
          <span id="panel6" class="panel6"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 숫자 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)" maxlength=8 required>
          </div>
		  <span id="panel7" class="panel7"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-map login__icon'></i>
            <input type="text" placeholder="우편번호" class="login__input" name="zipcode" id="zipcode" readonly>
          </div>
          <span id="panel2" class="panel2"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="기본주소" class="login__input" name="addr1" id="addr1" readonly>
          </div>
          <span id="panel2" class="panel2"><!-- 아이디 혹은 비밀번호가 일치하지 않습니다. --></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="나머지 주소(선택 입력 가능)" class="login__input" name="addr2" id="addr2">
          </div>
          
          <!--추후 클릭 시 버튼 변경 추   -->
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
  <script>
      // 우편번호 찾기 찾기 화면을 넣을 element
      var element_wrap = document.getElementById('wrap');

      function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }

      function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("addr2").value = extraAddr;
                  
                  } else {
                      document.getElementById("addr2").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('zipcode').value = data.zonecode;
                  document.getElementById("addr1").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("addr2").focus();

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';

                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);

          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }
  </script>
<!-- ----- DAUM 우편번호 API 종료----- -->




<script src="/js/signup.js"></script>
   
</body>
</html>






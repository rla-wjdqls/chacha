<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>


<!-- 본문 시작 template.jsp 

 - 현재 로그인 중인 ID와 일치하는 수정할 행을 DB에서 가져와서,
	    select * from member where id=?
	    수정폼(memberForm.jsp참조)에 출력     
-->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->

	<div class="container">
		<h4>회원정보 수정</h4><br>
		<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
		 <form class="login__register" id="login-in" method="post" action="memberModify" onsubmit="return checkSignup()">
          <div class="login__box_1">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="이름" class="login__input" name="uname" id="uname" value="${myInfo.uname}" readonly>
          </div>
		  <span id="panel1" class="panel1"></span>
          <div class="login__box_1">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid" value="${myInfo.uid}" readonly>
          </div>
 	      <span id="panel2" class="panel2"></span>
          <div class="login__box_1">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email" value="${myInfo.email}">
          </div>
          <span id="panel3" class="panel3"></span><!-- 이메일 관련 메세지 -->
          <div class="login__box_1">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호" class="login__input" name="passwd" id="passwd" value="${myInfo.passwd}">
          </div>
          <span id="panel4" class="panel4"></span><!-- 비밀번호 관련 메세지 -->
          <div class="login__box_1">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호 확인" class="login__input" name="repasswd" id="repasswd">
          </div>
          <span id="panel5" class="panel5"></span><!-- 비밀번호 확인 관련 메세지 -->
          <div class="login__box_1">
            <i class='bx bx-phone-call login__icon'></i>
             <!-- 01012345678 입력하면 010-1234-5678 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="전화번호 숫자 11자리" class="login__input" name="tel" id="tel" value="${myInfo.tel}" oninput="oninputPhone(this)" maxlength=13>
          </div>
          <span id="panel6" class="panel6"></span><!-- 전화번호 관련 메세지 -->
          <div class="login__box_1">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 숫자 8자리" class="login__input" name="birth" id="birth" value="${myInfo.birth}" oninput="oninputDate(this)" maxlength=8 reeadonly>
          </div>
		  <span id="panel7" class="panel7"></span><!-- 생일 관련 메세지 -->
          <div class="login__box_1">
            <i class='bx bx-map login__icon'></i>
            <input type="text" placeholder="우편번호" class="login__input" name="zipcode" id="zipcode" value="${myInfo.zipcode}" readonly>
          </div>
          <span id="panel2" class="panel2"></span><!-- 공백 -->
          <div class="login__box_1">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="기본주소" class="login__input" name="addr1" id="addr1" value="${myInfo.addr1}" readonly>
          </div>
          <span id="panel2" class="panel2"></span><!-- 공백 -->
          <div class="login__box_1">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="나머지 주소(선택 입력 가능)" class="login__input" name="addr2" value="${myInfo.addr2}" id="addr2">
          </div>
          
          <!--추후 클릭 시 버튼 변경 추   -->
          <!-- <input type="button" value="주소찾기" class="btn_js_1" onclick="DaumPostcode()"> -->
		  <button type="submit" class="btn btn_em" id="btn_sj">수정</button>
		</form>
	</div>
	</div>


<script src="/js/signup.js"></script>

<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
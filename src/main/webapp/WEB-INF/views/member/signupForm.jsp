<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>그냥 데려가개</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    
    <!-- adopt,education,help Stylesheet -->
    <link href="/css/aeh.css" rel="stylesheet">
    
	<link href="/css/signup.css" rel="stylesheet">
    
    <script src="/js/jquery-3.7.1.min.js"></script>
	<script src="/js/jquery.cookie.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <script>
	function logout(){
		alert("로그아웃 되었습니다");
	}//logout() end
   
    </script>
    
    
<style>



        
</style>
    
</head>

<body>

    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div> 

    <nav class="sticky-top p-0">
    <div class="container-fluid bg-dark text-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small>서울 강남구 테헤란로 124 4층</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center">
                    <small class="far fa-clock text-primary me-2"></small>
                    <small>월 - 금 : 09.00 AM - 06.00 PM</small>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center me-4">
                	<form name="chatfrm_header" id="chatfrm_header" method="post" action="/headerChat">
                	<i class="bi-chat-left-dots-fill text-primary me-2" onclick="chat_popup_header()"></i>
                	</form>
                	&nbsp;&nbsp;
                    <small class="fa fa-phone-alt text-primary me-2"></small>
                    <small>+0507-1401-8061</small>
                </div>
             <!-- Check if the user is logged in (assuming "s_Id" is the session attribute) -->
            <c:if test="${not empty sessionScope.s_id}">
                <!-- If logged in, show logout link -->
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="logout" onclick="logout()">로그아웃</a> <!-- Adjust the logout URL accordingly -->
                </div>
            </c:if>
            
            <!-- If not logged in, show login and sign-up links -->
            <c:if test="${empty sessionScope.s_id}">
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="/member/loginForm">로그인</a>  
                </div>
                &nbsp; &nbsp;
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="/member/newsignupForm">회원가입</a>  
                </div>
            </c:if>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg bg-white navbar-light">
        
        <a href="/" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
           <img class="logo" src="/img/logolineye.png" alt="Image" style="width:50px; margin-right:10px;"> <h2 class="m-0">그냥 데려가개</h2>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
               	<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">보호소</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/center/centerinfo" class="dropdown-item">보호소 소개</a>
                        <a href="/center/centerForm" class="dropdown-item">입양 신청</a>
                    </div>
                </div>
                <a href="/service/serviceList" class="nav-item nav-link">봉사활동</a>
                <a href="/education/educationList" class="nav-item nav-link">교육강의</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">반려이야기</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/help/helpList" class="dropdown-item">목격/제보</a>
                        <a href="/adopt/adoptReview" class="dropdown-item">입양 후기</a>
                        <a href="/research/researchList" class="dropdown-item">설문조사</a>
                    </div>
                </div>
               <c:choose>
		    <c:when test="${not empty s_mlevel}">
		        <div class="h-100 d-inline-flex mx-n2">
		            <c:choose>
		                <c:when test="${s_mlevel eq 'a'}">
		                    <div class="nav-item dropdown">
		                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">관리자페이지</a>
		                        <div class="dropdown-menu bg-light m-0">
		                            <a href="/mypage/myList_a" class="dropdown-item">내 활동</a>
		                            <a href="/mypage/myClass" class="dropdown-item">신청내역</a>
		                            <a href="/mypage/memList" class="dropdown-item">회원정보</a>
		                        </div>
		                    </div>
		                </c:when>
		                <c:when test="${s_mlevel eq 'b'}">
		                    <div class="nav-item dropdown">
		                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">파트너페이지</a>
		                        <div class="dropdown-menu bg-light m-0">
		                            <a href="/mypage/myList_b" class="dropdown-item">내 활동</a>
		                            <a href="/mypage/memberClass" class="dropdown-item">신청내역</a>
		                            <a href="/mypage/myInfo1" class="dropdown-item">회원정보</a>
		                        </div>
		                    </div>
		                </c:when>
		                <c:when test="${s_mlevel eq 'c'}">
		                    <div class="nav-item dropdown">
		                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
		                        <div class="dropdown-menu bg-light m-0">
		                            <a href="/mypage/jjimList" class="dropdown-item">내 활동</a>
		                            <a href="/mypage/myClass" class="dropdown-item">신청내역</a>
		                            <a href="/mypage/myInfo1" class="dropdown-item">회원정보</a>
		                        </div>
		                    </div>
		                </c:when>
		                <c:otherwise>
		                    <div class="nav-item dropdown">
		                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
		                        <div class="dropdown-menu bg-light m-0">
		                            <a href="/mypage/jjimList" class="dropdown-item">내 활동</a>
		                            <a href="/mypage/myClass" class="dropdown-item">신청내역</a>
		                            <a href="/mypage/myInfo1" class="dropdown-item">회원정보</a>
		                        </div>
		                    </div>
		                </c:otherwise>
		            </c:choose>
		        </div>
		    </c:when>
		</c:choose>
    </nav>
    
    </nav>
    <script>
	    function chat_popup_header(){ 
			let uid = '<%= (String)session.getAttribute("s_id") %>';
			if(uid == "null"){
				uid = "";
			}
			//alert(uid);
			if(uid.length === 0){
				alert("로그인 후 이용바랍니다");
			}else{
				let form = document.getElementById("chatfrm_header");
				//새로운 창 열기
				let newWindow = window.open("/headerChat", "header_chating", "menubar=no, toolbar=no");
				//폼 보내기
				form.target = "header_chating";
				form.submit();
			}
			
		}
    </script>

  <div class="signup">
    <div class="signup__content">
      <div class="login__logo"><!--추후 로고 추가-->
		<h1></h1>	
      </div>
    
      <div class="login__forms">
      
		<!-- signupform -->
        <form class="login__register" id="login-in" method="post" action="insert" onsubmit="return checkSignup()">
          <h1 class="login__title">회원가입</h1>
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="이름" class="login__input" name="uname" id="uname" required>
          </div>
		  <span id="panel1" class="panel1"></span><!-- 이름 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" class="login__input" name="uid" id="uid" required>
          </div>
 	      <span id="panel2" class="panel2"></span><!-- 아이디 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-at login__icon'></i>
            <input type="text" placeholder="이메일" class="login__input" name="email" id="email" required>
          </div>
          <span id="panel3" class="panel3"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호" class="login__input" name="passwd" id="passwd" required>
          </div>
          <span id="panel4" class="panel4"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호 확인" class="login__input" name="repasswd" id="repasswd" required>
          </div>
          <span id="panel5" class="panel5"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-phone-call login__icon'></i>
             <!-- 01012345678 입력하면 010-1234-5678 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="전화번호 숫자 11자리" class="login__input" name="tel" id="tel" oninput="oninputPhone(this)" maxlength=13 required>
          </div>
          <span id="panel6" class="panel6"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-cake login__icon'></i>
            <!-- YYYYMMDD 입력하면 YYYY-MM-DD 로 출력됨(참고:네이버) -->
            <input type="text" placeholder="생년월일 숫자 8자리" class="login__input" name="birth" id="birth" oninput="oninputDate(this)" maxlength=8 required>
          </div>
		  <span id="panel7" class="panel7"></span><!-- 이메일 중복 관련 메세지 -->
          <div class="login__box">
            <i class='bx bx-map login__icon'></i>
            <input type="text" placeholder="우편번호(선택)" class="login__input" name="zipcode" id="zipcode" readonly>
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="기본주소(선택)" class="login__input" name="addr1" id="addr1" readonly>
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          <div class="login__box">
          	<i class='bx bx-home login__icon'></i>
            <input type="text" placeholder="나머지 주소(선택)" class="login__input" name="addr2" id="addr2">
          </div>
          <span id="panel8" class="panel8"></span><!-- 공백 맞추기용 -->
          
          <!--추후 클릭 시 버튼 변경 추   -->
          <input type="button" value="중복확인" class="btn_js_1" id="btn_js_1">
          <input type="button" value="중복확인" class="btn_js_2" id="btn_js_2">
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
  <script src="/js/signup.js"></script>
	<script>

	
		//6)해당 페이지가 로딩되었을 떄 아이디 중복확인과 관련된 쿠키변수 삭제
		$(function(){
			$.removeCookie("checkID");
			$.removeCookie("checkEmail");
		}); //end
	
		//1)id="btn_js_1" 아이디 중복확인 버튼 클릭했을 때
		$("#btn_js_1").click(function(){
			
			// 1) 입력한 uid 값을 변수에 대입하기
		    let uid = $("#uid").val().trim();
		    
		    // 2) uid가 비어있는지 확인
		    if(uid === ""){
		        $("#panel2").css("color", "red");
		        $("#panel2").text("아이디를 입력해 주세요");
		        $("#uid").focus();
		        return;
		    }

		    // 3) uid 값을 변수에 대입하기
		    let params = "uid=" + uid;
			
			//3)post 방식으로 서버에 요청해서 응답받기
			$.post("idjbcheck", params, checkID, "json"); 
			
		})//click end
	
		
		$("#btn_js_2").click(function(){
			
		    let email = $("#email").val().trim();
		    
		    if(email === ""){
		        $("#panel3").css("color", "red");
		        $("#panel3").text("이메일을 입력해 주세요");
		        $("#email").focus();
		        return;
		    }

		    let params = "email=" + email;
			
			//3)post 방식으로 서버에 요청해서 응답받기
			$.post("emailjbcheck", params, checkEmail, "json"); 
			
		})//click end
		
		
		//4)callback함수
		function checkID(result){
		
			//5)서버에서 응답받은 메세지(result)를 본문의 id=panel에 출력하고, 쿠키변수에 저장
			//  형식) $.cookie("쿠키변수명", 값)
			let count = eval(result.count); //형변환
			if(count==0){
				$("#panel2").css("color", "blue");
				$("#panel2").text("사용 가능한 아이디 입니다");
				$.cookie("checkID", "PASS1"); //아이디중복확인을 했다는 증거. "PASS" 변경 가능 확인안됨
				console.log($.cookie("checkID"));
			}else{
				$("#panel2").css("color", "red");
				$("#panel2").text("중복된 아이디 입니다");
				$("#uid").focus(); //커서생성
			}//if end
		}//checkID() end
		
		
		function checkEmail(result){
			
			let count = eval(result.count); //형변환
			if(count==0){
				$("#panel3").css("color", "blue");
				$("#panel3").text("사용 가능한 이메일 입니다");
				$.cookie("checkEmail", "PASS2");
			}else{
				$("#panel3").css("color", "red");
				$("#panel3").text("중복된 이메일 입니다");
				$("#email").focus(); //커서생성
			}//if end
		}//checkEmail() end
		
		
		function checkSignup() {
			
			 //1) 이름 두글자 이상 인지?
		     let uname = document.getElementById("uname").value;
			 uname=uname.trim();
			 
			 if(uname.length<2 || !isNaN(uname)){
				 document.getElementById("panel1").innerHTML = "이름 2글자 이상 입력해주세요";
				 document.getElementById("uame").focus();
				 return false;
			 }//if end
			 
			 
			//2)아이디 5~10글자 이내인지 검사
			 	let uid = document.getElementById("uid").value;
			 	uid = uid.trim();
			 	
			 	if(!(uid.length>=5 && uid.length<=10)){
					 document.getElementById("panel2").innerHTML = "아이디 5~10글자 이내로 입력해 주세요!";
					 document.getElementById("uid").focus();
					 return false;
				 }//if end


		    //3)이메일 5글자 이고 '@' 포함하고 있는지?
			 let email = document.getElementById("email").value;
			 email=email.trim();
			 
			 if(email.length<5 || !email.includes("@")){
				 document.getElementById("panel3").innerHTML = "이메일 5글자 이상 형식에 맞게 입력해주세요";
				 document.getElementById("email").focus();
			     return false;
			 }//if end
			
			
		    //4)비밀번호 5~10글자 이면 문자,숫자,기호를 포함할 것 얘) dhfdg852@
		     let passwd = document.getElementById("passwd").value;
			 passwd=passwd.trim();
			 
			 if(passwd.length<5 || passwd.length>10){
				 document.getElementById("panel4").innerHTML = "비밀번호 5~10글자로 입력해주세요";
				 document.getElementById("passwd").focus();
				 return false;
			 }//if end
			
			
		    //5)비밀번호와 비밀번호확인이 서로 일치하는지?
		     let repasswd = document.getElementById("repasswd").value;
			 repasswd=repasswd.trim();
			 
			 if((passwd !==repasswd)){
				 document.getElementById("panel5").innerHTML = "비밀번호 확인이 일치하지 않습니다";
				 document.getElementById("repasswd").focus();
				 return false;
			 }//if end
		    
		    
		     //6)전화번호 11자리 입력했는지 확인
		     let tel = document.getElementById("tel").value;
			 tel=tel.trim();
			 
			 if(tel.length!==13){
				 document.getElementById("panel6").innerHTML = "전화번호 11자리 입력해주세요";
				 document.getElementById("tel").focus();
				 return false;
			 }//if end
		    
		    
		     //7)생년월일 8자리 입력했는지 확인
		     let birth = document.getElementById("birth").value;
			 birth=birth.trim();
			 
			 if(birth.length!==10){
				 document.getElementById("panel7").innerHTML = "생년월일 8자리 입력해주세요";
				 document.getElementById("birth").focus();
				 return false;
			 }//if end
		    
			 
			//아이디,이메일 중복확인 했는지?
			let checkID = $.cookie("checkID"); //쿠키변수 값 가져오기
			let checkEmail = $.cookie("checkEmail"); 
			
			if(checkID=="PASS1" && checkEmail=="PASS2"){
			    return true;
			}//if end 

			if(checkID!="PASS1"){
			    $("#panel2").css("color", "green");
			    $("#panel2").text("아이디 중복 확인 해주세요");
			    $("#userid").focus();
			    return false;
			}//if end

			if(checkEmail!="PASS2"){
			    $("#panel3").css("color", "green");
			    $("#panel3").text("이메일 중복 확인 해주세요");
			    $("#useri3").focus();
			    return false;
			}//if end
		    
				
		}//checkSignup() end
		
		
		
		
				
	</script>


 <div class="container-fluid copyright bg-dark text-light py-4 wow fadeIn" data-wow-delay="0.1s" style="margin-top: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                  
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    <a href="#">&copy; ITWILL JAVA 145기 2조</a>, All Right Reserved.
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	
    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    <script src="/js/center.js"></script> 
    
    
</body>
</html>   
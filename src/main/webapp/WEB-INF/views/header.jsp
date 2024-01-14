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
    
    <link rel="stylesheet" href="/css/login.css">
	<!-- <link rel="stylesheet" href="/css/signup.css"> -->
    
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
	.login-container {
	    display: flex; /* Flexbox 사용 */
	    justify-content: space-between; /* 엘리먼트 사이의 공간을 최대한으로 늘림 */
	    align-items: center; /* 엘리먼트를 세로로 가운데 정렬 */
	}
	
	.login__register__1 {
	  position: absolute;
	  margin-bottom: 150px;
	  bottom: -5rem;
	  width: 460px;
	  left: 50%;
	  transform: translateX(-50%); /* 가로 방향으로 -50%만큼 이동해서 가운데 정렬 */
	  box-sizing: border-box;
	  background-color: var(--color-lighten);
	  padding: 30px;
	  border-radius: 1rem;
	  text-align: center;
	  box-shadow: 0 8px 20px rgba(35, 0, 77, 0.2);
	  animation-duration: 0.4s;
	  animation-name: animateLogin;
	
	}
	
	   #naver_id_login {
	       margin-left: 120px; /* 왼쪽 여백을 최대로 늘림 */
	       border-radius: 50%; /* 원형으로 만들기 */
    	   overflow: hidden; /* 원형으로 만들기 */
	   }
	
	   #kakao-login-btn {
	       margin-right: 120px; /* 오른쪽 여백을 최대로 늘림 */
	       width: 55px; /* 원하는 너비로 조정 */
    	   height: 55px; /* 원하는 높이로 조정 */
	       

	   }


	    #researchTable th,
	    #researchTable td {
	        text-align: center; /* 텍스트 가운데 정렬 */
	        vertical-align: middle; /* 수직 가운데 정렬 */
    }
        
</style>
    
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div> 
    <!-- Spinner End -->


    <!-- Topbar Start -->
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
			//let writer = document.getElementById('writer');
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
				//form.method = "post";
				form.submit();
				//alert(writer);
				//alert()
				//document.chatfrm.action="/chat/room";
				//document.chatfrm.submit();
			}
			
		}
    </script>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    
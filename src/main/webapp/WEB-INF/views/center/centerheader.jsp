<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

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
    <script src="/js/jquery-3.7.1.min.js"></script>
	<script src="/js/jquery.cookie.js"></script>
    <script>
		/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    */ 

		function center_Update() {
			document.centerfrm.action="/center/centerUpdate";
			document.centerfrm.submit();
		}
		
		function center_update() {
			document.centerfrm.action="/center/update";
			document.centerfrm.submit();
		
		}
	
		function center_delete() {
			if(confirm("삭제하시겠습니까?")){
				document.centerfrm.action="/center/delete";
				document.centerfrm.submit();
			}
		}
		
		
		function jjim_de(){
			alert("찜 해제");
		}
		
		function jjim_nolog(){
			alert("로그인 필요");
		}
		
</script>
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
                    <small>Mon - Fri : 09.00 AM - 07.00 PM</small>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center me-4">
                    <small class="fa fa-phone-alt text-primary me-2"></small>
                    <small>+0507-1401-8061</small>
                </div>
                <!-- Check if the user is logged in (assuming "s_Id" is the session attribute) -->
            <c:if test="${not empty sessionScope.s_id}">
                <!-- If logged in, show logout link -->
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="/">LOGOUT</a> <!-- Adjust the logout URL accordingly -->
                </div>
            </c:if>
            
            <!-- If not logged in, show login and sign-up links -->
            <c:if test="${empty sessionScope.s_id}">
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="/member/loginForm">LOGIN</a>  
                </div>
                &nbsp; &nbsp;
                <div class="h-100 d-inline-flex mx-n2">
                    <a href="/member/signupForm">SIGN-UP</a>  
                </div>
            </c:if>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg bg-white navbar-light">
        
        <a href="/" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <h2 class="m-0"><i class=></i>그냥 데려가개</h2>
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
                    </div>
                </div>
                <div class="nav-item dropdown">
                   <a href="/mypage/home" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                   <div class="dropdown-menu bg-light m-0">
                       <a href="/mypage/jjimList" class="dropdown-item">찜 목록</a>
                       <a href="/mypage/myList" class="dropdown-item">내 글목록</a>
                       <a href="/mypage/myClass" class="dropdown-item">내 강의실</a>
                       <a href="/mypage/myService" class="dropdown-item">봉사신청내역</a>
                       <a href="/mypage/myInfo" class="dropdown-item">회원정보</a>
                   </div>
        </div>
    </nav>
    
    </nav>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    
     
    <!-- Navbar End -->
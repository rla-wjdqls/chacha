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
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    
    <script>
		function logout(){
			alert("로그아웃 되었습니다");
		}//logout() end
    
    </script>

</head>

<body>
<% 
	String s_mlevel = (String)session.getAttribute("m_mlevel");
%>


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
                    <a href="/member/signupForm">회원가입</a>  
                </div>
            </c:if>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg bg-white navbar-light">
        
        <a href="" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <img class="logo" src="/img/logolineye.png" alt="Image" style="width:50px; margin-right:10px;"><h2 class="m-0">그냥 데려가개</h2>
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
			                            <a href="/mypage/memberAdopt" class="dropdown-item">신청내역</a>
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
        </div>
    </nav>
    
    </nav>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    
     
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container-fluid p-0 wow fadeIn" data-wow-delay="0.1s">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/maincatdog1.png" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <h1 class="display-2 text-light mb-5 animated slideInDown"></h1>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/maincatdog4.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <h1 class="display-2 text-light mb-5 animated slideInDown">반려견, 사지 말고 입양하세요</h1>                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/maincatdog2.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <h1 class="display-2 text-light mb-5 animated slideInDown">선한 마음, 사랑으로 나눠주세요</h1>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/maincatdog6.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                    <h1 class="display-2 text-light mb-5 animated slideInDown">책임감, 알아야 행복할 수 있습니다</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->




  
    
    <!-- Testimonial End -->


    <!-- Footer Start -->
   
    <!-- Footer End -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright bg-dark text-light py-4 wow fadeIn" data-wow-delay="0.1s">
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
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
   
   <!-- 게시글 랜덤으로 가져오기 -->
   <script>
   		//fetch API 사용하여 데이터 가져오
   </script>
    
</body>
</html>
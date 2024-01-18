<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- <meta name="author" content="" />  -->
    
    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">
    <!-- <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" /> -->

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/mypage.css" rel="stylesheet">    
    
    <script src="/js/jquery-3.7.1.min.js"></script>
	<script src="/js/jquery.cookie.js"></script>

	 <!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function () {
	  var sidebarWrapper = document.getElementById('sidebar-wrapper');
	  var listGroupItems = sidebarWrapper.querySelectorAll('.list-group-item');
	
	  // 현재 페이지의 URL
	  var currentUrl = window.location.href;
	
	  // 각 list-group-item에 대한 URL
	  var itemUrls = {
	    '/mypage/jjimList': '찜목록',
	    '/mypage/myList': '내 글목록',
	    '/mypage/myClass': '내 강의실',
	    '/mypage/myService': '봉사신청내역',
	    '/mypage/myInfo': '회원정보',
	    // 추가적으로 필요한 페이지에 대한 URL 및 텍스트를 추가할 수 있습니다.
	  };
	
	  // 클릭 이벤트를 처리하는 함수
	  function handleClick(event) {
	    // 모든 list-group-item에서 active 클래스 제거
	    listGroupItems.forEach(function (item) {
	      item.classList.remove('active');
	    });
	
	    // 현재 클릭된 요소에 active 클래스 추가
	    event.currentTarget.classList.add('active');
	  }
	
	  // 현재 페이지의 URL과 매칭되는 list-group-item을 찾아 active 클래스를 추가
	  listGroupItems.forEach(function (item) {
	    var itemUrl = item.getAttribute('href');
	    if (currentUrl.indexOf(itemUrl) !== -1) {
	      item.classList.add('active');
	    }
	
	    // 각 list-group-item에 클릭 이벤트 추가
	    item.addEventListener('click', handleClick);
	  });
	});
	
	
	function logout(){
		alert("로그아웃 되었습니다");
	}//logout() end

</script>

<style>
.login__box_1 {
  display: grid;
  grid-template-columns: max-content 1fr;
  column-gap: 0.5rem;
  padding: 1.125rem 1rem;
  background-color: #fff;
  margin-top: 1rem;
  border-radius: 0.5rem;
  width: 550px;
  height: 60px;
}

.login__register .btn_js_1 {
    position: absolute;
	right: 20px;
	top: 20px;
    display: inline-block; 
    margin-top: 764px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    width: 75px;
    height: 40px;
    font-size: 14px;
    font-weight: 500;
    color: #23004d; 
}


.anipic {
    width: 100px; /* 이미지의 최대 너비를 부모 요소에 맞게 조절합니다. */
    height: 100px; /* 이미지의 높이를 자동으로 조절하여 비율을 유지합니다. */
    display: block; /* 이미지를 블록 요소로 표시하여 여백을 조절합니다. */
    margin: 0 auto; /* 가운데 정렬을 위해 좌우 여백을 자동으로 조절합니다. */
}


 table {
     width: 100%;
     text-align: center;
 }

 th, td {
     padding: 10px;
     border: 1px solid #ddd;
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
                 &nbsp; &nbsp; &nbsp;
                 <div class="h-100 d-inline-flex mx-n2">
                    <a href="/member/signupForm">회원가입</a>  
                </div>
            </c:if>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg bg-white navbar-light">
        
        <a href="/" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <img class="logo" src="/img/logolineye.png" alt="Image" style="width:50px; margin-right:10px;"><h2 class="m-0"><i class=></i>그냥 데려가개</h2>
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
				            <c:choose>
				                <c:when test="${s_id.contains('@')}">
				                    <a href="/mypage/s_myInfoWithdraw" class="dropdown-item">회원정보</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="/mypage/myInfo1" class="dropdown-item">회원정보</a>
				                </c:otherwise>
				            </c:choose>
				        </div>
				    </div>
				</c:when>

	            </c:choose>
	        </div>
	    </c:when>
	</c:choose>
    </nav>
    </nav>
    <!-- Topbar End -->
    
	<nav>

	<!-- 홈 아이콘 및 경로 nav -->
	<hr style="margin-bottom: 0">
		<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">마이페이지</span></a>
					<!-- <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i> -->
				</li>
<!-- 				<li class="list-inline-item">
					<a><span style="color: #757575">보호소 소개</span></a>
				</li> -->
			</ul>
		</nav>
	<br>
	<c:choose>
	    <c:when test="${not empty s_mlevel}">
	        <div class="h-100 d-inline-flex mx-n2">
	            <c:choose>
	                <c:when test="${s_mlevel eq 'a'}">
	           			&nbsp; &nbsp; <h3>관리자페이지</h3>
	                </c:when>
	                <c:when test="${s_mlevel eq 'b'}">
	     				&nbsp; &nbsp; <h3>파트너페이지</h3>
	                </c:when>
	                <c:when test="${s_mlevel eq 'c'}">
	  					&nbsp; &nbsp; <h3>마이페이지</h3>
	                </c:when>
	               
	            </c:choose>
	        </div>
	    </c:when>
	</c:choose>
	<br>
	&nbsp;&nbsp;안녕하세요! <strong>${s_id}</strong> 님
	
	<br><br>
	</nav>


    <!-- Navbar Start -->
    <nav>
    <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            
        <c:choose>
	    <c:when test="${not empty s_mlevel}">
	        <div class="h-100 d-inline-flex mx-n2">
	            <c:choose>
	                <c:when test="${s_mlevel eq 'a'}">
	                <div class="border-end bg-white" id="sidebar-wrapper">
	                <div class="list-group list-group-flush">
	   					<a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">내 활동</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myList_a">-글목록</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myComment">-댓글목록</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">신청내역</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/memberAdopt">-입양신청내역</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">회원정보</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/memList">-회원관리</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo1">-회원정보 수정</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo2">-회원탈퇴</a>
	                </div>
	                </div>
	                </c:when>
	                <c:when test="${s_mlevel eq 'b'}">
	                <div class="border-end bg-white" id="sidebar-wrapper">
	                <div class="list-group list-group-flush">
	       				<a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">내 활동</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myList_b">-글목록</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myComment">-댓글목록</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">신청내역</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/memberClass">-교육신청내역</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/memberService">-봉사신청내역</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">회원정보</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo1">-회원정보 수정</a>
	                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo2">-회원탈퇴</a>
	                </div>
	                </div>
	                </c:when>
	                <c:when test="${s_mlevel eq 'c'}">
				    <div class="border-end bg-white" id="sidebar-wrapper">
				        <div class="list-group list-group-flush">
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">내 활동</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/jjimList">-찜목록</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myList_c">-글목록</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myComment">-댓글목록</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">신청내역</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myClass">-내 강의실</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myAdopt">-입양신청내역</a>
				            <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myService">-봉사신청내역</a>
				            <c:choose>
				                <c:when test="${not s_id.contains('@')}">
				               		<a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">회원정보</a>
				                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo1">-회원정보 수정</a>
				                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/myInfo2">-회원탈퇴</a>
				                </c:when>
				                <c:otherwise>
				               		<a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="#!" style="font-weight:bold">회원정보</a>
				                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="makeActive(this)" href="/mypage/s_myInfoWithdraw">-회원탈퇴</a>
				                </c:otherwise>
				            </c:choose>
				        </div>
				    </div>
				</c:when>
	            </c:choose>
	        </div>
	    </c:when>
	</c:choose>
	
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
	
            
            

            
            
     
  
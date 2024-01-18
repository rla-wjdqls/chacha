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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
   		
   		let rno;
    
	    $(document).ready(function() {
		    // DOM이 준비된 후 실행될 코드
		    //alert("?");
		    getRandomPosts();
		   	chart();
		   	
		    // 설문번호 가져오기
		     $.ajax({
	            url: '/research/checkMaxrno',
	            type: 'get',
	            error: function (error) {
	                alert('에러!');
	                console.log(error);
	            },
	            success: function (rno) {
	   				//alert("성공! " + rno);
	            	resultList(rno);
	            }//success end
	        });//ajax end
		});//ready end
	    
	    function resultList(rno) { //rno를 담아 보내서 차트 내용 가져오기
	        $.ajax({
	            url: '/research/resultList',
	            type: 'get',
	            dataType: 'json',
	            data: { 'rno': rno },
	            error: function (error) {
	                alert('에러!');
	                //console.log(error);
	            },
	            success: function (result) {
	            	//alert('성공!');
	            	console.log(result);

	                let questionResults = [];

	                let questionMap = new Map();
	                $.each(result, function (key, value) {
	                    let questionKey = value.qcont;

	                    if (!questionMap.has(questionKey)) {
	                        questionMap.set(questionKey, {
	                            choices: [],
	                            replies: []
	                        });
	                    }

	                    questionMap.get(questionKey).choices.push(value.choice);
	                    questionMap.get(questionKey).replies.push(value.reply);
	                });

	                let firstQuestion = Array.from(questionMap.keys())[0];
	                let firstData = questionMap.get(firstQuestion);

	                let dataset = {
	                    data: firstData.replies,
	                    backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"],
	                    label: '첫 번째 질문 결과'
	                };

	                questionResults.push({
	                    labels: firstData.choices,
	                    datasets: [dataset],
	                    question: {
	                        content: firstQuestion // 질문 내용
	                    }
	                });

	                let chartId = 'firstQuestionChart';
	                let chartCanvas = '<canvas id="' + chartId + '" width="200" height="200"></canvas><br>';
	                $("#surveyResult").append('<p>질문 : ' + questionResults[0].question.content + '</p><br>');
	                $("#surveyResult").append(chartCanvas);

	                let ctx = document.getElementById(chartId).getContext('2d');
	                new Chart(ctx, {
	                    type: 'doughnut',
	                    data: questionResults[0],
	                    options: {
	                        title: {
	                            display: true,
	                            text: '첫 번째 질문 결과: ' + questionResults[0].question.content
	                        }
	                    }
	                });
	            	
	            }//success end
	        });//ajax end
	    }//researchrList() end
	    
    
	    
	    
	    function getRandomPosts() {
	    	//alert("?");
			$.ajax({
				url : '/center/indexRandom',
				type : 'get',
				error : function (error) {
					alert(error);
				},
				success : function (result) {
					console.log(result)
					let a = '';
					$.each(result, function (key, value) {
						//alert(value.aname);
						a += "<div class='col-lg-3 col-md-6 wow fadeInUp' data-wow-delay='0.1s'>" ;
						a += "<div class='team-item position-relative'>" ;
						a += "<div class='position-relative'>" ;
						if(!value.anipic || value.anipic === '-'){
							a += "<img class='img-fluid' src='/img/noimg.png'>" ;
						}else{
							a += "<img class='img-fluid' src='/storage/" + value.anipic + "' >" ;
						}
						a += "<div class='team-social text-center'>" ;
						a += "<a class='btn btn-square btn-outline-primary border-2 m-1' href='center/jdetail?anino=" + value.anino + "'>글 보러가기</a>" ;
						a += "</div>" ;
						a += "</div>" ;
						a += " <div class='bg-light text-center p-4'>" ;
						a += "<h5 class='mt-2'>" + value.aname + "</h5>" ;
						a += "<span>" + value.age + "살</span>" ;
						a += "</div>" ;
						a += "</div>" ;
						a += "</div>" ;
						
					});//each end
					$("#team-items").append(a);
				}
			});//ajax end
		}
	    
	    function chart() {
	    	$.ajax({
				url : '/center/chart',
				type : 'get',
				error : function (error) {
					alert(error);
				},
				success : function (result) {
					console.log(result);
					let dataChart = [];
					let animalType, status, data;
					
					dataChart = result[4];
						
					
					console.log(dataChart);
					chartJs(dataChart);
				}
	    	});//ajax end	
				
		}
	    
	    let totalSum = [];
	    let dog = [];
	    let cat = [];
	    let other = [];

	    function chartJs(dataChart) {
	        let chart = document.getElementById('myChart');

	        //console.log(dataChart);

	        //필요한 부분만 추출
	        let total = dataChart.slice(2);
	        console.log(total);

	        totalSum = total[0];
	        dog = total.slice(1, 5); // dataChart 인덱스 3번째부터 6번째까지 가져오기
	        cat = total.slice(5, 9); // dataChart 인덱스 7번째부터 10번째까지 가져오기
	        other = total.slice(9, 13); // dataChart 인덱스 11번째부터 14번째까지 가져오기

	        console.log(totalSum);
	        console.log(dog);
	        console.log(cat);
	        console.log(other);

	        let labels = ["유기된 동물", "인도(주인)", "입양", "안락사(자연사)"];
	        let data = {
	            labels: labels,
	            datasets: [
	                {
	                    label: "전체",
	                    data: [totalSum], //배열이 아닌 단일 값으로 수정
	                    borderColor: 'rgb(255, 99, 132)',
	                    backgroundColor: 'rgba(255, 99, 132, 0.2)'
	                },
	                {
	                    label: "개",
	                    data: dog,
	                    borderColor: 'rgb(54, 162, 235)',
	                    backgroundColor: 'rgba(54, 162, 235, 0.2)'
	                },
	                {
	                    label: "고양이",
	                    data: cat,
	                    borderColor: 'rgb(255, 205, 86)',
	                    backgroundColor: 'rgba(255, 205, 86, 0.2)'
	                },
	                {
	                    label: "기타",
	                    data: other,
	                    borderColor: 'rgb(75, 192, 192)',
	                    backgroundColor: 'rgba(75, 192, 192, 0.2)'
	                }
	            ]
	        };

	        console.log(data);

	        let myChart = new Chart(chart, {
	            type: 'bar',
	            data: data,
	            options: {
	                indexAxis: 'y',
	                scales: {
	                    x: {
	                        beginAtZero: true,
	                        min: 0,
	                        max: 5000,
	                        ticks: {
	                            stepSize: 1000
	                            // x축 최대 값 설정 (원하는 값으로 조정)
	                        }
	                    }
	                }
	            }
	        });
	    }
		
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
                    <a href="logout" onclick="logout()">로그아웃</a> 
                </div>
            </c:if>
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



    <!-- Team Start -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
                <h6 class="text-primary text-uppercase mb-2">입양 가능한 친구들</h6>
                <h1 class="display-6 mb-4">귀여운 친구들을 소개합니다~^^</h1>
            </div>
            <div class="row g-0 team-items" id="team-items">
                <!-- 동물 랜덤 목록 -->
            </div>
        </div>
    </div>
    <!-- Team End -->

    <!-- Testimonial Start -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h6 class="text-primary text-uppercase mb-2">통계</h6>
                <h1 class="display-6 mb-4">서울시 유기견 현황</h1>
                <canvas id="myChart" width="500" height="500"></canvas>
            </div>
            <br><br>
             <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h6 class="text-primary text-uppercase mb-2"><a href="/research/researchList">설문조사 하러가기</a></h6>
                <h1 class="display-6 mb-4"></h1>
                <div id="surveyResult" name="surveyResult" id="surveyResult"></div>
            </div>
            
        <div style="display: flex">
	        <div style="float: left">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/we9qyoE3mcY?si=mCliilmj0KJPsulC" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>                            
	        </div>
	        &nbsp; &nbsp; &nbsp;
	        <div style="float: right">
	             <iframe width="560" height="315" src="https://www.youtube.com/embed/TTnO9PPKMPo?si=UPWVMhDa_0NCIjxZ" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	        </div>
     	</div>
       </div>
    </div>
      
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
   
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
    
</body>
</html>
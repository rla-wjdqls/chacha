<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content2 {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            margin-top: 100px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        } 
            
          .quiz-container {
            max-width: 600px;
            margin: 50px auto;
        }
        .question {
            margin-bottom: 20px;
        }
        .result {
            font-weight: bold;
            margin-top: 20px;
        }
    </style>   
<%@ include file="../header.jsp" %>
	<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575; margin-left: 15px;" alt="홈으로"></i></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">교육강의</span></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">목록</span></a>
				</li>
			</ul>
		</nav>

<div class="container text-center mb-4"><h3>입양 전 필수 교육 강의</h3></div>

<div class="container-fixed row">
	<div class="card" style="width: 18rem;">
		<img src="/img/edudog.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">강아지 교육 강의</h5>
		    	<p class="card-text">강아지</p>
		    	<button onclick="checkLoginAndApply('dog')" class="btn btn-primary">신청하기</button>
		    	<%
		        // 세션에서 로그인 여부 확인
		        String loggedInUser = (String) session.getAttribute("s_id");
			
		    	%>
			</div>
	</div>

&nbsp;&nbsp;
	<div class="card" style="width: 18rem;">
		<img src="/img/educat.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">고양이 교육 강의</h5>
		    	<p class="card-text">고양이</p>
		    	<button onclick="checkLoginAndApply('cat')" class="btn btn-primary">신청하기</button>
		    	
			</div>
	</div>
</div>

 	
    <!-- 스크립트 링크 -->
    <script>

    var loggedInUser = '<%= loggedInUser %>';

    function idPopup(coursesType) {
        let uid = '<%= (String)session.getAttribute("s_id") %>';
        if (uid == "null") {
            uid = "";
        }
        if (uid.length === 0) {
            alert("로그인 후 이용 바랍니다.");
        } else {
            edureCourse(coursesType); // 로그인한 사용자를 위한 수강 등록 함수 호출
        }
    }

    function checkLoginAndApply(coursesType) {
        if (loggedInUser.length === 0) {
            alert("로그인 후 이용 바랍니다.");
            // 사용자가 로그인하지 않은 경우 추가적인 로직을 여기에 추가할 수 있습니다.
            // 예를 들어 로그인 모달 표시 또는 로그인 페이지로 리디렉션
        } else {
            idPopup(coursesType); // 사용자가 로그인했는지 확인하고 그에 따라 진행하는 함수 호출
        }
    }

    function edureCourse(coursesType) {
        // 확인 대화상자를 표시하는 confirm 함수
        var userChoice = confirm("수강을 신청하시겠습니까?");

        // 사용자의 선택 처리
        if (userChoice) {
            alert("수강이 신청되었습니다.");
            // 여기에 추가적인 수강 등록 로직을 추가할 수 있습니다.
            window.location.href = './' + coursesType; // 원하는 페이지로 리디렉션
        } else {
            alert("수강이 취소되었습니다.");
            // 사용자가 취소를 선택한 경우의 처리를 추가할 수 있습니다.
        }
    }//edurecat end
    
    
 
    </script>
 

<%@ include file="../footer.jsp" %>      
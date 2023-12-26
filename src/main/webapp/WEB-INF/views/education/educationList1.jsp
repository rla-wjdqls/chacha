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
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
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

<div class="container text-center"><h3>입양 전 필수 교육 강의</h3></div>

<div class="container-fixed row">
	<div class="card" style="width: 18rem;">
		<img src="/img/edudog.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">강아지 교육강의</h5>
		    	<p class="card-text">강아지</p>
		    	<a href="/css/dog.html" class="btn btn-primary">신청하기</a>
		    	<button onclick="openDogQuizModal()" class="btn btn-primary">퀴즈풀기</button>
			</div>
	</div>

&nbsp;&nbsp;
	<div class="card" style="width: 18rem;">
		<img src="/img/educat.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">고양이 교육강의</h5>
		    	<p class="card-text">고양이</p>
		    	<a href="/css/cat.html" class="btn btn-primary">신청하기</a>
		    	<button onclick="openCatQuizModal()" class="btn btn-primary">퀴즈풀기</button>
			</div>
	</div>
</div>	
	<!-- Dog Quiz 모달 창 -->
    <div id="dogQuizModal" class="modal">
        <div class="modal-content2">
            <span class="close" onclick="closeDogQuizModal()">&times;</span>
            <!-- 모달 내용 추가 (Quiz 등) -->
             <div class="quiz-container">
       		 <h1>OX Quiz</h1>
       		 <br>

        <!-- 문제 표시 및 풀이 양식 -->
        <form id="dogquizForm">
            <div class="question">
                <label>1. 종합백신(DHPPL) 종류에 광견병이 포함된다. </label>
                <input type="radio" name="qd1" value="O"> O
                <input type="radio" name="qd1" value="X"> X
            </div>
            <div class="question">
                <label>2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다. </label>
                <input type="radio" name="qd2" value="O"> O
                <input type="radio" name="qd2" value="X"> X
            </div>
            <div class="question">
                <label>3. 광견병 예방접종은 매년 맞지 않아도 된다. </label>
                <input type="radio" name="qd3" value="O"> O
                <input type="radio" name="qd3" value="X"> X
            </div>
            <div class="question">
                <label>4. 강아지는 꽃은 먹어도 된다. </label>
                <input type="radio" name="qd4" value="O"> O
                <input type="radio" name="qd4" value="X"> X
            </div>
            <div class="question">
                <label>5. 임신 중에 구충약 복용해야 한다. </label>
                <input type="radio" name="qd5" value="O"> O
                <input type="radio" name="qd5" value="X"> X
            </div>
            <div class="question">
                <label>6. 임신기간은 평균 9주이다. </label>
                <input type="radio" name="qd6" value="O"> O
                <input type="radio" name="qd6" value="X"> X
            </div>
            <div class="question">
                <label>7. 성견 치아는 40개 이상이다. </label>
                <input type="radio" name="qd7" value="O"> O
                <input type="radio" name="qd7" value="X"> X
            </div>
            <div class="question">
                <label>8. 강아지는 땀배출을 발바닥으로 한다. </label>
                <input type="radio" name="qd8" value="O"> O
                <input type="radio" name="qd8" value="X"> X
            </div>
            <div class="question">
                <label>9. 강아지 치석은 3개월 이상부터 생긴다. </label>
                <input type="radio" name="qd9" value="O"> O
                <input type="radio" name="qd9" value="X"> X
            </div>
            <div class="question">
                <label>10. 입양 후 동물등록신고는 30일 안에 해야 한다. </label>
                <input type="radio" name="qd10" value="O"> O
                <input type="radio" name="qd10" value="X"> X
            </div>
           <!-- 추가 문제 추가 가능 -->

            <button type="button" onclick="gradeDogQuiz()">결과보기</button>
        </form>

        <!-- 채점 결과 -->
        <div id="result" class="result"></div>
    	</div>
            <!-- Quiz 내용 추가 -->
        
    </div>
</div>
        

    <!-- Cat Quiz 모달 창 -->
    <div id="catQuizModal" class="modal">
        <div class="modal-content2">
            <span class="close" onclick="closeCatQuizModal()">&times;</span>
            <!-- 모달 내용 추가 (Quiz 등) -->
             <div class="quiz-container">
       		 <h1>OX Quiz</h1>
       		 <br>

        <!-- 문제 표시 및 풀이 양식 -->
         <form id="catQuizForm">
            <div class="question">
                <label>1. 고양이는 높은 곳에서 떨어져서 다치지 않는다. </label>
                <input type="radio" name="qc1" value="O"> O
                <input type="radio" name="qc1" value="X"> X
            </div>

            <div class="question">
                <label>2. 고양이가 문어,전복을 먹으면 심장에 부담이 가므로 먹으면 안된다. </label>
                <input type="radio" name="qc2" value="O"> O
                <input type="radio" name="qc2" value="X"> X
            </div>
            
            <div class="question">
                <label>3. 고양이는 폐경이 없다. </label>
                <input type="radio" name="qc3" value="O"> O
                <input type="radio" name="qc3" value="X"> X
            </div>
            <div class="question">
                <label>4. 고양이는 관절염이 없다. </label>
                <input type="radio" name="qc4" value="O"> O
                <input type="radio" name="qc4" value="X"> X
            </div>
            <div class="question">
                <label>5. 길고양이는 사람의 도움이 없어도 굶지 않는다. </label>
                <input type="radio" name="qc5" value="O"> O
                <input type="radio" name="qc5" value="X"> X
            </div>
            <div class="question">
                <label>6. 고양이가 푸른 생선을 너무 많이 먹으면 배에 응어리가 만져진다. </label>
                <input type="radio" name="qc6" value="O"> O
                <input type="radio" name="qc6" value="X"> X
            </div>
            <div class="question">
                <label>7. 고양이는 사람보다 시력이 좋다. </label>
                <input type="radio" name="qc7" value="O"> O
                <input type="radio" name="qc7" value="X"> X
            </div>
            <div class="question">
                <label>8. 고양이는 단맛을 제한적으로 또는 전혀 느끼지 못한다. </label>
                <input type="radio" name="qc8" value="O"> O
                <input type="radio" name="qc8" value="X"> X
            </div>
            <div class="question">
                <label>9. 고양이는 빨간색을 알아볼 수 없다. </label>
                <input type="radio" name="qc9" value="O"> O
                <input type="radio" name="qc9" value="X"> X
            </div>
            <div class="question">
                <label>10. 고양이는 수태후 평균 65일 만에 출산한다. </label>
                <input type="radio" name="qc10" value="O"> O
                <input type="radio" name="qc10" value="X"> X
            </div>
            
			<!-- 추가 문제 추가 가능 -->

            <button type="button" onclick="gradeCatQuiz()">결과보기</button>
        </form>

        <!-- 채점 결과 -->
        <div id="catQuizResult" class="result"></div>
    	</div>
            <!-- Quiz 내용 추가 -->
        </div>
    </div>

    <!-- 스크립트 링크 -->
    <script>
    
 // 전역 변수로 선언
    var dogScore = 0;
    var catScore = 0;

    
 // 모달 열기
    function openCatQuizModal() {
        document.getElementById('catQuizModal').style.display = 'block';
    }

    function openDogQuizModal() {
        document.getElementById('dogQuizModal').style.display = 'block';
    }

    // 모달 닫기
    function closeCatQuizModal() {
        document.getElementById('catQuizModal').style.display = 'none';
    }

    function closeDogQuizModal() {
        document.getElementById('dogQuizModal').style.display = 'none';
    }

    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        var catModal = document.getElementById('catQuizModal');
        if (event.target == catModal) {
            catModal.style.display = 'none';
        }

        var dogModal = document.getElementById('dogQuizModal');
        if (event.target == dogModal) {
            dogModal.style.display = 'none';
        }
    }

    function gradeDogQuiz() {
        // Dog Quiz 문제별 정답 배열
        var correctDogAnswers = ["O", "X"]; // 예시, 실제 정답에 따라 수정

        // 사용자가 선택한 Dog Quiz 답 배열
        var userDogAnswers = getUserAnswers("dogquizForm", correctDogAnswers.length);

        // Dog Quiz 점수 계산
        dogScore = calculateScore(userDogAnswers, correctDogAnswers);

        // Dog Quiz 결과 표시
        document.getElementById("result").innerHTML = "총 점수: " + dogScore + "점";
    }

    function gradeCatQuiz() {
        // Cat Quiz 문제별 정답 배열
        var correctCatAnswers = ["O", "X"]; // 예시, 실제 정답에 따라 수정

        // 사용자가 선택한 Cat Quiz 답 배열
        var userCatAnswers = getUserAnswers("catQuizForm", correctCatAnswers.length);

        // Cat Quiz 점수 계산
        catScore = calculateScore(userCatAnswers, correctCatAnswers);

        // Cat Quiz 결과 표시
        document.getElementById("catQuizResult").innerHTML = "총 점수: " + catScore + "점";
    }

    function displayTotalScore() {
        // 전체 퀴즈 결과 표시
        var totalScore = dogScore + catScore;
        document.getElementById("result").innerHTML = "전체 총 점수: " + totalScore + "점";
    }


    function getUserAnswers(formId, numQuestions) {
        // 사용자가 선택한 답 배열
        var userAnswers = [];
        for (var i = 1; i <= numQuestions; i++) {
            var selectedAnswer = document.querySelector(`#${formId} input[name="qd${i}"]:checked`);
            if (selectedAnswer) {
                userAnswers.push(selectedAnswer.value);
            } else {
                alert("모든 문제에 답을 선택해주세요.");
                return [];
            }
        }
        return userAnswers;
    }

    function calculateScore(userAnswers, correctAnswers) {
        // 점수 계산
        var score = 0;
        for (var i = 0; i < correctAnswers.length; i++) {
            if (userAnswers[i] === correctAnswers[i]) {
                score++;
            }
        }
        return score;
    }
        		</script>
 

<%@ include file="../footer.jsp" %>      
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

<div class="container text-center"><h3>입양 전 필수 교육 강의</h3></div>

<div class="container-fixed row">
	<div class="card" style="width: 18rem;">
		<img src="/img/edudog.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">강아지 교육강의</h5>
		    	<p class="card-text">강아지</p>
		    	<button onclick="eduredog()" class="btn btn-primary">신청하기</button>
		    	<button onclick="openDogQuizModal()" class="btn btn-primary">퀴즈풀기</button>
			</div>
	</div>

&nbsp;&nbsp;
	<div class="card" style="width: 18rem;">
		<img src="/img/educat.png" class="card-img-top img-fixed img-fluid">
			<div class="card-body">
		    	<h5 class="card-title">고양이 교육강의</h5>
		    	<p class="card-text">고양이</p>
		    	<button onclick="edurecat()" class="btn btn-primary">신청하기</button>
		    	<button onclick="openCatQuizModal()" class="btn btn-primary">퀴즈풀기</button>
			</div>
	</div>
</div>

 	<!-- 버튼을 클릭하면 모달 창이 열리도록 함 -->
    <!-- <button onclick="openCatQuizModal()">Open Cat Quiz</button> -->
    
    <!-- Dog Quiz 모달 창 -->
    <div id="dogQuizModal" class="modal">
        <div class="modal-content2">
            <span class="close" onclick="closeDogQuizModal()">&times;</span>
            <!-- 모달 내용 추가 (Quiz 등) -->
             <div class="quiz-container">
       		 <h1>OX Quiz</h1>
       		 <br>

        <!-- 문제 표시 및 풀이 양식 -->
        <form id="dogquizForm" action="quizan">
            <div class="question" name="qd">
                <label>1. 종합백신(DHPPL) 종류에 광견병이 포함된다. </label>
                <input type="radio" name="qd1" value="X"> O
                <input type="radio" name="qd1" value="O"> X
            </div>
            <div class="question" name="qd">
                <label>2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다. </label>
                <input type="radio" name="qd2" value="O"> O
                <input type="radio" name="qd2" value="X"> X
            </div>
            <div class="question" name="qd">
                <label>3. 광견병 예방접종은 매년 맞지 않아도 된다. </label>
                <input type="radio" name="qd3" value="X"> O
                <input type="radio" name="qd3" value="O"> X
            </div>
            <div class="question" name="qd">
                <label>4. 강아지는 꽃은 먹어도 된다. </label>
                <input type="radio" name="qd4" value="X"> O
                <input type="radio" name="qd4" value="O"> X
            </div>
            <div class="question" name="qd">
                <label>5. 임신 중에 구충약 복용해야 한다. </label>
                <input type="radio" name="qd5" value="X"> O
                <input type="radio" name="qd5" value="O"> X
            </div>
            <div class="question" name="qd">
                <label>6. 임신기간은 평균 9주이다. </label>
                <input type="radio" name="qd6" value="O"> O
                <input type="radio" name="qd6" value="X"> X
            </div>
            <div class="question" name="qd">
                <label>7. 성견 치아는 40개 이상이다. </label>
                <input type="radio" name="qd7" value="O"> O
                <input type="radio" name="qd7" value="X"> X
            </div>
            <div class="question" name="qd">
                <label>8. 강아지는 땀배출을 발바닥으로 한다. </label>
                <input type="radio" name="qd8" value="O"> O
                <input type="radio" name="qd8" value="X"> X
            </div>
            <div class="question" name="qd">
                <label>9. 강아지 치석은 3개월 이상부터 생긴다. </label>
                <input type="radio" name="qd9" value="X"> O
                <input type="radio" name="qd9" value="O"> X
            </div>
            <div class="question">
                <label>10. 입양 후 동물등록신고는 30일 안에 해야 한다. </label>
                <input type="radio" name="qd10" value="O"> O
                <input type="radio" name="qd10" value="X"> X
            </div>
           <!-- 추가 문제 추가 가능 -->

            <button type="submit">결과보기</button>
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
        <form id="catquizForm" action="quizan">
            <div class="question">
                <label>1. 고양이는 높은 곳에서 떨어져서 다치지 않는다. </label>
                <select name="qc" >
                	<option value="o">o</option>
                	<option value="x">x</option>
                </select>
                
            </div>

            <div class="question">
                <label>2. 고양이가 문어,전복을 먹으면 심장에 부담이 가므로 먹으면 안된다. </label>
                <select name="qc" >
                	<option value="o">o</option>
                	<option value="x">x</option>
                </select>
            </div>
            
            <div class="question">
                <label>3. 고양이는 폐경이 없다. </label>
            	<select name="qc" >
                	<option value="o">o</option>
                	<option value="x">x</option>
                </select>    
            </div>
            <div class="question">
                <label>4. 고양이는 관절염이 없다. </label>
                <input type="radio" name="qc" value="X"> O
                <input type="radio" name="qc" value="O"> X
            </div>
            <div class="question">
                <label>5. 길고양이는 사람의 도움이 없어도 굶지 않는다. </label>
                <input type="radio" name="qc" value="X"> O
                <input type="radio" name="qc" value="O"> X
            </div>
            <div class="question">
                <label>6. 고양이가 푸른 생선을 너무 많이 먹으면 배에 응어리가 만져진다. </label>
                <input type="radio" name="qc" value="O"> O
                <input type="radio" name="qc" value="X"> X
            </div>
            <div class="question">
                <label>7. 고양이는 사람보다 시력이 좋다. </label>
                <input type="radio" name="qc" value="X"> O
                <input type="radio" name="qc" value="O"> X
            </div>
            <div class="question">
                <label>8. 고양이는 단맛을 제한적으로 또는 전혀 느끼지 못한다. </label>
                <input type="radio" name="qc" value="O"> O
                <input type="radio" name="qc" value="X"> X
            </div>
            <div class="question">
                <label>9. 고양이는 빨간색을 알아볼 수 없다. </label>
                <input type="radio" name="qc" value="O"> O
                <input type="radio" name="qc" value="X"> X
            </div>
            <div class="question">
                <label>10. 고양이는 수태 후 평균 65일 만에 출산한다. </label>
                <input type="radio" name="qc" value="O"> O
                <input type="radio" name="qc" value="X"> X
            </div>
            

            <!-- 추가 문제 추가 가능 -->

            <button type="submit">결과보기</button>
        </form>

        <!-- 채점 결과 -->
        <div id="result" class="result"></div>
    	</div>
            <!-- Quiz 내용 추가 -->
        </div>
    </div>

    <!-- 스크립트 링크 -->
    <script>
    
    //강아지 수강신청하는 경우
    function eduredog(){
    	//confirm 함수를 사용하여 확인 창 표시
        var userChoice = confirm("수강을 신청하시겠습니까?");

        // 사용자의 선택에 따라 처리
        if (userChoice) {
            alert("수강이 신청되었습니다.");
         // 페이지 이동
            window.location.href = '/css/dog.html';
		// 여기에 추가적인 수강 처리 로직을 추가할 수 있습니다.
        } else {
            alert("수강이 취소되었습니다.");
            // 사용자가 취소를 선택한 경우의 처리를 추가할 수 있습니다.
        }
    }//eduredog end
    
  	//고양이 수강신청하는 경우
    function edurecat(){
    	//confirm 함수를 사용하여 확인 창 표시
        var userChoice = confirm("수강을 신청하시겠습니까?");

        // 사용자의 선택에 따라 처리
        if (userChoice) {
            alert("수강이 신청되었습니다.");
         // 페이지 이동
            window.location.href = '/css/cat.html';
		 //
        } else {
            alert("수강이 취소되었습니다.");
            // 사용자가 취소를 선택한 경우의 처리를 추가할 수 있습니다.
        }
    }//edurecat end
    
    
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

    // 모달 외부 클릭 시 닫기 (굳이 필요없어서 뺌)
    /* window.onclick = function(event) {
        var catModal = document.getElementById('catQuizModal');
        if (event.target == catModal) {
            catModal.style.display = 'none';
        }

        var dogModal = document.getElementById('dogQuizModal');
        if (event.target == dogModal) {
            dogModal.style.display = 'none';
        }
    } */

   
        // 문제별 정답 배열
         var quizData = [
        { quizno: "qd1", quiz_cont: "종합백신(DHPPL) 종류에 광견병이 포함된다.", ox: "X" },
        { quizno: "qd2", quiz_cont: "동물 보호법으로 정해진 리드줄 길이는 2m 이하이다.", ox: "O" },
        { quizno: "qd3", quiz_cont: "광견병 예방접종은 매년 맞지 않아도 된다.", ox: "X" },
        { quizno: "qd4", quiz_cont: "강아지는 꽃은 먹어도 된다.", ox: "X" },
        { quizno: "qd5", quiz_cont: "임신중에 구충약 복용해야 한다.", ox: "X" },
        { quizno: "qd6", quiz_cont: "임신기간은 평균 9주이다.", ox: "O" },
        { quizno: "qd7", quiz_cont: "성견 치아는 40개 이상이다.", ox: "O" },
        { quizno: "qd8", quiz_cont: "강아지는 땀배출을 발바닥으로 한다.", ox: "O" },
        { quizno: "qd9", quiz_cont: "강아지 치석은 3개월 이상부터 생긴다.", ox: "X" },
        { quizno: "qd10", quiz_cont: "입양 후 동물등록신고는 30일 안에 해야 한다.", ox: "O" },
        { quizno: "qc1", quiz_cont: "고양이는 높은 곳에서 떨어져서 다치지 않는다.", ox: "X" },
        { quizno: "qc2", quiz_cont: "고양이가 문어,전복을 먹으면 심장에 부담이 가므로 먹으면 안된다.", ox: "O" },
        { quizno: "qc3", quiz_cont: "고양이는 폐경이 없다.", ox: "O" },
        { quizno: "qc4", quiz_cont: "고양이는 관절염이 없다.", ox: "X" },
        { quizno: "qc5", quiz_cont: "길고양이는 사람의 도움이 없어도 굶지 않는다.", ox: "X" },
        { quizno: "qc6", quiz_cont: "고양이가 푸른 생선을 너무 많이 먹으면 배에 응어리가 만져진다.", ox: "O" },
        { quizno: "qc7", quiz_cont: "고양이는 사람보다 시력이 좋다.", ox: "X" },
        { quizno: "qc8", quiz_cont: "고양이는 단맛을 제한적으로 또는 전혀 느끼지 못한다.", ox: "O" },
        { quizno: "qc9", quiz_cont: "고양이는 빨간색을 알아볼 수 없다.", ox: "O" },
        { quizno: "qc10", quiz_cont: "고양이는 수태 후 평균 65일 만에 출산한다.", ox: "O" }
        ];
        
        function gradeQuiz() {
        // 사용자가 선택한 답 배열
        var score = 0;
        var allanswer = true;  // 모든 문제를 풀었는지 여부
        
        for (var i = 0; i <= quizData.length; i++) {
            var answer = document.querySelector('input[name="' + quizData[i].quizno + '"]:checked');
            
            // 사용자가 모든 문제의 답을 선택하지 않은 경우
            if(!answer){
            	allanswer = false;
            	break;
            }
            /*
            if (answer) {
            	var quizno = quizData[i].quizno;
            	var answer = quizData[i].ox;
            }	*/
            
            //사용자가 선택한 답과 정답을 비교하여 점수 부여
            if (answer.value === quizData[i].ox) {
                score += 10;
           
            }
        }

        // 결과 표시
        if (allanswer) {
            document.getElementById("result").innerHTML = "총 점수: " + score + "점";
        } else {
            document.getElementById("result").innerHTML = "모든 문제를 풀어주세요!";
        }
    }
    </script>
 

<%@ include file="../footer.jsp" %>      
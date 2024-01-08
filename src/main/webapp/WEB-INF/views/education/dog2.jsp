<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<%@ include file="../header.jsp" %>
    <style>
        #quiz {
            display: none;
        }
    </style>
    
    <title>그냥 데려가게</title>

<video id="dogedu" width="400" height="700" controls>
<h3>강아지 반려자를 위한 기초교육강의</h3>
<p>사랑하는 내 가족을 위해 주의깊게 들어주시기 바랍니다.</p>
    <source src="../img/dog.mp4" type="video/mp4">
</video>


<div id="quiz" class="container">
    <h2 class="mb-4">강아지 OX Quiz</h2>
    
   <form id="dogquizForm" action="quizan">
            <div class="question mb-4" name="qd">
                <label>1. 종합백신(DHPPL) 종류에 광견병이 포함된다. </label>
                <input type="radio" name="qd1" value="X"> O
                <input type="radio" name="qd1" value="O"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다. </label>
                <input type="radio" name="qd2" value="O"> O
                <input type="radio" name="qd2" value="X"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>3. 광견병 예방접종은 매년 맞지 않아도 된다. </label>
                <input type="radio" name="qd3" value="X"> O
                <input type="radio" name="qd3" value="O"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>4. 강아지는 꽃은 먹어도 된다. </label>
                <input type="radio" name="qd4" value="X"> O
                <input type="radio" name="qd4" value="O"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>5. 임신 중에 구충약 복용해야 한다. </label>
                <input type="radio" name="qd5" value="X"> O
                <input type="radio" name="qd5" value="O"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>6. 임신기간은 평균 9주이다. </label>
                <input type="radio" name="qd6" value="O"> O
                <input type="radio" name="qd6" value="X"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>7. 성견 치아는 40개 이상이다. </label>
                <input type="radio" name="qd7" value="O"> O
                <input type="radio" name="qd7" value="X"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>8. 강아지는 땀배출을 발바닥으로 한다. </label>
                <input type="radio" name="qd8" value="O"> O
                <input type="radio" name="qd8" value="X"> X
            </div>
            <div class="question mb-4" name="qd">
                <label>9. 강아지 치석은 3개월 이상부터 생긴다. </label>
                <input type="radio" name="qd9" value="X"> O
                <input type="radio" name="qd9" value="O"> X
            </div>
            <div class="question mb-4">
                <label>10. 입양 후 동물등록신고는 30일 안에 해야 한다. </label>
                <input type="radio" name="qd10" value="O"> O
                <input type="radio" name="qd10" value="X"> X
            </div>
    <!-- 다른 퀴즈 옵션들 추가 -->

    <button onclick="checkQuiz()">퀴즈 제출</button>
    </form>
</div>

<script>
	// 동영상이 끝날 때 호출되는 함수
	document.getElementById('dogedu').addEventListener('ended', function() {
    // 동영상이 끝났을 때 alert 창을 띄우는 부분
    alert('동영상이 끝났습니다. 이제 퀴즈를 풀어주세요.');

    // 퀴즈 폼을 보이도록 설정
    document.getElementById('dogedu').style.display = 'none';
    document.getElementById('quiz').style.display = 'block';
	});

    const video = document.getElementById('dogedu');
    const quizDiv = document.getElementById('quiz');

    function videoEnded() {
        quizDiv.style.display = 'block';
        video.style.display = 'none';
    }

    function checkQuiz() {
    	 let score = 0;

         // 문제 수에 맞게 반복문을 설정
         for (let i = 1; i <= 10; i++) {
             const selectedAnswer = document.querySelector('input[name="qd' + i + '"]:checked');

             if (selectedAnswer) {
                 const userAnswer = selectedAnswer.value;

                 // 정답 여부 확인
                //if (userAnswer.toLowerCase() === '<%= question[i - 1][1] %>') {
                     score += 10;
                 }
             }
         }
    }

    video.addEventListener('ended', videoEnded);
</script>

<%@ include file="../footer.jsp" %>  
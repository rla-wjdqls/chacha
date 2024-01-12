<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>그냥 데려가게</title>
<style>
    #quiz {
        display: none;
    }
    
    #catquizForm {
        display: flex;
        flex-direction: column;
    }

    .question {
        margin-bottom: 10px; /* 각 질문 사이에 간격을 조절 */
    }

    .btn-primary {
        align-self: flex-end;
    }
     
</style>

<h3>고양이 반려자를 위한 기초교육강의</h3>
<p>사랑하는 내 가족을 위해 주의깊게 들어주시기 바랍니다.</p>

<video id="catedu" width="400" height="700" controls>
    <source src="../img/cat.mp4" type="video/mp4">
</video>

<div id="quiz" class="container">
    <h2 class="mb-4">고양이 OX Quiz</h2>
    <form id="catquizForm" action="./catResult">
        <% 
            // 질문 배열 추가
            String[][] questions = {
           		 	{"1. 고양이는 높은 곳에서 떨어져서 다치지 않는다.", "x"},
                    {"2. 고양이가 문어,전복을 먹으면 심장에 부담이 가므로 먹으면 안된다.", "o"},
                    {"3. 고양이는 폐경이 없다.", "o"},
                    {"4. 고양이는 관절염이 없다.", "x"},
                    {"5. 길고양이는 사람의 도움이 없어도 굶지 않는다.", "x"},
                    {"6. 고양이가 푸른 생선을 너무 많이 먹으면 배에 응어리가 만져진다.", "o"},
                    {"7. 고양이는 사람보다 시력이 좋다.", "x"},
                    {"8. 고양이는 단맛을 제한적으로 또는 전혀 느끼지 못한다.", "o"},
                    {"9. 고양이는 빨간색을 알아볼 수 없다.", "o"},
                    {"10. 고양이는 수태 후 평균 65일 만에 출산한다.", "o"}
            };
            
            for (int i = 1; i <= 10; i++) {
        %>
            <div class="question mb-4" name="qd">
                <label><c:out value="<%= questions[i - 1][0] %>"/></label>
                <input type="radio" name="qd<%=i%>" value="O"> O
                <input type="radio" name="qd<%=i%>" value="X"> X
            </div>
        <% } %>
        <button type="submit" class="btn btn-primary mb-4" >퀴즈 제출</button>
    </form>
</div>

<script>
    document.getElementById('catedu').addEventListener('ended', function () {
        alert('동영상이 끝났습니다. 이제 퀴즈를 풀어주세요.');
        document.getElementById('catedu').style.display = 'none';
        document.getElementById('quiz').style.display = 'block';
        document.querySelector('h3').style.display = 'none';
        document.querySelector('p').style.display = 'none';
    });

    const video = document.getElementById('catedu');
    //const quizDiv = document.getElementById('quiz');
    const quizForm = document.getElementById('catquizForm');
   
	/*
    function videoEnded() {
        quizDiv.style.display = 'block';
        video.style.display = 'none';
    }
    
    video.addEventListener('ended', videoEnded);
    */
  
    quizForm.addEventListener('submit', function (event) {
        // 모든 문제에 대한 응답 여부를 확인
        const questions = document.querySelectorAll('.question');
        let allQuestionsAnswered = true;

        questions.forEach(function (question) {
            const radioButtons = question.querySelectorAll('input[type="radio"]');
            let radioButtonChecked = false;

            radioButtons.forEach(function (radioButton) {
                if (radioButton.checked) {
                    radioButtonChecked = true;
                }
            });

            if (!radioButtonChecked) {
                allQuestionsAnswered = false;
            }
        });

        if (!allQuestionsAnswered) {
            alert('모든 문제에 답해주세요.');
            event.preventDefault(); // 폼 제출 방지
        }
    });
    
</script>

<%@ include file="../footer.jsp" %>
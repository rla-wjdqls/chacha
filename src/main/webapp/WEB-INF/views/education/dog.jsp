<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>그냥 데려가게</title>
<style>
    #quiz {
        display: none;
    }
    
    #dogquizForm {
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

<h3>강아지 반려자를 위한 기초교육강의</h3>
<p>사랑하는 내 가족을 위해 주의깊게 들어주시기 바랍니다.</p>

<video id="dogedu" width="400" height="700" controls>
    <source src="../img/dog.mp4" type="video/mp4">
</video>

<div id="quiz" class="container">
    <h2 class="mb-4">강아지 OX Quiz</h2>
    <form id="dogquizForm" action="./dogResult">
        <% 
            // 질문 배열 추가
            String[][] questions = {
                {"1. 종합백신(DHPPL) 종류에 광견병이 포함된다.", "X"},
                {"2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다.", "O"},
                {"3. 광견병 예방접종은 매년 맞지 않아도 된다.", "X"},
                {"4. 강아지는 꽃은 먹어도 된다.", "O"},
                {"5. 임신 중에 구충약 복용해야 한다.", "X"},
                {"6. 임신기간은 평균 9주이다.", "O"},
                {"7. 성견 치아는 40개 이상이다.", "O"},
                {"8. 강아지는 땀배출을 발바닥으로 한다.", "O"},
                {"9. 강아지 치석은 3개월 이상부터 생긴다.", "X"},
                {"10. 입양 후 동물등록신고는 30일 안에 해야 한다.", "O"}
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
    document.getElementById('dogedu').addEventListener('ended', function () {
        alert('동영상이 끝났습니다. 이제 퀴즈를 풀어주세요.');
        document.getElementById('dogedu').style.display = 'none';
        document.getElementById('quiz').style.display = 'block';
        document.querySelector('h3').style.display = 'none';
        document.querySelector('p').style.display = 'none';
    });

    const video = document.getElementById('dogedu');
    //const quizDiv = document.getElementById('quiz');
    const quizForm = document.getElementById('dogquizForm');
   

    function videoEnded() {
        quizDiv.style.display = 'block';
        video.style.display = 'none';
    }
    
    video.addEventListener('ended', videoEnded);
    
  
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
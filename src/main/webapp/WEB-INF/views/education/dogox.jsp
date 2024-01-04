<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<%@ include file="../header.jsp" %>

    <title>그냥 데려가게</title>
    <style>
        .quiz-container {
            display: row;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        label {
            margin-right: 10px;
        }
    </style>

<div class="container text-center">
    <h1>강아지 OX Quiz</h1>

<form id="quizForm">
    <div id="quizContainer">
        <%
            String[][] questions = {
                {"1. 종합백신(DHPPL) 종류에 광견병이 포함된다.", "x"},
                {"2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다.", "o"},
                {"3. 광견병 예방접종은 매년 맞지 않아도 된다.", "x"},
                {"4. 강아지는 꽃은 먹어도 된다.", "x"},
                {"5. 임신중에 구충약 복용해야 한다.", "x"},
                {"6. 임신기간은 평균 9주이다.", "o"},
                {"7. 성견 치아는 40개 이상이다.", "o"},
                {"8. 강아지는 땀배출을 발바닥으로 한다.", "o"},
                {"9. 강아지 치석은 3개월 이상부터 생긴다.", "x"},
                {"10. 입양 후 동물등록신고는 30일 안에 해야 한다.", "o"}
            };

            for (int i = 0; i < questions.length; i++) {
        %>
        <div class="quiz-container">
            <p><%= questions[i][0] %></p>
            <label for="o<%= i %>">O</label>
            <input type="radio" name="answer<%= i %>" id="o<%= i %>" value="o">

            <label for="x<%= i %>">X</label>
            <input type="radio" name="answer<%= i %>" id="x<%= i %>" value="x">
        </div>
        <%
            }
        %>
    </div>
    <button type="button" onclick="checkAnswers()">결과 확인</button>
</form>

<script>
    function checkAnswers() {
        let score = 0;
        let allAnswered = true; // 모든 문제가 풀렸는지 여부

        <% for (int i = 0; i < questions.length; i++) { %>
        const selectedAnswer<%= i %> = document.querySelector('input[name="answer<%= i %>"]:checked');
        if (selectedAnswer<%= i %>) {
            const userAnswer<%= i %> = selectedAnswer<%= i %>.value;
            if (userAnswer<%= i %>.toLowerCase() === '<%= questions[i][1] %>') {
                score += 10;
            }
        } else {
            allAnswered = false; // 사용자가 모든 문제를 풀지 않았음
        }
        
        <% } %>

        if (allAnswered) {
            alert('퀴즈가 종료되었습니다. 총 점수는 ' + score + '점입니다.');
        } else {
            alert('모든 문제를 풀어주세요.');
        }
    }
    
     	// const resultWindow = window.open('', '_blank', 'width=400,height=200');
        // resultWindow.document.write(`<h2>퀴즈 결과</h2><p>총 점수: ${totalScore}점</p>`);

    </script>
</div>
<%@ include file="../footer.jsp" %>  
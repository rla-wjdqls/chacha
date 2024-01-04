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
    <h1>고양이 OX Quiz</h1>

<form id="quizForm">
    <div id="quizContainer">
        <%
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
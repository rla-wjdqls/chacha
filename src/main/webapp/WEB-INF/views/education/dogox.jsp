<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <style>
        .quiz-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        label {
            margin-right: 10px;
        }
    </style>
    
<%@ include file="../header.jsp" %>


  <h1>OX Quiz</h1>

    <form id="quizForm">
        <div id="quizContainer"></div>
        <button type="button" onclick="checkAnswers()">결과 확인</button>
    </form>

    <script>
        const questions = [
            "1. 지구는 태양 주위를 돈다. (o/x)",
            "2. 물은 100도에서 끓는다. (o/x)",
            "3. 1 + 1은 3이다. (o/x)",
            // ... 나머지 문제들 추가
        ];

        function initializeQuiz() {
            const quizContainer = document.getElementById('quizContainer');
            questions.forEach((question, index) => {
                const questionDiv = document.createElement('div');
                questionDiv.classList.add('quiz-container');
                questionDiv.innerHTML = `
                    <p>${question}</p>
                    <label for="o${index}">O</label>
                    <input type="radio" name="answer${index}" id="o${index}" value="o">

                    <label for="x${index}">X</label>
                    <input type="radio" name="answer${index}" id="x${index}" value="x">
                `;
                quizContainer.appendChild(questionDiv);
            });
        }

        function checkAnswers() {
            let totalScore = 0;

            questions.forEach((question, index) => {
                const selectedAnswer = document.querySelector(`input[name="answer${index}"]:checked`);

                if (selectedAnswer) {
                    const userAnswer = selectedAnswer.value;

                    if (userAnswer.toLowerCase() === 'o') {
                        totalScore += 10;
                    }
                }
            });

            alert(`퀴즈가 종료되었습니다. 총 점수: ${totalScore}점`);
        }

        initializeQuiz();
    </script>


<%@ include file="../footer.jsp" %> 
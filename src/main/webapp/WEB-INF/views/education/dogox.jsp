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
        
        .modal {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        z-index: 1000;
    }
    .modal-content2 {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            margin-top: 100px;
        }
    </style>

<div class="container text-center">
    <h1>강아지 OX Quiz</h1>

    <form id="quizForm">
        <div id="quizContainer">
            <%
                String[][] question = {
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

                for (int i = 0; i < question.length; i++) {
            %>
            <div class="quiz-container">
                <p><%= question[i][0] %></p>
                <label for="o<%= i %>">O</label>
                <input type="radio" name="answer<%= i %>" id="o<%= i %>" value="o">

                <label for="x<%= i %>">X</label>
                <input type="radio" name="answer<%= i %>" id="x<%= i %>" value="x">
            </div>
            <%
                }
            %>
        </div>
        <button type="button" onclick="quiz_sub()">결과 확인</button>
    </form>
    
    <!-- 모달 -->
	    <div id="resultModal" class="modal">
	     <div class="modal-content2">
	        <h2>퀴즈 결과</h2>
	        <div id="resultDetails"></div>
	        <p id="score"></p>
	        <button onclick="closeModal()">닫기</button>
	    </div>
	</div>
</div>
<script>
    function quiz_sub() {
        let score = 0;
        let allAnswered = true; // 모든 문제가 풀렸는지 여부
        let resultDetails = [];

        <% for (int i = 0; i < question.length; i++) { %>
            const selectedAnswer<%= i %> = document.querySelector('input[name="answer<%= i %>"]:checked');
            if (selectedAnswer<%= i %>) {
                const userAnswer<%= i %> = selectedAnswer<%= i %>.value;
                if (userAnswer<%= i %>.toLowerCase() === '<%= question[i][1] %>') {
                    score += 10;
                }
            } else {
                allAnswered = false; // 사용자가 모든 문제를 풀지 않았음
                resultDetails.push(`문제 ${i + 1}: 틀림 (정답: <%= question[i][1] %>)`);
            }
        <% } %>

        if (allAnswered) {
            const score = `총 점수는 ${score}점입니다.`;
            const resultText = resultDetails.length > 0 ? resultDetails.join('<br>') : '모든 문제를 맞추셨습니다.';

            // 모달창에 결과 표시
            document.getElementById('resultDetails').innerHTML = resultText;
            document.getElementById('score').innerHTML = score;
            openModal(); //모달열기
            
        } else {
            alert('모든 문제를 풀어주세요.');
        }
    }

    function openModal() {
        const modal = document.getElementById('resultModal');
        modal.style.display = 'block';
    }

    function closeModal() {
        const modal = document.getElementById('resultModal');
        modal.style.display = 'none';
    }

    
     	// const resultWindow = window.open('', '_blank', 'width=400,height=200');
        // resultWindow.document.write(`<h2>퀴즈 결과</h2><p>총 점수: ${totalScore}점</p>`);

    </script>


<%@ include file="../footer.jsp" %>  
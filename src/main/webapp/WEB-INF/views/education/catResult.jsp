<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>퀴즈 결과</title>

<%
    int score = 0;
    String[] userAnswers = new String[10];
    String[] correctAnswers = {"X", "O", "O", "X", "X", "O", "X", "O", "O", "O"};

 	// 질문 배열 추가
    String[] questions = {
   		 	"1. 고양이는 높은 곳에서 떨어져서 다치지 않는다.",
   		    "2. 고양이가 문어,전복을 먹으면 심장에 부담이 가므로 먹으면 안된다.",
   		    "3. 고양이는 폐경이 없다.",
   		    "4. 고양이는 관절염이 없다.",
   		    "5. 길고양이는 사람의 도움이 없어도 굶지 않는다.",
   		    "6. 고양이가 푸른 생선을 너무 많이 먹으면 배에 응어리가 만져진다.",
   		    "7. 고양이는 사람보다 시력이 좋다.",
   		    "8. 고양이는 단맛을 제한적으로 또는 전혀 느끼지 못한다.",
   		    "9. 고양이는 빨간색을 알아볼 수 없다.",
   		    "10. 고양이는 수태 후 평균 65일 만에 출산한다."
   };
 
    for (int i = 1; i <= 10; i++) {
        userAnswers[i - 1] = request.getParameter("qd" + i);
        if (userAnswers[i - 1] != null && userAnswers[i - 1].trim().equalsIgnoreCase(correctAnswers[i - 1])) {
            score += 10;
        }
    }
%>

<div class="container text-center">
    <h2>퀴즈 결과</h2>
    <p>총 점수는 <%= score %>점입니다.</p>
    <table class="table">
        <thead>
            <tr>
                <th>문제</th>
                <th>제출 답안</th>
                <th>정답</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < 10; i++) {
            %>
                <tr>
                    <td style="text-align:left"><%= questions[i] %></td>
                    <td><%= userAnswers[i] %></td>
                    <td><%= correctAnswers[i] %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
     <input type="button" class="btn btn-primary" onclick="eduList()" value="돌아가기">
</div>

<script>
    function eduList() {
        // educationList 페이지로 이동
        window.location.href = "./educationList";
    }
</script>
<%@ include file="../footer.jsp" %>
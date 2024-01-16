<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>퀴즈 결과</title>


<%
	
    int score = 0; 
    String[] userAnswers = new String[10];
    String[] correctAnswers = {"X", "O", "X", "X", "X", "O", "O", "O", "X", "O"};
 	// 질문 배열 추가
    String[] questions = {
        "1. 종합백신(DHPPL) 종류에 광견병이 포함된다.",
        "2. 동물 보호법으로 정해진 리드줄 길이는 2m 이하이다.",
        "3. 광견병 예방접종은 매년 맞지 않아도 된다.",
        "4. 강아지는 꽃은 먹어도 된다.",
        "5. 임신 중에 구충약 복용해야 한다.",
        "6. 임신기간은 평균 9주이다.",
        "7. 성견 치아는 40개 이상이다.",
        "8. 강아지는 땀배출을 발바닥으로 한다.",
        "9. 강아지 치석은 3개월 이상부터 생긴다.",
        "10. 입양 후 동물등록신고는 30일 안에 해야 한다."
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
    <!-- <p>총 점수는 ${quizResult.score}점입니다.</p> -->
    <p>총 점수는 <%= score %>점입니다.</p>
    <!-- <input type='hidden' name='score' id='score'> -->
    
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>퀴즈 결과</title>

<%
    int score = 0;
    String[] userAnswers = new String[10];
    String[] correctAnswers = {"X", "O", "X", "X", "X", "O", "O", "O", "X", "O"};

    for (int i = 1; i <= 10; i++) {
        userAnswers[i - 1] = request.getParameter("qd" + i);
        if (userAnswers[i - 1] != null && userAnswers[i - 1].equalsIgnoreCase(correctAnswers[i - 1])) {
            score += 10;
        }
    }
%>

<div class="container">
    <h2>퀴즈 결과</h2>
    <p>총 점수는 <%= score %>점입니다.</p>
    <table class="table">
        <thead>
            <tr>
                <th>문제</th>
                <th>사용자 답안</th>
                <th>정답</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 1; i <= 10; i++) {
            %>
                <tr>
                    <td><%= i %></td>
                    <td><%= userAnswers[i - 1] %></td>
                    <td><%= correctAnswers[i - 1] %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
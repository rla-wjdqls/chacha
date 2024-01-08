<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%
    String[] answers = {"X", "O", "X", "O", "X", "O", "X", "O", "X", "O"};
    
    // Jackson ObjectMapper를 사용하여 JSON 형식으로 변환
    ObjectMapper objectMapper = new ObjectMapper();
    String jsonAnswers = objectMapper.writeValueAsString(answers);

    out.print(jsonAnswers);
%>
<%@ include file="../footer.jsp" %>    
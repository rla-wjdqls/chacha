<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<div  class="title">후기글 삭제</div>
	
	<form name="frm" method="post" action="delete.do">
		<input type="hidden" name="arno" value="${requestScope.arno}">
		 <div class="content">
		 	<p>후기글을 삭제하시겠습니까?</p>
		 	<p>※첨부된 파일도 전부 삭제됩니다.</p>
		 </div>
		 
		 <div class='bottom'>
		 	<input type='submit' value='삭제'>
		 	<input type='button' value='목록' onclick="location.href='list.do'">
		 </div>

<%@ include file="../footer.jsp" %>      
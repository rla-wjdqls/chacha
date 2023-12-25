<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<div  class="title">목격/제보글 수정</div>
	
	<form name="frm" method="post" action="update.do">
		<input type="hidden" name="textno" value="${dto.textno}">
		 <table class='table'>
		 <tr>
		 	<th>목격/제보글 제목</th>
		 	<td><input type='text' name='title' size='50' value='${dto.texttitle}'></td>
		 </tr>
		 </table>
		 
		 <div class='bottom'>
		 	<input type='submit' value='수정'>
		 	<input type='button' value='목록' onclick="location.href='list.do'">
		 </div>
		 
	</form>


<%@ include file="../footer.jsp" %>      
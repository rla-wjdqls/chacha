<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

	<form name="frm" method="post" action="update.do">
		<input type="hidden" name="arno" value="${dto.arno}">
		 <table class='table'>
		 <tr>
		 	<th>입양후기글 제목</th>
		 	<td><input type='text' name='artitle' size='50' value='${dto.artitle}'></td>
		 </tr>
		 </table>
		 
		 <div class='bottom'>
		 	<input type='submit' value='수정'>
		 	<input type='button' value='목록' onclick="location.href='list.do'">
		 </div>
		 
	</form>


<%@ include file="../footer.jsp" %>      
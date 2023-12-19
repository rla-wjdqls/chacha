<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../header.jsp" %>
<style>
table, th, td {
	border: 1px solid white;
	background-color: #092139;
	width: 500px;
	height: 50px;
	text-align: center;
	
}
</style>
<h3> 봉사활동 모집글 </h3>

<input type="button" value="글쓰기" href="serviceForm.jsp">	
 <table>
 	<tr> 
	 <td>글번호</td>
	 <td>제목</td>
	 <td>아이디</td>
	 <td>모집인원</td>
	 <td>상태</td>
	 <td>조회수</td>
 	</tr>
 	<tr>
			<td colspan="4" style="text-align: center; height: 50px;">
				<form action="serviceList.jsp" onsubmit="return searchCheak()"><!-- myscript.jsp함수 작성함 -->
					<select name="col">
						<option value="stitle_sinfo">제목+내용
						<option value="stitle">제목
						<option value="sinfo">내용
						<option value="uid">아이디				
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색">	
				</form>
			</td>
		</tr>	  
 </table>
 
<%@ include file="../footer.jsp" %>      
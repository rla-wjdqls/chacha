<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../header.jsp" %>
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 23px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 23px"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #F3BD00">봉사활동</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 23px"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #F3BD00">봉사활동모집글</span></a>
			</li>
		</ul>
	</nav>
<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<p><h3> [봉사활동 모집글] </h3></p>
		</div>
	</div>
</div>
<div style="text-align: right; height: 50px;">
	<a href="/service/serviceForm.jsp"><input type="button" value="글쓰기"></a>
</div>
<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
 			<table style="text-align: center; background-color: #0C2B4B; border: 1px solid white; width: 500px; height: 50px;"> 
 				<tr>
					 <td>글번호</td>
					 <td>제목</td>
					 <td>아이디</td>
					 <td>모집인원</td>
					 <td>상태</td>
					 <td>조회수</td>
 				</tr>
 			</table>
		</div>
	</div>
</div>
<div style="text-align: center;">
 <table>
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
 </div>
 
<%@ include file="../footer.jsp" %>      
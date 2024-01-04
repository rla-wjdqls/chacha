<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<style>
.right {
  float: right;
}
</style>
		<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575; margin-left: 15px;" alt="홈으로"></i></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">반려이야기</span></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">목격/제보</span></a>
				</li>
			</ul>
		</nav>
		
<!-- 본문 시작 template.jsp -->
<div class="container text-center">
	 <h3> 목격/제보 게시판 </h3>

<p><a href="/help/helpForm" class="right">[글쓰기]</a></p><br><br>

<form name="helpfrm" id="helpfrm" method="post" action="help">

	<table class="table table-hover container">
	<thead>
		<tr class="success">
			<th>글번호</th>
			<th>제목</th>	
			<th>조회수</th>	
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
    		<c:forEach items="${helpList}" var="row">
    			<tr>
    				<td><a href="helpDetail?textno=${row.textno}">${row.textno}</a></td>
    				<td><a href="helpDetail?textno=${row.textno}">${row.texttitle}</a></td>
    				<td>${row.cnt}</td>
    				<td>${row.uid}</td>
    				<td>${row.uploaddate}</td>
    				
    			</tr>
    		</c:forEach>
 	</tbody>
 	</table>

<!-- 검색 시작 -->
	<table class="table">
		<tr>
			<td colspan="4" style="text-align:center; height:50px;">
				<form action="helpList.jsp" onsubmit="return helpCheck()"><!-- help.js함수 작성 안 함 -->
					<select name="col">
						<option value="texttitle_text">제목+내용
						<option value="texttitle">제목
						<option value="text">내용
						<option value="uid">작성자
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">
				</form>			
			</td>
		</tr>
	</table>	
	
		 


<!-- 본문 끝 -->
		
</form>
</div>

<%@ include file="../footer.jsp" %>      
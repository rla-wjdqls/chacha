<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

		<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
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
<h3> 목격/제보 게시판 </h3>

<p><a href="/help/helpForm">[글쓰기]</a></p>

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
    		<c:forEach items="${list}" var="row">
    			<tr>
    				<td>${row.textno}</td>
    				<td>${row.texttitle}</td>
    				<td>${row.cnt}</td>
    				<td>${row.uid}</td>
    				<td>${row.uploaddate}</td>
    				<td>
    					<input type="button" value="삭제" onclick="helpDelete(${row.textno})">	
    				</td>
    			</tr>
    		</c:forEach>
 










<!-- 검색 시작 -->
		
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
		
	</tbody>
 	</table>
		 


<!-- 본문 끝 -->
		
</form>


<%@ include file="../footer.jsp" %>      
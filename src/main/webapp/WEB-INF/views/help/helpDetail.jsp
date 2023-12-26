<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<script>
function hdelete() {
	if(confirm("삭제하겠습니까?")) {//자바스크립트 내장함수
		$("#helpDelete").submit();
	} else {
		
	}
}
</script>

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


<div style="text-align: right; height: 50px;">
	<p><a href="/help/helpList" class="nav-item nav-link"><input type="button" value="글목록"></a></p>	
</div>

<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<p><h3> [목격/제보글 상세보기] </h3></p>
		</div>
	</div>
</div>

<div class="container">
	<table>
	  <tr>
		<th>글번호</th>
		<td>${helpd.textno}</td>
	  </tr>
	 
	  <tr>
	  	<th>제목</th>
		<td>${helpd.texttitle}</td>
	  </tr>
	  
	  <tr>
	  	<th>조회수</th>
		<td>${helpd.cnt}</td>
	  </tr>
	  
	  <tr>
	  	<th>작성자</th>
		<td>${helpd.uid}</td>
	  </tr>
	  
	  <tr>
	  	<th>작성일</th>
		<td>${helpd.uploaddate}</td>
	  </tr>
	</table>
</div>
<form id="helpDelete" name="helpDelete" method="post" action="/help/helpDelete">
	<input type="hidden" name="textno" id="textno" value="${helpd.textno}"/>
</form>              

<div style="text-align:center; height: 50px; padding-top: 15px;">
	<p><a href="/help/helpUpdate?textno=${helpd.textno}">
	<input type="button" value="수정" style="background-color: azure;"></a> &nbsp;
	<input type="button" onclick="hdelete();" value="삭제"> &nbsp;
	<input type="button" value="신청"></p>
</div>






<%@ include file="../footer.jsp" %>      
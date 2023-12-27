<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<style>
.right {
  float: right;
}

th{
width: 10%;
}

td{
width: 40%;
}
</style>
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


<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<h3> 목격/제보글 상세보기 </h3>
			<p><a href="/help/helpList" class="right">[글목록]</a></p><br><br>
		</div>
	</div>
</div>

<div class="container text-center">
	<table class="table table-hover container">
	<thead>
	  <tr class="success">
	  	<th>제목</th>
		<td colspan="3">${helpd.texttitle}</td>
	  </tr>
	  
	  <tr>
	    <th>글번호</th>
		<td>${helpd.textno}</td>
	  
	  	<th>작성자</th>
		<td>${helpd.uid}</td>
		
	  </tr>
	  
	  <tr>
		  <th>내용</th>
		  <td colspan="3">${helpd.text}</td>
	  </tr>
	  
	  <tr>
		  <th>첨부파일</th>
		  <td colspan="3">${helpd.helppic}</td>
	  </tr>
	  
	  <tr>
	  	<th>조회수</th>
		<td>${helpd.cnt}</td>
		
	  	<th>작성일</th>
		<td>${helpd.uploaddate}</td>
	  </tr>
	  </thead>
	</table>
</div>
<form id="helpDelete" name="helpDelete" method="post" action="/help/helpDelete">
	<input type="hidden" name="textno" id="textno" value="${helpd.textno}"/>
</form>              

<div style="text-align:center; height: 50px; padding-top: 15px;">
	<p><a href="/help/helpUpdate?textno=${helpd.textno}">
	<input type="button" class="btn btn-success" value="수정"></a>
	<input type="button" class="btn btn-danger" onclick="hdelete();" value="삭제"> &nbsp;
	</p>
</div>






<%@ include file="../footer.jsp" %>      
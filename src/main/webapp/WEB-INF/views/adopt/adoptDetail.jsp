<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<style>
.right {
  float: right;
}

.left {
  float: left;
}

th{
width: 10%;
}

td{
width: 40%;
}
</style>
<script>
function adelete() {
	if(confirm("삭제하겠습니까?")) {//자바스크립트 내장함수
		$("#adoptDelete").submit();
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
         <a><span style="color: #757575">입양 후기</span></a>
      </li>
   </ul>
</nav>


<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<h3> 입양 후기글 상세보기 </h3>
			<p><a href="/adopt/adoptReview" class="left">[글목록]</a></p>
			<p><a href="/adopt/adoptUpdate?arno=${adoptd.arno}">
			<input type="button" class="btn right" value="수정"></a>
			<input type="button" class="btn right" onclick="adelete();" value="삭제">
			</p>
		</div>
	</div>
</div>

<form id="adoptDelete" name="adoptDelete" method="post" action="/adopt/adoptDelete">
	<input type="hidden" name="arno" id="arno" value="${adoptd.arno}"/>
</form> 
<!-- <div style="text-align:center; height: 50px; padding-top: 15px;">
	<p><a href="/adopt/adoptUpdate?arno=${adoptd.arno}">
	<input type="button" class="btn btn-success" value="수정"></a>
	<input type="button" class="btn btn-danger" onclick="adelete();" value="삭제"> &nbsp;
	</p>
</div> -->

<div class="container text-center">
	<table class="table table-hover container">
	<thead>
	  <tr class="success">
	  	<th>제목</th>
		<td colspan="3">${adoptd.artitle}</td>
	  </tr>
	  
	  <tr>
	    <th>글번호</th>
		<td>${adoptd.arno}</td>
	  
	  	<th>작성자</th>
		<td>${adoptd.uid}</td>
		
	  </tr>
	  
	  <tr>
		  <th>내용</th>
		  <td colspan="3">${adoptd.arinfo}</td>
	  </tr>
	  
	  <tr>
		  <th>첨부파일</th>
		  <td colspan="3">
		  <img src="../storage/${adoptd.arimg}" width="400"></td>
	  </tr>
	  
	  <tr>
	  	<th>조회수</th>
		<td>${adoptd.cnt}</td>
		
	  	<th>작성일</th>
		<td>${adoptd.ardate}</td>
	  </tr>
	  </thead>
	</table>
</div>
             








<%@ include file="../footer.jsp" %>      
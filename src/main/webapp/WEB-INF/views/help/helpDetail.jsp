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

.btnn {
        border-radius: 15px; /* 원하는 모서리의 반지름 값을 지정합니다. */
        padding: 6px 9px; /* 원하는 패딩 값을 지정합니다. */
        border: none;

.gray {
        background-color: gray; /* 원하는 회색 값으로 변경합니다. */
        color: white; /* 텍스트 색상을 조절합니다. */
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
		  <td colspan="3">
		  <img src="../storage/${helpd.helppic}" width="400"></td>
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
	<input type="button" class="btnn btn-primary" value="수정"></a>
	<input type="button" class="btnn gray" onclick="hdelete();" value="삭제"> &nbsp;
	</p>
</div>






<%@ include file="../footer.jsp" %>      
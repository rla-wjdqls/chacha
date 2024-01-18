<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<style>
.right {
  float: right;
}

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
         color: white;
}
.gray {
        background-color: #D5D5D5; /* 원하는 회색 값으로 변경합니다. */
        color: white; /* 텍스트 색상을 조절합니다. */
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
			<p><a href="/adopt/adoptReview" class="right">[글목록]</a></p>
			
		</div>
	</div>
</div>

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
		  <c:if test="${adoptd.arimg != '-'}">
			  <td colspan="3">
			  <img src="../storage/${adoptd.arimg}" width="400"></td>
		  </c:if>
		   <c:if test="${adoptd.arimg == '-'}">
			  <td colspan="3">
			  <span>첨부파일이 없습니다.</span>
		  </c:if>
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

<form id="adoptDelete" name="adoptDelete" method="post" action="/adopt/adoptDelete">
	<input type="hidden" name="arno" id="arno" value="${adoptd.arno}"/>
</form> 

<div style="text-align:center; height: 50px; padding-top: 15px;">          
			<p><a href="/adopt/adoptUpdate?arno=${adoptd.arno}">
			<input type="button" class="btnn btn-primary" value="수정"></a>
			<input type="button" class="btnn gray" onclick="adelete();" value="삭제">
			</p>
</div>






<%@ include file="../footer.jsp" %>      
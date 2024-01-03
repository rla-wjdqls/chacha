<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
table {
	width: 80%; text-align: center;
}
table thead {
	text-align: center; background-color: #0C2B4B; border: 1px solid black;
}
tbody td {
	text-align: center; background-color: white; border: 1px solid black;
}

</style>
<nav class="navbar navbar-light bg-light" style="height: 42px">
    <ul class="list-inline ml-auto" style="align-items: center;">
      <li class="list-inline-item">
         <a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동</span></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동 모집글</span></a>
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
	<p><a href="/service/serviceForm" class="nav-item nav-link"><input type="button" value="글쓰기"></a></p>
</div>
	<table style="margin-left: auto; margin-right: auto;">
		<thead> 
			<tr>
			 	 <td>봉사글번호</td>
				 <td>아이디</td>
				 <td>제목</td>
				 <td>모집시작날짜</td>
				 <td>모집종료날짜</td>
				 <td>봉사시간</td>
				 <td>모집인원</td>
				 <td>상태</td>
				 <td>조회수</td>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach items="${serviceList}" var="myservice" >
                <tr>  	
                    <td><a href="servicedetail?sno=${myservice.sno}">${myservice.sno}</td>
                    <td>${myservice.uid}</td>
                    <td><a href="servicedetail?sno=${myservice.sno}">${myservice.stitle}</td>
                    <td>${myservice.ssdate}</td>
                    <td>${myservice.sedate}</td>
                    <td>${myservice.time}</td>
                    <td>${myservice.sp}</td>
                    <td>${myservice.sstate}</td>
                    <td>${myservice.cnt}</td>
                </tr>
  			</c:forEach>
  		</tbody>	  
  </table>
<div style="text-align: center;">
 <table class="table">
 	<tr>
		<td colspan="4" style="text-align: center; height: 50px;">
			<form action="serviceList.jsp" onsubmit="return searchCheak()"><!-- myscript.jsp함수 작성함 -->
				<select name="col">
					<option value="stitle_sinfo">제목+내용
					<option value="stitle">제목
					<option value="sinfo">내용
					<option value="uid">아이디				
				</select>
					<input type="text" name="word" id="word" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">	
			</form>
		</td>
	</tr>

 </table>
 </div>

<%@ include file="../footer.jsp" %>      
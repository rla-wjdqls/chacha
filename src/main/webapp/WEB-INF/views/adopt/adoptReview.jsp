<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<style>
.right {
  float: right;
}
.btnn {
        border-radius: 100px; /* 원하는 모서리의 반지름 값을 지정합니다. */
        padding: 5px 7px; /* 원하는 패딩 값을 지정합니다. */
        border: none;
        background-color: white;
        color: #F3BD00;
        
        }
        
.yellow {
		background-color: white;
        color: #F3BD00;
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
					<a><span style="color: #757575">입양 후기</span></a>
				</li>
			</ul>
		</nav>
<div class="container text-center"> <h3>입양 후기 게시판</h3>
<input type="button" class="btnn yellow right mb-3" onclick="idPopup()" value="[글쓰기]">
<!-- <p><a href="/adopt/adoptForm" onclick="idPopup()" value="[글쓰기]"></a></p> -->


<form name="adoptfrm" id="adoptfrm" method="post" action="adopt">

	<%
        // 세션에서 로그인 여부 확인
        String loggedInUser = (String) session.getAttribute("s_id");
	
    %>
    
	<table class="table table-hover container">
	<thead>
		<tr class="success">
			<th>후기글번호</th>
	   <!-- <th>입양동물</th> -->
			<th>제목</th>		
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
    		<c:forEach items="${adoptReview}" var="row">
    			<tr>
    				<td><a href="adoptDetail?arno=${row.arno}">${row.arno}</a></td>
    		<!-- 	<td>${row.anino}</td> -->
    				<td><a href="adoptDetail?arno=${row.arno}">${row.artitle}</a></td>
    				<td>${row.uid}</td>
    				<td>${row.ardate}</td>
    				<td>${row.cnt}</td>
    				
    			</tr>
    		</c:forEach>
 </tbody>
 	</table>
 	
 	<!-- 검색 시작 -->
		
		<tr>
			<td colspan="4" style="text-align:center; height:50px;">
				<form action="adoptReview" onsubmit="return adoptCheck()"><!-- adopt.js함수 작성 안 함 -->
					<select name="col">
						<option value="artitle_text">제목+내용
						<option value="artitle">제목
						<option value="arinfo">내용
						<option value="uid">작성자
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">
				</form>			
			</td>
		</tr>	
</form>
</div>

<script>
	
    
 	// JSP에서 세션 값을 JavaScript로 전달
    var loggedInUser = '<%= loggedInUser %>';

    
    function idPopup(){ 
		let uid = '<%= (String)session.getAttribute("s_id") %>';
		if(uid == "null"){
			uid = "";
		}
		//alert(uid);
		if(uid.length === 0){
			alert("로그인 후 이용 바랍니다.");
		}else{
			window.location.href = '/help/helpForm'; //글쓰기 페이지로 이동
		}//if end
   }//idPopup() end
	
</script>


<%@ include file="../footer.jsp" %>      
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
					<a><span style="color: #757575">목격/제보</span></a>
				</li>
			</ul>
		</nav>
		
<!-- 본문 시작 template.jsp -->
<div class="container text-center">
	 <h3> 목격/제보 게시판 </h3>

<input type="button" class="btnn yellow right mb-3" onclick="idPopup()" value="[글쓰기]">
<!-- <p><a href="/help/helpForm" class="right" onclick="idPopup()">[글쓰기]</a></p><br><br> -->

	<%
        // 세션에서 로그인 여부 확인
        String loggedInUser = (String) session.getAttribute("s_id");
	
    %>
    
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
    		<tr>
  				<td colspan="9">
  					<c:if test="${startNavi ne 1 && startNavi > 0}">
  						<a href="/help/helpList?page=${startNavi-1}">이전</a>
  					</c:if>
  					<c:forEach var="p" begin="${startNavi}" end="${endNavi}">
  						<a href="/help/helpList?page=${p}">${p}</a>
  					</c:forEach>
  					<c:if test="${endNavi ne maxPage}">
  						<a href="/help/helpList?page=${endNavi+1}">다음</a>
  					</c:if>
  				</td>
  			</tr>
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
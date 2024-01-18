<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->
<% String s_id = (String)session.getAttribute("s_id"); %>

	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
	<!-- 목격제보, 입양후기, 봉사글, 입양동물, (교육? 테이블 없음) -->
	<!-- 어느 게시판 글인지 어떻게 보여줄지 아직 미정 --> 

	<div class="container">
	<br><br>
		<h4>글목록</h4>
		<p>내가 쓴 글목록을 확인 할 수 있습니다</p>
		<p>총 게시물 : ${totalPost} 개</p><br>
	
<!-- 	<input type="button" value="전체선택" class="btn btn default" onclick="toggleAllCheckboxes()">
	<input type="button" value="삭제" class="btn btn_del" name="btn_del" id="btn_del"> -->
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${myHelpList}" var="myhelp">
	    <c:if test="${s_id eq myhelp.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td>${myhelp.textno}</td>
	            <td><a href="/help/helpDetail?textno=${myhelp.textno}">${myhelp.texttitle}</a></td>
	            <td>${myhelp.cnt_help}</td>
	            <td><fmt:formatDate value="${myhelp.uploaddate}" pattern="yyyy-MM-dd" /></td>
	        </tr>
	    </c:if>
		</c:forEach>
		<c:forEach items="${myAdoprvList}" var="myadoprv">
	    <c:if test="${s_id eq myadoprv.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td>${myadoprv.arno}</td>
	            <td>${myadoprv.artitle}</td>
	            <td>${myadoprv.cnt_adoprv}</td>
	            <td><fmt:formatDate value="${myadoprv.ardate}" pattern="yyyy-MM-dd" /></td>
	        </tr>
	    </c:if>
		</c:forEach>
        </tbody>
    </table>
    		<!-- 검색 시작  -->	 
    	<div class="text-center">
		 <tr>
		 	<td colspan='4' style='text-align:center'; height: 50px;>
		 		<form action="bbsList.jsp" onsubmit="return searchCheck()"><!-- myscript.js 함수 작성함 -->
		 			<select name="col">
		 				<option value="subject_content">제목+내용
		 				<option value="subject">제목
		 				<option value="content">내용
		 			</select>
					<input type="text" name="word" id="word">		 		
					<input type="submit" value="검색" class="btn">		 		
		 		</form>
		 	</td>
		 </tr>
		 </div>
		<!-- 검색 끝   -->	

  <!--  
    <div class="text-center">
	<form id="searchFrm" name="searchFrm" action="searchList" method="get">
		<select name="type" id="type">
			<option value="title" <c:if test="${type eq 'title'}">selected</c:if>>제목</option>
			<option value="content" <c:if test="${type eq 'content'}">selected</c:if>>내용</option>
			<option value="titlect"
				<c:if test="${type eq 'titlect'}">selected</c:if>>제목+내용</option>
		</select> 
		<input class="inputId" type="text" name="keyword"
			placeholder="검색어 입력해주세요" value="${keyword}" />
		<button class="btn" type="submit">검색</button>
	</form>
	
</div>
-->
		</div>
	</div>

<script>

/* 
$("#btn_del").click(function(){
	alert();
})//click end


function toggleAllCheckboxes() {
	//alert();
	
	
    // 테이블 본문에 있는 모든 체크박스 가져오기
    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');

    // "전체선택" 체크박스 가져오기
    var selectAllCheckbox = document.getElementById('selectAllCheckbox');

    // "전체선택" 체크박스의 상태에 따라 모든 체크박스의 상태 설정
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
    });
	
} */


</script>













<%@ include file="./mypageFooter.jsp" %>      
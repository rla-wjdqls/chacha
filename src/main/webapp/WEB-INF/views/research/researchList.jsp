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
					<a><span style="color: #757575">설문조사</span></a>
				</li>
			</ul>
		</nav>
<br>
<div class="container text-center"> <h3>설문조사</h3>
	<div class="container">
		<p>설문조사 페이지 입니다</p>
		<hr><br><br>
		<div class="container-line">
			<h5>여러분의 의견을 들려주세요~</h5>
			<br>
			<!--db 불러오기 -->
 			<div class="container-fixed row">
				<c:forEach items="${researchList}" var="list">
					  	<div class="col-sm-4 col-md-4">
					  		<br>
					    	<h5>${list.rtitle}</h5>
					    	<p>${list.rdate1} ~ ${list.rdate2}</p>
					    <c:choose>
			                <c:when test="${list.rstate eq 'I'}">진행중</c:when>
			                <c:when test="${list.rstate eq 'E'}">마감</c:when>
		            	</c:choose>
		            	<br><br>
		            <c:if test="${list.rstate ne 'E'}">
		           	 <a href="/research/researchForm?rno=${list.rno}" class="btn btn-primary">바로가기</a>
		            </c:if>
		            <a href="/research/researchResult?rno=${list.rno}" class="btn btn-success">결과보기</a>
<<<<<<< HEAD
					  </div>
=======
					  	</div>
>>>>>>> 6293c8d4ebd3617f07d75ea1c3c1bf222f0f3e1c
				</c:forEach>
			</div>
			
			</div>
				<br><br>
				<a href="/research/researchReg" class="btn btn">설문조사 등록하기</a>
				<br><br>
			</div>
			</div>
		</div>
	<br><br><br>


<!-- 본문 끝 -->






<%@ include file="../footer.jsp" %>     








 
 
 
 
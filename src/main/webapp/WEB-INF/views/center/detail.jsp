<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline ml-auto" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">보호소</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">입양대기 동물소개</span></a>
			</li>
		</ul>
	</nav>

<div class="container-fluid">
	<h3 style="text-align: center">${center.aname}</h3>
		<nav class="navbar navbar-light i-nav">
  			<div class="input-container" style="display: inline-block;">
		      <form class="d-flex">
		        <button class="btn btn-warning rotate-text" type="button" onclick="location.href='centerWrite'">수정</button>
		        <button class="btn btn-danger rotate-text" type="submit">삭제</button>
		      </form>
		    </div>
		</nav>
		
<input type="hidden" name="anino" value="${animal.anino}">

		<div class="container">
			<c:if test="${center.anipic != '-'}">
				<img src="/storage/${center.anipic}" style="display: inline-block" width="250px">
			</c:if>
			<tr>
					<th>나이</th>
					<td>${center.age}</td>
				</tr>
			
			<table class="table" style="text-align: right; margin-left: 30px">
				<tr>
					<th>나이</th>
					<td>${center.age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${center.age}</td>
				</tr>
				<tr>
					<th>무게</th>
					<td>${center.weight}</td>
				</tr>
				<tr>
					<th>중성화여부</th>
					<td>${center.genop}</td>
				</tr>
				<tr>
					<th>접종여부</th>
					<td>${center.vac}</td>
				</tr>
				<tr>
					<th>입양가능여부</th>
					<td>${center.adopt_pos}</td>
				</tr>
			</table>
		</div>	
		
	<div>
		
	</div>

<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
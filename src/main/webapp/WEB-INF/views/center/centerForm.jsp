<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<% 
	String s_mlevel = (String)session.getAttribute("m_mlevel");
%>
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
				<a><span style="color: #757575">입양대기 동물</span></a>
			</li>
		</ul>
	</nav>

<div class="container-fluid">
	<h3 style="text-align: center">입양대기 동물</h3>
		<nav class="navbar navbar-light i-nav">
  			<div class="input-container" style="display: inline-block;">
		      <form class="d-flex">
		        <input class="form-control me-2" type="text" placeholder="Search" style="width: 300px" >
		        <c:choose>
		        <c:when test="${s_mlevel eq 'c' or empty s_mlevel}">
		        <button class="btn btn-success rotate-text" type="submit">검색</button>
		        </c:when>
		        <c:otherwise>
		        <button class="btn btn-warning rotate-text" type="button" onclick="location.href='centerWrite'">동물 추가</button>
		        </c:otherwise>
		        </c:choose>
		      </form>
		      
		    </div>
		</nav>

	   
	<div class="container-fixed row">
			<c:forEach items="${form}" var="row" varStatus="vs">
				<c:if test="${row.adopt_pos != 'N'}">
					<div class="card" style="width: 18rem;">
						<c:choose>
							<c:when test="${row.anipic == '-' || empty row.anipic}">
							  	<img src="/img/noimg.png" class="card-img-top img-fixed img-fluid">
							</c:when>
				  			<c:otherwise>
				  				<img src="/storage/${row.anipic}" class="card-img-top img-fixed img-fluid">
				  			</c:otherwise>
				  			
				  		</c:choose>
			
				  	<div class="card-body">
				    	<h5 class="card-title">${row.aname}</h5>
				    	<p class="card-text">${row.age}</p>
				    	<a href="detail?anino=${row.anino}" class="btn btn-primary">보러가기</a>
				  	</div>
			   		</div>
			
				</c:if>
			</c:forEach>
		   
	</div>
</div>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
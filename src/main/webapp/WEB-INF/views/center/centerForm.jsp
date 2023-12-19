<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline" style="align-items: center; text-align: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 23px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 23px"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #F3BD00">보호소</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 23px"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #F3BD00">입양대기 동물</span></a>
			</li>
		</ul>
	</nav>

<div class="ontainer-fluid">
	<h3 style="text-align: center">입양대기 동물</h3>
		<nav class="navbar navbar-light">
		  <div class="container-fluid" style="display: center">
		      <form class="d-flex">
		        <input class="form-control me-2" type="search" placeholder="Search" style="display: center">
		        <button class="btn btn-outline-success rotate-text" type="submit">검색</button>
		        <button class="btn btn-outline-warning rotate-text" type="submit">동물 추가</button>
		        <button class="btn btn-outline-danger rotate-text" type="submit">동물 삭제</button>
		      </form>
		  </div>
		</nav>

	   
	
	
	<div class="row">
		   <div class="card" style="width: 18rem;">
			  <img src="../img/dalgu1.jpg" class="card-img-top img-fixed img-fluid" alt="달구">
			  <div class="card-body">
			    <h5 class="card-title">달구/3살</h5>
			    <p class="card-text">간단한 소개?</p>
			    <a href="#" class="btn btn-primary">보러가기</a>
			  </div>
		   </div>
		   <div class="card" style="width: 18rem;">
			  <img src="../img/coco1.jpg" class="card-img-top img-fixed img-fluid" alt="코코">
			  <div class="card-body">
			    <h5 class="card-title">코코/3살</h5>
			    <p class="card-text">간단한 소개?</p>
			    <a href="#" class="btn btn-primary">보러가기</a>
			  </div>
			</div>
	</div>
</div>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
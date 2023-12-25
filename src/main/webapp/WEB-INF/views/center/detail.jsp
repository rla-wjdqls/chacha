<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./centerheader.jsp" %>

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
		<form name="centerfrm" id="centerftm" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${center.anino}" name="anino">
		<nav class="navbar navbar-light i-nav">
  			<div class="input-container" style="display: inline-block;">
				   <input type="button" value="수정" class="btn btn-warning rotate-text" onclick="center_Update()">
				   <input type="button" value="삭제" class="btn btn-danger rotate-text" onclick="center_delete()">
		    </div>
		 
		</nav>
	

		<div class="container">
			<div class="container"   >
				<c:if test="${center.anipic != '-'}">
					<img src="/storage/${center.anipic}" style="float: left; margin-right: 20px;" width="270px" >
				</c:if>
			</div>
			
			
			<div class="container-1 rotate-text"> 
				<dl class="anidl" style="float: left">
					<dt class="anidt">나이</dt>
					<dd class="anidd" id="anidd">${center.age}살</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">성별</dt>
					<dd class="anidd">${center.gender}</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">몸무게</dt>
					<dd class="anidd">${center.weight}</dd>
				</dl>
				<dl class="anidl" >
					<dt class="anidt" >중성화여부</dt>
					<dd class="anidd" >${center.genop}</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">예방접종여부</dt>
					<dd class="anidd">${center.vac}</dd>
				</dl>
				<dl class="anidl" >
					<dt class="anidt">입양가능여부</dt>
					<dd class="anidd">${center.adopt_pos}</dd>
				</dl>
			</div>
			
			<div class="icon-heart">
				<i class="bi bi-heart" onclick="center_jjim()"></i>
			</div>
			
			<div class="d-grid gap-2 d-md-block" >
			  <button class="btn btn-primary" type="button">신청하기</button>
			</div>
			<hr>
			<div>
				<p style="text-align: center">
				${center.intro}
				</p>
			</div>
		</div>	
		</form>
	</div>	

		


<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
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
		<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
		<hr><br><br>
		<div class="container-line">
			<h5>여러분의 의견을 들려주세요~<h5>
			<form class="modifycheck" id="modifycheck" action="myInfoModify" method="post" onsubmit="return checkModify()" >
				<input type="submit" value="설문조사 하러가기" class="btn btn">
			</form>
			<br><br>
		</div>
		</div>
	</div>
	<br><br><br>


<!-- 본문 끝 -->
		
</form>
</div>


<%@ include file="../footer.jsp" %>      
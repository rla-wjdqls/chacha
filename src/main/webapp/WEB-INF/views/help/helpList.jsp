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
					<a><span style="color: #757575">목격/제보</span></a>
				</li>
			</ul>
		</nav>
<!-- 본문 시작 template.jsp -->
<h3> 목격/제보 게시판 </h3>

<p><a href="/help/helpForm">[글쓰기]</a></p>

<form name="helpfrm" id="helpfrm" method="post" action="help">
</form>

<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
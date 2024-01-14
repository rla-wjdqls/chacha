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
		<p>설문조사에 참여해 주세요</p>
		<hr><br><br>
		 <div class="container-line" id="surveyContainer">
			<!-- 이 부분에 내용 들어감 질문1 시작-->
			<div id="panel"></div>

			<div class="container-fixed row">
				설문번호 :  ${researchList2.rno}<br>
				제목 :  	  ${researchList2.rtitle}<br>
				설문 기간 : ${researchList2.rdate1} ~ ${researchList2.rdate2}<br>
				등록일자 :  ${researchList2.rgdate}<br>
			</div>
			<br><hr><br>
			
		  <!-- 설문폼 시작 -->
			<div class="researchResult" name="researchResult" id="researchResult"></div>  
			<br><br><br>
        </div>
		</div>
	</div>
	<br><br>


<!-- 본문 끝 -->












<%@ include file="../footer.jsp" %>     








 
 
 
 
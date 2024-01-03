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
		 <div class="container-line" id="surveyContainer">
            <!-- 설문조사 내용이 여기에 동적으로 추가될 것입니다. -->
            <!-- 선택하지 않았을 경우 페이지 넘어가지 않음 -->

			<!-- 이 부분에 내용 들어감 -->
			<div id="panel"></div>
			<br><br><br>
           <!--  <input type="button" value="이전" class="btn btn" name="btn_research_p" id="btn_research_p" onclick="click()"> -->
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
        </div>
		</div>
	</div>
	<br><br><br>

<script>


/* $("#btn_research_n").click(function(){
	$.get("researchNext", researchProc);
})//click() end

function researchProc(result){
	$("#panel").html(result);
}//researchProc() end */



var currentQuestionNumber = 1; // 초기 질문 번호 설정

$("#btn_research_n").click(function(){
    $.get("researchNext", { questionNumber: currentQuestionNumber }, researchProc);
})

function researchProc(result){
    $("#panel").html(result);
    currentQuestionNumber++; // 다음 질문 번호로 업데이트
}





</script>
<!-- 본문 끝 -->







<%@ include file="../footer.jsp" %>     








 
 
 
 
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
			<br><hr>
			
		  <!-- 설문폼 시작 -->
		  <div class="row">
		    <div class="col-sm-12"><!-- 목록 -->
				<div class="researchrForm"></div>  
		  	</div><!-- col end -->
		  </div><!-- row end -->
			<br><br><br>
           <!--  <input type="button" value="이전" class="btn btn" name="btn_research_p" id="btn_research_p" onclick="click()"> -->
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
        </div>
		</div>
	</div>
	<br><br><br>


<!-- 본문 끝 -->


<script>


$(document).ready(function () {
	//alert("페이지 호출");
	
    // 페이지 로드 시 설문조사 데이터를 가져오는 Ajax 호출
    /*
    $.ajax({
        type: "post",
        url: "/research/researchrForm", // 서버에서 설문조사 데이터를 반환하는 엔드포인트
        dataType: "json",
        success: function (result) {
            // 받아온 데이터를 기반으로 동적으로 HTML을 생성하여 추가
            alert(result);
            console.log(data);
            //renderSurvey(data);
        },
        error: function (xhr, status, error) {
        	console.error(error);
        }
    });
	*/
	loadForm();
});

var questionNo = 1; // 초기 질문번호
//questionNo++;

function loadForm() {
    var newHtml =
       ' <form name="researchrFrm" id="researchrFrm">' +
	    <!-- 부모글 번호 -->
		'<input type="hidden" name="rno" id="rno" value="${researchList.rno}">' +
		'<p id="qcont" name="qcont">질문' + questionNo + ' : ${researchForm.qcont}</p>' +
		<!--reply에 저장 -->
		'<c:forEach items="${researchChoice}" var="choice">' +
		'	  	<div class="col-sm-4 col-md-4">' +
		'	  		<input type="checkbox">${choice.choice}' +
		'	  	</div>' +
		'</c:forEach>' +
		'</form>';

		
		 // 추가된 질문에 대해 카운트 증가
        
		 $("#researchrForm").html(newHtml);
		
	
	/*
    // 받아온 데이터를 기반으로 동적으로 HTML을 생성하여 추가
    var surveyContainer = $("#surveyContainer");

    // 예시: 각 질문을 순회하면서 동적으로 HTML 생성
    for (var i = 0; i < data.questions.length; i++) {
        var question = data.questions[i];
        var questionHTML = '<h5>' + question + '</h5>';
        surveyContainer.append(questionHTML);
    }
	*/
}//end


 var answer1; 

function moveToNextPage() {
    // 여기서는 다음 페이지로 이동할 때 필요한 데이터를 서버로 전송하는 예시입니다.
    var surveyData = {
        answer1: $('input[name="survay1"]:checked').val(),
    };

    $.ajax({
        url: "getNextQuestion", // 서버에 전송할 엔드포인트
        method: "POST",
        data: { answer1: answer1 },
        success: function (data) {
            // 서버에서 받은 데이터로 질문2 업데이트
            $("#surveyContainer").html(data);
        },
        error: function () {
            alert("서버와의 통신 중 에러가 발생했습니다.");
        }
    });
} 




</script>




<%@ include file="../footer.jsp" %>     








 
 
 
 
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

			질문1. 귀하의 성별은 어떻게 되십니까?<br><br>
            <input type="radio" name="survay2" value="5" />만족
			<input type="radio" name="survay2" value="4" />다소만족
			<input type="radio" name="survay2" value="3" />보통
			<input type="radio" name="survay2" value="2" />다소미흡
			<input type="radio" name="survay2" value="1" />매우미흡 
			<br><br><br>
           <!--  <input type="button" value="이전" class="btn btn" name="btn_research_p" id="btn_research_p" onclick="click()"> -->
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n" onclick="moveToNextPage()">
        </div>
		</div>
	</div>
	<br><br><br>

<script>


/* $("#btn_research_n").click(function(){
	alert("선택지 입력해 주세요!");
	
})
 */



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




/*     $(document).ready(function () {
        // 페이지 로드 시 설문조사 데이터를 가져오는 Ajax 호출
        $.ajax({
            type: "GET",
            url: "surveyData", // 서버에서 설문조사 데이터를 반환하는 엔드포인트
            dataType: "json",
            success: function (data) {
                // 받아온 데이터를 기반으로 동적으로 HTML을 생성하여 추가
                renderSurvey(data);
            },
            error: function (xhr, status, error) {
                console.error("Error fetching survey data:", error);
            }
        });
    });

    function renderSurvey(data) {
        // 받아온 데이터를 기반으로 동적으로 HTML을 생성하여 추가
        var surveyContainer = $("#surveyContainer");

        // 예시: 각 질문을 순회하면서 동적으로 HTML 생성
        for (var i = 0; i < data.questions.length; i++) {
            var question = data.questions[i];
            var questionHTML = '<h5>' + question + '</h5>';
            surveyContainer.append(questionHTML);
        }
    } */
</script>
<!-- 본문 끝 -->







<%@ include file="../footer.jsp" %>      
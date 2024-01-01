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
            <br><br><br>
        </div>
		</div>
	</div>
	<br><br><br>

<script>
    $(document).ready(function () {
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
    }
</script>
<!-- 본문 끝 -->
		
</form>
</div>






<%@ include file="../footer.jsp" %>      
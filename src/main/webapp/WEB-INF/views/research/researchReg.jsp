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
<div class="container text-center"> <h3>설문조사 등록</h3>
	<div class="container">
		<p>설문조사를 등록해 주세요</p>
		<hr><br><br>
		 <div class="container-line" id="surveyContainer">
            <!-- 설문조사 내용이 여기에 동적으로 추가될 것입니다. -->
            	<div class="row">
		<div class="col-sm-12">
			<form name="helpfrm" id="helpfrm" method="post" action="insert" enctype="multipart/form-data">
	<table class="table">
            <tr>
                <th>제목</th>
				<td><input type="text"></td>
            </tr>
            <tr>
                <th>설문기간</th>
				<td><input type="text"> ~ <input type="text"></td>
            </tr>
    </table>
	
	<br><br><br>
	
	<table class="table">
        <thead>
            <tr>
                <th></th>
                <th>질문번호</th>
                <th>질문내용</th>
                <!-- <th>답변수</th> -->
                <th>답변내용</th>
            </tr>
        </thead>
  		<tbody>
		<%-- <c:forEach items="${myList_a}" var="mylista"> --%>
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td><input type="checkbox"></td>
	            <td>질문1</td>
	            <td><input type="text" placeholder="질문을 입력해주세요"></td>
	     <!--        <td>
	            <select>
	            	<option>1</option>
	            	<option>2</option>
	            	<option>3</option>
	            </select>
	            </td> -->
	            <td>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="button" value="추가" class="btn btn">
	            </td>
	        </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td>질문2</td>
	            <td><input type="text" placeholder="질문을 입력해주세요"></td>
	     <!--        <td>
	            <select>
	            	<option>1</option>
	            	<option>2</option>
	            	<option>3</option>
	            </select>
	            </td> -->
	            <td>
            	<input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="text" placeholder="답변을 입력해주세요"> 삭제<br>
	            <input type="button" value="추가" class="btn btn">
	            </td>
	        </tr>
		<%-- </c:forEach> --%>
        </tbody>
    </table>
    <input type="button" value="추가" class="btn btn">
		</form>
	</div>
	<!-- col end -->
</div>
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
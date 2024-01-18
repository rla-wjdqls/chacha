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
		 <div class="surveyRegContainer" id="surveyRegContainer">
            <!-- 설문조사 내용이 여기에 동적으로 추가될 것입니다. -->
            	<div class="row">
		<div class="col-sm-12">
		<form name="researchfrm" id="researchfrm" method="post" action="researchInsert">
		<table class="table">
		<br>
	            <tr>
	                <th class="regth">제목</th>
					<td><input type="text" name="rtitle" id="rtitle" placeholder="제목 입력해 주세요"></td>
	            </tr>
 	 	        <tr>
					<th class="regth">시작일자</th>
					<td><input type="date" name="rdate1" id="rdate1" class="form-control"></td>
	            </tr>
	           <tr>
					<th class="regth">종료일자</th>
					<td><input type="date" name="rdate2" id="rdate2" class="form-control"></td>
	            </tr>  
	         <tr>
	                <th class="regth">진행상태</th>
					<td>
						<select name="rstate" id="rstate">
							<option value="I">진행중</option>
							<option value="E">마감</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <th class="regth">공개여부</th>
					<td>
						<select name="rop" id="rop">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
						</select>
					</td>
	            </tr>
	    </table>
		<br><br><br>
		<table class="table">
	        <thead id="researchInto" name="researchInfo">
	            <tr>
	                <th></th>
	                <th class="regth">질문번호</th>
	                <th class="regth">질문유형</th>
	                <th class="regth">질문내용</th>
	                <th class="regth">선택지</th>
	            </tr>
	        </thead>
	  		<tbody id="researchTable" name="researchTable">
	        </tbody>
	    </table>
	    <input type="button" value="추가" class="btn" name="btn_a2" id="btn_a2" onclick="addTableBody()"><br><br>
	    <!-- 등록 버튼 클릭 시  -->
	    <input type="submit" value="등록" class="btn" name="btn_r" id="btn_r">
		</form>
		</div>
		<!-- col end -->
		</div>
	        <br>
	        </div>
			</div>
		</div>
		<br><br><br>
</form>
</div>

<script>

$(document).ready(function(){ //페이지 로딩시 질문1+선택지 출력
		addTableBody();
})//ready() end


var questionCount = 1; // 초기 질문번호

function addTableBody() {
    // 새로운 질문 행 추가
    var newRow =
        '<tr>' +
        '<td><input type="button" value="삭제" class="btn" name="btn_d' + questionCount + '" id="btn_d' + questionCount + '" onclick="deleteRow(this)"></td>' +
        '<td>질문' + questionCount + '</td>' +
        '<td>' +
        '<select name="qtype" id="qtype' + questionCount + '" onchange="modifyChoice(' + questionCount + ')">' +
        '    <option value="gg">객관식(중복불가)</option>' +
        '    <option value="gb">객관식(중복허용)</option>' +
        '</select>' +
        '</td>' +
        '<td><input type="text" placeholder="질문을 입력해주세요" id="qcont' + questionCount + '" name="qcont"></td>' +
        '<td id="choiceContainer' + questionCount + '">' +
        '<select id="qty' + questionCount + '" name="qty" onchange="updateChoiceFields(' + questionCount + ')">' +
        '    <option value="0">선택지 개수</option>' +
        '    <option value="2">2개</option>' +
        '    <option value="3">3개</option>' +
        '    <option value="4">4개</option>' +
        '</select><br>' +
        '<div id="dynamicChoiceFields' + questionCount + '"></div>' +
        '</td>' +
        '</tr>';

    // 기존의 tbody에 새로운 행 추가
    if (questionCount < 6) {
        $("#researchTable").append(newRow);

        // 추가된 질문에 대해 카운트 증가
        questionCount++;
    } else {
        alert("질문은 5개 까지 추가 가능합니다");
    } // if end
    
}//addTableBody() end



function updateChoiceFields(questionCount) {
    var qty = document.getElementById("qty" + questionCount).value;
    var dynamicChoiceFields = document.getElementById("dynamicChoiceFields" + questionCount);

    // 이전에 생성된 동적 필드 제거
    dynamicChoiceFields.innerHTML = "";

    if (qty > 0) {
        for (var i = 1; i <= qty; i++) {
            var inputField = document.createElement("input");
            inputField.type = "text";
            inputField.placeholder = "답변을 입력해주세요";
            inputField.name = "choice";
            dynamicChoiceFields.appendChild(inputField);
        }
    }
}



function deleteChoice(btn){
	alert();
}//deleteChoice() end



function deleteRow(btn) {
    	
	   //원하는 행 삭제
       var table = btn.parentNode.parentNode.parentNode;
            var rows = table.getElementsByTagName('tr');
            
            // 최소 한 행이 남아 있도록
            if (rows.length > 1) {
                var row = btn.parentNode.parentNode;
                row.parentNode.removeChild(row);
                
                // 삭제 후 questionCount 감소
                questionCount--;
                
                // 행이 삭제되었으므로 다시 갱신된 questionCount로 텍스트 업데이트
                updateQuestionNumbers();
                
            } else {
                alert('최소 한 행은 삭제할 수 없습니다.');
            }
         
            
            
}//deleteRow() end
 

function updateQuestionNumbers() {
    // researchTable의 모든 행을 가져와서 각 행의 질문 번호를 업데이트
    $("#researchTable tr").each(function(index, row) {
        // 첫 번째 셀에 해당하는 td 엘리먼트를 찾아서 내부의 텍스트를 업데이트
        var questionNumberCell = $(row).find("td:eq(1)");
        questionNumberCell.text("질문" + (index + 1));
    });
}//updateQuestionNumbers() end






</script>






<!-- 본문 끝 -->		

<%@ include file="../footer.jsp" %>
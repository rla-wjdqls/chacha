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
		<form name="researchfrm" id="researchfrm" method="post" action="" enctype="multipart/form-data">
		<table class="table">
	            <tr>
	                <th>제목</th>
					<td><input type="text" placeholder="제목 입력해 주세요" name="rtitle" id="rtitle"></td>
	            </tr>
	            <tr>
	                <th>설문기간</th>
					<td><input type="text" name="rdate1" id="rdate"> ~ <input type="text" name="rdate2" id="rdate2"></td>
	            </tr>
	            <tr>
	                <th>진행상태</th>
					<td>
						<select name="rstate" id="rstate">
							<option value="i">진행중</option>
							<option value="e">마감</option>
						</select>
					</td>
	            </tr>
	    </table>
		<br><br><br>
		<table class="table">
	        <thead id="researchInto" name="researchInfo">
	            <tr>
	                <th></th>
	                <th>질문번호</th>
	                <th>질문내용</th>
	                <th>선택지</th>
	            </tr>
	        </thead>
	  		<tbody id="researchTable" name="researchTable">
			<%-- <c:forEach items="${myList_a}" var="mylista"> --%>
		        <!-- 조건이 참일 때 실행할 내용 -->
		        <tr>
		            <td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1"></td>
		            <td>질문1</td>
		            <td><input type="text" placeholder="질문을 입력해주세요" id="qcont" name="qcont"></td>
		            <td>
		            <input type="text" placeholder="답변을 입력해주세요" id="choice" name="choice">
		            <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2" onclick="deleteRow(this)"><br>
		            <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1" onclick="addAnswerField(this)">
		            </td>
		        </tr>
			<%-- </c:forEach> --%>
	        </tbody>
	    </table>
	    <input type="button" value="추가" class="btn" name="btn_a2" id="btn_a2" onclick="addTableBody()"><br><br>
	    <input type="button" value="등록" class="btn">
		</form>
		</div>
		<!-- col end -->
		</div>
	        <br>
	        </div>
			</div>
		</div>
		<br><br><br>

<script>

function addAnswerField(btn) {
    var row = btn.parentNode.parentNode;
    var cell = row.cells[3];  // "답변내용" 열에 해당하는 셀

    var inputField = document.createElement("input");
    inputField.type = "text";
    inputField.placeholder = "답변을 입력해주세요";
    inputField.name = "choice";

    var deleteButton = document.createElement("input");
    deleteButton.type = "button";
    deleteButton.value = "삭제";
    deleteButton.className = "btn";
    deleteButton.onclick = function() {
        deleteRow(this);
    };

    cell.appendChild(inputField);
    cell.appendChild(deleteButton);
    cell.appendChild(document.createElement("br"));
    
 	// 추가 버튼을 맨 아래로 이동
    var addButtonCell = $("#researchTable tr:last td:last");
    addButtonCell.append(addButtonCell.find("input[type='button'][value='추가']"));
}

function deleteRow(btn) {
	   // 삭제 버튼이 속한 셀을 찾아 삭제
    var cell = btn.parentNode;

    // 셀의 이전 sibling을 찾아 해당 행의 index를 구함
    var rowIndex = Array.from(cell.parentNode.children).indexOf(cell.parentNode);

    // 행이 존재하면 삭제
    if (rowIndex !== -1) {
        var table = cell.parentNode.parentNode;
        table.deleteRow(rowIndex);
    }
}



var questionCount = 2;  // 초기 질문 번호

function addTableBody() {
    // 새로운 행 추가
    var newRow = '<tr>' +
        '<td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1"></td>' +
        '<td>질문' + questionCount + '</td>' +
        '<td><input type="text" placeholder="질문을 입력해주세요" name="qcont"></td>' +
        '<td>' +
        '   <input type="text" placeholder="답변을 입력해주세요" name="choice">' +
        '   <input type="button" value="삭제" class="btn" onclick="deleteRow(this)"><br>' +
        '   <input type="button" value="추가" class="btn" onclick="addAnswerField(this)">' +
        '</td>' +
        '</tr>';

    // 기존의 tbody에 새로운 행 추가
    $("#researchTable").append(newRow);
    
    // 추가된 질문에 대해 카운트 증가
    questionCount++;
    
}//addTableBody() end

//이렇게 동적으로 생성된 행에 대한 처리 로직은 서버 측에서도 고려되어야 합니다. 
//만약 실제 데이터베이스에 추가되어야 한다면 서버에서도 해당 로직을 추가해주셔야 합니다.


    
</script>
<!-- 본문 끝 -->
		
</form>
</div>






<%@ include file="../footer.jsp" %>      
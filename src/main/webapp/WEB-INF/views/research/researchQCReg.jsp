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
<div class="container text-center"> <h3>질문/선택지 등록</h3>
	<div class="container">
		<p>질문은 최대 5개, 선택지는 4개까지 추가 가능합니다.</p>
		<hr><br><br>
		 <div class="container-line" id="surveyContainer">
        <div class="row">
		<div class="col-sm-12">
		<form name="researchQCfrm" id="researchQCfrm">
		<input type="hidden" value="${researchDTO.rno}" id="rno" name="rno">
		<p>설문번호 : ${researchDTO.rno}</p><br><br>
		<table class="table">
	        <thead id="researchInfo" name="researchInfo">
	            <tr>
	                <th></th>
	                <th>질문번호</th>
	                <th>질문유형</th>
	                <th>질문내용</th>
	                <th>선택지</th>
	            </tr>
	        </thead>
	  		<tbody id="researchTable" name="researchTable">
		        <!-- 조건이 참일 때 실행할 내용 -->
		        <tr>
		            <td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1" onclick="deleteRow(this)"></td>
		            <td>질문1</td>
		    <!--qtype이 주관식(단답,장문) 이면 qcont 아래와 같음 -->
		    <!-- <td><input type="text" placeholder="주관식 답입니다" id="qcont" name="qcont" readonly></td>  -->     
    		<td>
            	<select name="qtype" id="qtype" onchange="modifyChoice()">
			   		<option value="gg">객관식(중복불가)</option> <!--선택 시 라디오버튼-->
			        <option value="gb">객관식(중복허용)</option> <!--선택 시 체크박스-->
			        <option value="gd">객관식(드롭다운)</option> <!--선택 시 드롭다운-->
			        <!-- <option value="jd">주관식(단답)</option> 선택 시 textarea (글자수 제한)
			        <option value="jj">주관식(장문)</option> 선택 시 textarea (글자수 제한) -->
            	</select>
            </td>
			<td><input type="text" placeholder="질문을 입력해주세요" id="qcont" name="qcont"></td>
			<td id="choiceContainer">
				<input type="text" placeholder="답변을 입력해주세요" id="choice" name="choice">
	            <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2" onclick="deleteChoice(this)"><br>
	            <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1" onclick="addAnswerField(this)">
			</td>
		    </tr>
	        </tbody>
	    </table>
	    <input type="button" value="추가" class="btn" name="btn_a2" id="btn_a2" onclick="addTableBody()">
	    <!--등록 성공 시 alert("질문1 등록되었습니다") 띄어주고 내용 보여주기, 행추가 버튼 생성됨-->
	    <input type="button" value="등록" class="btn" name="btn_r" id="btn_r">
		</form>
		</div>
		<!-- col end -->
		</div>
	    <br><br>
        </div>
		</div>
		</div>
		<br><br><br><br>

<script>

/* action="researchQCInsert" */

$("#btn_r").click(function(){
	//alert();
	//<form id="researchQCfrm"></form> 컨트롤 요소들로 전부 가져옴
	let insertData = $("#researchQCfrm").serialize();
	//alert(insertData); //rno=r20240109174954&qtype=gg&qcont=qcont&choice=choice1&choice=choice2
	researchInsert(insertData);
})//click end


function researchInsert(insertData){ //질문 insert 함수
		//alert("insert 함수호출:" + insertData); //rno=r20240109174954&qtype=gg&qcont=qcont&choice=choice1&choice=choice2
		
		$.ajax({
			url : '/research/researchQCInsert' //요청명령어
		   ,type: 'post'
		   ,data: insertData        //전달값
		   ,error: function(error){
			 alert(error);
		   }//error end
		   ,success: function(result){
			 alert("질문"+questionCount +"추가되었습니다!");
			 //console.log(data);
			 //내용 보여주고 행추가 버튼 생성
			 
			 
			 
			 
			 
			 
			 
		   }//success end
		}); //ajax() end	
		
	}//commentInsert() end



function checkForm() {
    let qcont = document.getElementById("qcont").value.trim();
    if (qcont.length == 0) {
        alert("질문 내용을 입력해 주세요!");
        return false;
    }
    return true;
}//checkForm() end


//질문 등록 클릭하면 해당 질문 한행 insert
//-> 해당 내용 보여주고 행추가 버튼 생성됨 (한행씩만 insert 가능하도)
//질문 1개 등록해야 다음행 추가 가능 

var questionCount = 2; //초기 질문번호

function addTableBody(){

	//새로운 질문 행 추가
    var newRow = 
    	'<tr>' +
	    '<td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d' + questionCount + '" onclick="deleteRow(this)"></td>' +
	    '<td>질문' + questionCount + '</td>' +
	    '<td>' +
	    '<select name="qtype" id="qtype' + questionCount + '" onchange="modifyChoice(' + questionCount + ')">' +
	    '    <option value="gg">객관식(중복불가)</option>' +
	    '    <option value="gb">객관식(중복허용)</option>' +
	    '    <option value="gd">객관식(드롭다운)</option>' +
	    '    <option value="jd">주관식(단답)</option>' +
	    '    <option value="jj">주관식(장문)</option>' +
	    '</select>' +
	    '</td>' +
	    '<td><input type="text" placeholder="질문을 입력해주세요" id="qcont' + questionCount + '" name="qcont"></td>' +
	    '<td id="choiceContainer' + questionCount + '">' +
	    '    <input type="text" placeholder="답변을 입력해주세요" id="choice' + questionCount + '" name="choice">' +
	    '    <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2_' + questionCount + '" onclick="deleteChoice(this)"><br>' +
	    '    <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1_' + questionCount + '" onclick="addAnswerField(this)">' +
	    '</td>' +
	    '</tr>';
	
    //기존의 tbody에 새로운 행 추가
    if(questionCount<6){
    	
    $("#researchTable").append(newRow);
    
    //추가된 질문에 대해 카운트 증가
	questionCount++;
    
    } else {
    	alert("질문은 5개 까지 추가 가능합니다");
    }//if end
	
}//addTableBody() end


function modifyChoice(questionIndex) {
	 var qtypeSelect = document.getElementById("qtype" + questionIndex);
	    var choiceContainer = document.getElementById("choiceContainer" + questionIndex);

	    // qtype 값이 'jd' 또는 'jj'일 때 qcont1을 표시하고 qcont2는 숨김
	    if (qtypeSelect.value === 'jd' || qtypeSelect.value === 'jj') {
	        choiceContainer.innerHTML =
	            '<input type="text" placeholder="주관식 답입니다" readonly>';
	    } else {
	        // 그 외의 경우 qcont2를 표시하고 qcont1은 숨김
	        choiceContainer.innerHTML =
	            '<input type="text" placeholder="답변을 입력해주세요" id="choice' + questionIndex + '" name="choice">' +
	            '<input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2_' + questionIndex + '" onclick="deleteChoice(this)"><br>' +
	            '<input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1_' + questionIndex + '" onclick="addAnswerField(this)">';
	    }
}//modifyChoice() end

function addAnswerField(btn){
	 // btn_a1 클릭 시 선택지 및 삭제 버튼 추가
    var row = btn.parentNode.parentNode;
    var cell = row.cells[4];  // "선택지" 열에 해당하는 셀

    // 현재 선택지 개수를 확인
    var choiceCount = cell.querySelectorAll('input[name="choice"]').length;

    if (choiceCount < 4) {
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
    } else {
        alert("최대 4개의 선택지만 추가할 수 있습니다.");
    }

    // 추가 버튼을 맨 아래로 이동
    var addButtonCell = $("#researchTable tr:last td:last");
    addButtonCell.append(addButtonCell.find("input[type='button'][value='추가']"));
	
}//addAnswerField() end



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
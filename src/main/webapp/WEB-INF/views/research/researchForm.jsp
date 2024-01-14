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
		  <form name="researchrFrm" id="researchrFrm">
			<div class="researchrList" name="researchrList" id="researchrList"></div>  
			<br><br><br>
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
          </form>
        </div>
		</div>
	</div>
	<br><br>


<!-- 본문 끝 -->


<script>

let rno = '${researchList2.rno}'; // 부모글 번호
let questionNo = 1; // 초기 질문 번호
let currentQuestionIndex = 0; // 현재 질문 인덱스 초기화

$(document).ready(function () {
    researchrList();
    
    $("#btn_research_n").on("click", function () {
    	//alert("설문 조사를 제출합니다.");
    	
    	// 체크된 체크박스들을 선택
	    let checkedCheckboxes = $("input[type=checkbox]:checked");
		 
	 	// 체크된 체크박스가 없을 경우 경고 메시지 띄우고 종료
	    if (checkedCheckboxes.length === 0) {
	        alert("적어도 하나 이상의 항목을 선택하세요.");
	        return;
	    }//if end
	    
	    // 체크된 체크박스가 있는 경우에만 페이지 이동
        currentQuestionIndex++;
        researchrList();
        checkHiddenValues();
        researchrInsert();
    });
});//ready() end

function checkHiddenValues() {
    
let checkedCheckbox = $("input[type=checkbox]:checked");
    
 	// 체크된 첫 번째 체크박스의 qno 및 cno 값을 가져오기
    let qnoValue = checkedCheckbox.siblings("input[name='qno']").val();
    let cnoValue = checkedCheckbox.siblings("input[name='cno']").val();

    // 가져온 값 출력 또는 다른 작업 수행
    console.log("QNO Values:", qnoValue);
    console.log("CNO Values:", cnoValue);
    
    // AJAX 요청에 전송할 데이터에 qno 및 cno 값을 추가
    let insertData = {
        qno: qnoValue, //168
        cno: cnoValue //140
    };
    
 	// researchrInsert 함수 호출 시 insertData 전달
    researchrInsert(insertData);
    
}//checkHiddenValues() end


function researchrInsert(insertData){
	//alert("답변 insert");
	
	$.ajax({
		url : '/research/researchrInsert' //요청명령어
	   ,type: 'post'
	   ,contentType: 'application/json'
	   ,data: JSON.stringify(insertData) //전달값
	   ,error: function(error){
		 //alert('에러!' + error);
		 console.log(error);
	   }//error end
	   ,success: function(result){
		 //alert('성공' +result);
		 console.log(result);
		 //마지막 value="제출" 성공했을때만 
         //if(result === 1){ // 댓글 등록 성공

         //    alert("설문 제출이 완료되었습니다! 결과를 확인해 보세요");
             // 댓글 등록 후 researchList.jsp로 이동
         //}//if end
		 
	   }//success end
	}); //ajax() end	
    
    
}//researchrInsert() end


function researchrList() {
    $.ajax({
        url: '/research/researchrList',
        type: 'get',
        data: { 'rno': rno },
        error: function (error) {
            alert('에러!');
            console.log(error);
        },
        success: function (result) {
            let a = ''; // 출력할 결과값
            let questionNo = 0; // 질문 번호 초기화
            let prevQuestion = ''; // 이전 질문 추적

            $.each(result, function (key, value) {
                // 현재 질문이 이전 질문과 중복되지 않을 때만 출력
                if (value.qcont !== prevQuestion) {
                    questionNo++;
                    if (questionNo === currentQuestionIndex + 1) {
                        a += '질문' + questionNo + ': ' + value.qcont + '<br><br>';
                    }//if end
                }//if end

                // 선택지를 qty 수만큼 반복해서 출력
                if (questionNo === currentQuestionIndex + 1) {
                    // 숨겨진 필드 추가
                    a += '<label>';
                    a += '<input type="hidden" name="qno" value="' + value.qno + '">';
                    a += '<input type="hidden" name="cno" value="' + value.cno + '">';
                    
                    // 체크박스 및 선택지 출력
                    a += '<input type="checkbox">';
                    a += value.choice + ' ';
                    
                    a += '</label>';
                }//if end

                // 이전 질문 갱신
                prevQuestion = value.qcont;
            });//each()end

            // 마지막 질문 처리
            if (prevQuestion !== '') {
                $(".researchrList").html(a);

                // 마지막 페이지인 경우 "다음" 버튼을 "제출" 버튼으로 변경
                if (currentQuestionIndex < questionNo - 1) {
                    $("#btn_research_n").show();
                    $("#btn_research_n").val("다음");
                } else {
                	 $("#btn_research_n").show();
                     $("#btn_research_n").val("제출");
                }//if end
            }//if end
            
        }//success end
    });//ajax end
}//researchrList() end





</script>




<%@ include file="../footer.jsp" %>     








 
 
 
 
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
		  <form name="researchrFrm" id="researchrFrm">
			<div class="researchrList" name="researchrList" id="researchrList"></div>  
			<br><br><br>
           <input type="button" value="이전" class="btn btn" name="btn_research_p" id="btn_research_p">
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
            <input type="button" value="제출" class="btn btn" name="btn_research_r" id="btn_research_r">
          </form>
        </div>
		</div>
	</div>
	<br><br><br>


<!-- 본문 끝 -->


<script>

let rno = '${researchList2.rno}'; // 부모글 번호
let questionNo = 1; // 초기 질문 번호
let currentQuestionIndex = 0; // 현재 질문 인덱스 초기화

$(document).ready(function () {
    researchrList();

    $("#btn_research_n").on("click", function () {
        currentQuestionIndex++;
        researchrList();
    });

    $("#btn_research_p").on("click", function () {
        if (currentQuestionIndex > 0) {
            currentQuestionIndex--;
            researchrList();
        }
    });

    $("#btn_research_r").on("click", function () {
        // 여기에 제출 로직을 추가하면 됩니다.
        alert("설문 조사를 제출합니다.");
        researchrInsert();
        checkHiddenValues();
        
    });
});

//어떤 이벤트(예: 버튼 클릭)가 발생했을 때 실행되는 함수
function checkHiddenValues() {
    // 숨겨진 필드의 값을 가져오기
    let qnoValue = $("input[name='qno']").val();
    let cnoValue = $("input[name='cno']").val();

    // 가져온 값 출력 또는 다른 작업 수행
    console.log("QNO Value:", qnoValue);
    console.log("CNO Value:", cnoValue);
}


<!--해당하는 문제 qno = {166, 167, 168}  -->
<!--선택한 답안  cno = {135, 138, 140}  -->


function researchrInsert(){
	alert("답변 insert");
	
	// qno 및 cno 값을 가져오기
    let qnoValue = $("input[name='qno']").val();
    let cnoValue = $("input[name='cno']").val();

    // AJAX 요청에 전송할 데이터에 qno 및 cno 값을 추가
    let insertData = {
        qno: qnoValue, //168
        cno: cnoValue, //140
        // 필요에 따라 다른 데이터를 추가
    };
	
    alert(insertData);
    console.log(insertData);
    
    /*
	$.ajax({
		url : '/research/researchrInsert' //요청명령어
	   ,type: 'post'
	   ,data: insertData        //전달값
	   ,error: function(error){
		 alert(error);
		 console.log(error);
	   }//error end
	   ,success: function(result){
		 alert(result);
		 console.log(result);
		 //console.log(data);
		// if(result==1){ //댓글등록 성공
		//	 alert("댓글이 추가되었습니다");
		//	 commentList();//댓글등록 후 댓글목록 함수 호출
		//	 $("#content").val('');//기존 댓글 내용을 빈 문자열로 대입(초기화)
		// }//if end
		 
	   }//success end
	}); //ajax() end	
    */
    
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
            });//each() end

            // 마지막 질문 처리
            if (prevQuestion !== '') {
                $(".researchrList").html(a);

                // 마지막 페이지인 경우 "다음" 버튼과 "제출" 버튼 보이기
                if (currentQuestionIndex < questionNo - 1) {
                    $("#btn_research_n").show();
                } else {
                    $("#btn_research_n").hide();
                    $("#btn_research_r").show();
                }

                // 첫 페이지에서는 "이전" 버튼 숨기기
                if (currentQuestionIndex > 0) {
                    $("#btn_research_p").show();
                } else {
                    $("#btn_research_p").hide();
                    $("#btn_research_r").hide();
                }//if end
            }//if end
        }//success end
    }); //ajax end
}//researchrList() end




</script>




<%@ include file="../footer.jsp" %>     








 
 
 
 
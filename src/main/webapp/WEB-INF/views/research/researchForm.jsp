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
		 <div class="container-frm" id="container-frm">
			<!-- 이 부분에 내용 들어감 질문1 시작-->
			<div id="panel"></div>

			<div class="container-rr">
				설문번호 :  ${researchList2.rno}<br>
				제목 :  	  ${researchList2.rtitle}<br>
				설문 기간 : ${researchList2.rdate1} ~ ${researchList2.rdate2}<br>
				등록일자 :  ${researchList2.rgdate}<br>
			</div>
			<br><hr>
			<div class="progress">
			    <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="progressBar">0%</div>
			</div>
			<br>
		  <!-- 설문폼 시작 -->
		  <div class="container-c">
		  <form name="researchrFrm" id="researchrFrm">
			<div class="researchrList" name="researchrList" id="researchrList"></div>  
			<br><br><br>
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
	        <!-- 결과 보러가기 버튼 추가 -->
	  		<input type="button" value="결과보기" class="btn btn" name="btn_result" id="btn_result" style="display: none;">
          </form>
          </div>
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
    	 handleResearchButtonClick();
    });
});


$("#btn_result").on("click", function () {
    // 결과 페이지 URL 생성
    let resultPageUrl = '/research/researchResult?rno=' + rno;
    // 결과 페이지로 이동
    window.location.href = resultPageUrl;
});//click end


function handleResearchButtonClick() {
	// 체크된 체크박스, 라디오버튼, 선택된 드롭다운을 선택
    let checkedCheckboxs = $("input[type=checkbox]:checked");
    let checkedRadio = $("input[type=radio]:checked");


    // 체크된 모든 항목이 없을 경우 경고 메시지 띄우고 종료
    if (checkedCheckboxs.length === 0 && checkedRadio.length === 0) {
        alert("적어도 하나 이상의 항목을 선택하세요.");
        return;
    }

    // 체크된 체크박스가 있는 경우에만 페이지 이동
    researchrList();
    checkHiddenValues();
    researchrInsert();

    // 페이지 이동 전에 프로그레스 바 업데이트
    currentQuestionIndex++;

    // 프로그레스 바 업데이트
    updateProgressBar();
}//handleResearchButtonClick() end


function updateProgressBar() {
	// 서버에서 현재 진행 중인 설문의 전체 질문 수 가져오기
    $.ajax({
        url: '/research/getTotalQuestions',
        type: 'get',
        data: { 'rno': rno },
        error: function (error) {
            alert('에러!');
            console.log(error);
        },
        success: function (totalQuestions) {
        	//alert(totalQuestions); //3
        	
            // 진행률 계산(소수점 첫째 자리에서 반올림)
            let progressPercentage = Math.round((currentQuestionIndex / totalQuestions) * 100);
        	//alert(progressPercentage); //33.33

            // 프로그레스 바 엘리먼트 가져오기
            let progressBar = $("#progressBar");

            // 프로그레스 바 업데이트
            progressBar.width(progressPercentage + "%");
            progressBar.text(progressPercentage.toFixed(0) + "%");
            
            // 프로그레스 바가 100%일 때만 "결과 보러가기" 버튼 보이기
            if (progressPercentage === 100) {
                $("#btn_result").show();
                // 마지막 페이지인 경우 "제출" 버튼 숨기기
                $("#btn_research_n").hide();
                
            	 // 결과 문구 보이기
                $(".researchrList").html('<br><h5>설문에 참여해 주셔서 감사합니다~</h5>');
            } else {
                // 마지막 페이지가 아닌 경우 "다음" 버튼 보이고, "제출" 버튼 숨기기
                $("#btn_research_n").show();
                $("#btn_research_n").val("다음");
            }
        }//success end
    });//ajax end
}//updateProgressBar() end


function checkHiddenValues() {
    let checkedCheckboxes = $("input[type=checkbox]:checked");
    let checkedRadios = $("input[type=radio]:checked");

    console.log("checkedCheckboxes:", checkedCheckboxes);
    console.log("checkedRadios:", checkedRadios);

    if (checkedCheckboxes.length === 0 && checkedRadios.length === 0) {
        alert("적어도 하나 이상의 항목을 선택하세요.");
        return;
    }

    let qnoValues = [];
    let cnoValues = [];

    if (checkedCheckboxes.length > 0) {
        // 체크된 체크박스들의 qno 및 cno 값을 가져오기
        checkedCheckboxes.each(function () {
            let qnoValue = $(this).siblings("input[name='qno']").val();
            let cnoValue = $(this).siblings("input[name='cno']").val();

            qnoValues.push(qnoValue);
            cnoValues.push(cnoValue);
        });
    } else if (checkedRadios.length > 0) {
        // 체크된 라디오버튼의 qno 및 cno 값을 가져오기
        qnoValues.push(checkedRadios.siblings("input[name='qno']").val());
        cnoValues.push(checkedRadios.siblings("input[name='cno']").val());
    }

    console.log("QNO Values:", qnoValues);
    console.log("CNO Values:", cnoValues);

    // AJAX 요청에 전송할 데이터에 qno 및 cno 값을 추가
    let insertData = {
  		  qno: qnoValues.map(Number),
  		  cno: cnoValues.map(Number)
    };

    // researchrInsert 함수 호출 시 insertData 전달
    researchrInsert(insertData);
}//checkHiddenValues() end


function researchrInsert(insertData){
	//alert("답변 insert");
	
	$.ajax({
		url : '/research/researchrcInsert' //요청명령어
	   ,type: 'post'
	   ,contentType: 'application/json'
	   ,data: JSON.stringify(insertData) //전달값
	   ,error: function(error){
		 //alert('에러!' + error);
		 console.log(error);
	   }//error end
	   ,success: function(result){
		 //alert('성공' +result);
		 //console.log(result);
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
                        a += '<h5>질문' + questionNo + '</h5><br><h6>' + value.qcont + '</h6><br><br>';
                    }//if end
                }//if end

                // 선택지를 qty 수만큼 반복해서 출력
                if (questionNo === currentQuestionIndex + 1) {
                    // 숨겨진 필드 추가
                    a += '<label>';
                    a += '<input type="hidden" name="qno" value="' + value.qno + '">';
                    a += '<input type="hidden" name="cno" value="' + value.cno + '">';
                    
                    
                    // 체크박스 및 선택지 출력
                    //a += '<input type="checkbox">\n';
                    
                    // qtype에 따라 다른 형태의 입력 필드 생성
                    if (value.qtype === 'gg') {
                        // 체크박스
                        a += '<input type="checkbox">\n';
                    } else if (value.qtype === 'gd') {
                        // 드롭다운
                        a += '<select>';
                        // 드롭다운 옵션 추가 (value.choice를 이용하거나 별도의 데이터를 가져와야 함)
                        a += '<option value="option1">' + value.choice + '</option>';
                        a += '</select>';
                    } else if (value.qtype === 'gb') {
                        // 라디오버튼
                        a += '<input type="radio" name="radioGroup">\n';
                    }
                    
                    a += value.choice + '\n';
                    a += '</label>';
                }//if end

                // 이전 질문 갱신
                prevQuestion = value.qcont;
            });//each()end

            // 마지막 질문 처리
            if (prevQuestion !== '') {
                $(".researchrList").html(a);
            }//if end
            
        }//success end
    });//ajax end
}//researchrList() end





</script>




<%@ include file="../footer.jsp" %>     








 
 
 
 
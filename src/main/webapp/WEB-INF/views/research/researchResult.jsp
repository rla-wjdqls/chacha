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

<div class="container text-center"> <h3>설문조사 결과</h3>
	<div class="container">
		<p>설문조사 결과를 확인하세요</p>
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
			참여자 수 : ${cnt} 명 
			<br><br>
			<div class="researchResult" name="researchResult" id="researchResult"></div>  
        </div>
		</div>
	</div>
	<br><br>
	
<script>

let rno = '${researchList2.rno}'; // 부모글 번호
let questionNo = 1; // 초기 질문 번호

$(document).ready(function () {
    resultList();
});//ready() end


function resultList() {
    $.ajax({
        url: '/research/resultList',
        type: 'get',
        dataType: 'json',
        data: { 'rno': rno },
        error: function (error) {
            alert('에러!');
            console.log(error);
        },
        success: function (result) {
        	
        	 let questionResults = [];

             let questionMap = new Map();
             $.each(result, function (key, value) {
                 let questionKey = value.qcont;

                 if (!questionMap.has(questionKey)) {
                     questionMap.set(questionKey, {
                         choices: [],
                         replies: []
                     });
                 }

                 questionMap.get(questionKey).choices.push(value.choice);
                 questionMap.get(questionKey).replies.push(value.reply);
             });

             questionMap.forEach(function (questionData, questionKey) {
                 let dataset = {
                     data: questionData.replies,
                     backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"],
                     label: '질문' + (questionResults.length + 1) // 질문 번호
                 };

                 questionResults.push({
                     labels: questionData.choices,
                     datasets: [dataset],
                     question: {
                         number: (questionResults.length + 1), // 질문 번호
                         content: questionKey // 질문 내용
                     }
                 });
             });

             for (let i = 0; i < questionResults.length; i++) {
                 let chartId = 'chartQuestion' + (i + 1);
                 let chartCanvas = '<canvas id="' + chartId + '" width="50" height="50"></canvas><br>';
                 $("#researchResult").append('<p>질문' + questionResults[i].question.number + ': ' + questionResults[i].question.content + '</p><br>');
                 $("#researchResult").append(chartCanvas);

                 let ctx = document.getElementById(chartId).getContext('2d');
                 new Chart(ctx, {
                     type: 'doughnut',
                     data: questionResults[i],
                     options: {
                         title: {
                             display: true,
                             text: '질문' + questionResults[i].question.number + ': ' + questionResults[i].question.content
                        }
                    }
                });
            }
        }//success end
    });//ajax end
}//researchrList() end
        
</script>



<%@ include file="../footer.jsp" %>     








 
 
 
 
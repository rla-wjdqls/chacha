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
        	//alert('성공~');

            let resultHtml = ''; // 결과를 담을 변수

                
               let questionMap = new Map(); // 질문별로 선택지와 응답 결과를 관리하기 위한 Map

               $.each(result, function (key, value) {
               	let questionKey = value.qcont; // 질문을 key로 사용

                   // questionMap에 해당 질문이 없으면 빈 배열을 초기화
                   if (!questionMap.has(questionKey)) {
                       questionMap.set(questionKey, {
                           choices: [],
                           replies: []
                       });
                   }
                   // 선택지와 응답 결과를 배열에 추가
                   questionMap.get(questionKey).choices.push(value.choice);
                   questionMap.get(questionKey).replies.push(value.reply);
               });

               // 각 질문에 대한 결과 출력
               questionMap.forEach(function (questionData, questionKey) {
                   resultHtml += '<br><p>질문' + questionNo + ". " + questionKey + '</p>';

                   // 선택지와 응답 결과 출력
                   for (let i = 0; i < questionData.choices.length; i++) {
                       resultHtml += questionData.choices[i] + ': ' + questionData.replies[i] + '명<br>';
                   }
                   questionNo++;
           });//each()end
            
        	// 결과를 출력할 영역에 HTML 추가
           $("#researchResult").html(resultHtml);
            
        }//success end
    });//ajax end
}//researchrList() end



</script>


<%@ include file="../footer.jsp" %>     








 
 
 
 
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
				<div class="researchrList"></div>  
			<br><br><br>
           <!--  <input type="button" value="이전" class="btn btn" name="btn_research_p" id="btn_research_p" onclick="click()"> -->
            <input type="button" value="다음" class="btn btn" name="btn_research_n" id="btn_research_n">
        </div>
		</div>
	</div>
	<br><br><br>


<!-- 본문 끝 -->


<script>
let rno = '${researchList2.rno}'; //부모글 번호

$(document).ready(function () {
	//alert("페이지 호출");
	researchrList();
});

//rno 보내서 db정보 가져와 출력
function researchrList(){ 
	//alert("질문+선택지 출력");
		$.ajax({ 
			url: '/research/researchrList'
		   ,type: 'get'
		   ,data: {'rno': rno} //부모글번호(전역변수로 선언되어 있음)
		   ,error:function(error){
			   alert('에러!');
			   console.log(error);
		   }//error end
		   ,success:function(result){
			  //alert('성공~');
			  //console.log(result);
			  
			 let a=''; //출력할 결과값
  			 $.each(result, function(key, value){ //안에 들어있는 요소만큼 반복된다. result 3건 -> function 3번 반복
  				//console.log(key);	   //index 순서 0 1 2
  				//console.log(value);  //[object object]
  				
  				//console.log(value.qcont);
  				//console.log(value.qty);
  				//console.log(value.qno);
  				//console.log(value.choice);
  				
  				
  				
  				
  				
  				
  				
  				
  			 });
			 
		   }//success end 
		});//ajax() end
}//researchList() end


let questionNo = 1; // 초기 질문번호
//questionNo++;



/*
function loadForm() {
	//alert("호출");
	
    let newHtml =
    	
    '        <form name="researchrFrm" id="researchrFrm">' +
    '        질문' + questionNo 
    '        </form>';
		
	$("#researchrList").html(newHtml);
	
}//loadForm() end
*/


 var answer1; 

function moveToNextPage() {
    // 여기서는 다음 페이지로 이동할 때 필요한 데이터를 서버로 전송하는 예시입니다.
    var surveyData = {
        answer1: $('input[name="survay1"]:checked').val(),
    };

    $.ajax({
        url: "getNextQuestion", // 서버에 전송할 엔드포인트
        method: "POST",
        data: { answer1: answer1 },
        success: function (data) {
            // 서버에서 받은 데이터로 질문2 업데이트
            $("#surveyContainer").html(data);
        },
        error: function () {
            alert("서버와의 통신 중 에러가 발생했습니다.");
        }
    });
} 




</script>




<%@ include file="../footer.jsp" %>     








 
 
 
 
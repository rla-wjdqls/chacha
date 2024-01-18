<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<% 
	String s_mlevel = (String)session.getAttribute("s_mlevel");
%>
<c:set var="writer" value="${center.uid}" />
<!-- <script>
//let anino = ""; //동물글 번호 
//alert(anino);

let urlParams = new URL(location.href).searchParams;
let desertionNo = urlParams.get('anino');
let anino_ = '';

let apiUrl = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&numOfRows=500&desertionNo=" + desertionNo + "&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
$(document).ready(function () {
	//console.log(desertionNo);
	fetch(apiUrl)
    .then(response => {
        if (!response.ok) {
            throw new Error("api 실패");
        }
        return response.json(); //json 형태로 파싱
    })
    .then(data => {
    	if (data.response.body.items.item && Array.isArray(data.response.body.items.item)) { //동물 정보가 포함된 item 속성 존재 여부 및 배열 여부
    	    let matchingAnimal = data.response.body.items.item.find(item => item.desertionNo === desertionNo); //배열에서 desertionNo가 일치하는 동물
    	    if (matchingAnimal) {
    	        console.log(matchingAnimal);
    	        detail(matchingAnimal);
    	        
    	    } else {
    	        console.log("일치하는 동물 번호가 없음");
    	    }
    	} else {
    	    console.log("API 응답 구조 다름");
    	}
    })
    .catch(error => {
        console.error("에러", error);
    });
});

function detail(matchingAnimal) {
    let a = '';
    
    if(matchingAnimal.kindCd.startsWith('[개')){
    	console.log(matchingAnimal.kindCd)
    	anino = "d" +matchingAnimal.desertionNo ;
    	console.log(anino);
    }else if(matchingAnimal.kindCd.startsWith('[고')){
    	console.log(matchingAnimal.kindCd)
    	anino = "c" +matchingAnimal.desertionNo ;
    	console.log(anino);
    }else if(matchingAnimal.kindCd.startsWith('[기타')){
    	console.log(matchingAnimal.kindCd)
    	anino = "a" +matchingAnimal.desertionNo ;
    	console.log(anino);
    }
    let aninoField = document.getElementById('anino_');
    aninoField.setAttribute('value', anino);
    
    let aninoField2= document.getElementById('anino_?');
    aninoField2.setAttribute('value', anino);
    
    console.log(anino);
    
    //a += "<div class='container-1'>";
    a += "<h3 style='text-align: center'>" + matchingAnimal.kindCd + "</h3>" ;
	a += "<div class='container-1'> ";
	a += "<img src="+ matchingAnimal.popfile +" style='float: left; margin-right: 20px;' width='270px' alt='이미지'>";
	a += "<table class='table table-borderless'>" ;
	a += "<tr>" ;
	a += "<th style='display: flex; align-items: center;'>나이</th>";
	a += "<td style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.age + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>성별</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.sexCd + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>몸무게</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.weight + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>중성화여부</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.neuterYn + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>공고기간</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.noticeSdt + " ~ " + matchingAnimal.noticeEdt + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>발견장소</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.happenPlace + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>보호센터</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.careNm + "(Tel : " + matchingAnimal.careTel + " )" + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>색상</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.colorCd + "</td>";
	a += "<th scope='row' style='display: flex; align-items: center;'>특징</th>";
	a += "<td class='anidd' style='display: flex; align-items: center; justify-content: flex-start;'>" + matchingAnimal.specialMark + "</td>";
	a += "</tr>";
	a +="</table>";
	a +="</div>";
   
    $("#container-1").append(a);
}

</script> -->
<!-- 본문 시작 template.jsp -->
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline ml-auto" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">보호소</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">입양대기 동물소개</span></a>
			</li>
		</ul>
	</nav>

<div class="container-fluid" id="container-fluid">
	<h3 style="text-align: center">${detail.aname} [${detail.colorCd}]</h3>
	<div class="container"id="container-1">
	 <form name="centerfrm" id="centerftm" method="post">
         <input type="hidden" value="${detail.anino}" name="anino" class="anino">
		  <nav class="navbar navbar-light i-nav">
			<c:choose>
         	<c:when test="${s_mlevel eq 'a'}">
            <div class="input-container" style="display: inline-block;">
               <input type="button" value="수정" class="btn btn-warning rotate-text" onclick="center_Update()">
               <input type="button" value="삭제" class="btn btn-danger rotate-text" onclick="center_delete()">
            </div>
            </c:when>
            </c:choose>
          </nav>
     
     <div class="container">
         <div class="container">
             <img src="/storage/${detail.anipic}" style="float: left; margin-right: 20px;" width="270px" alt="이미지">
 		 </div>
 		 <div class="container-1 rotate-text">
 		 <dl class="anidl">
               <dt class="anidt">나이</dt>
               <dd class="anidd" id="anidd">${detail.age}살</dd>
         </dl>
         <dl class="anidl">
             <dt class="anidt">성별</dt>
               <c:choose>
                  <c:when test="${detail.gender eq 'M'}">
                     <dd class="anidd">남자</dd>
                  </c:when>
                  <c:when test="${detail.gender eq 'F'}">
                     <dd class="anidd">여자</dd>
                  </c:when>
               </c:choose>
          </dl>
          <dl class="anidl">
               <dt class="anidt">몸무게</dt>
               <dd class="anidd">${detail.weight}</dd>
          </dl>
 		  <dl class="anidl" >
               <dt class="anidt" >중성화여부</dt>
               <c:choose>
                  <c:when test="${detail.genop eq 'Y'}">
                     <dd class="anidd">완료</dd>
                  </c:when>
                  <c:when test="${detail.genop eq 'N'}">
                     <dd class="anidd">미완료</dd>
                  </c:when>
                  <c:when test="${detail.genop eq 'U'}">
                     <dd class="anidd">미상</dd>
                  </c:when>
               </c:choose>
          </dl>
          <dl class="anidl" >
               <dt class="anidt">상태</dt>
               <dd class="anidd">${detail.adopt}</dd>
          </dl>
          <dl class="anidl" >
               <dt class="anidt">공고기간</dt>
               <dd class="anidd">${detail.noticeSdt} ~ ${detail.noticeEdt}</dd>
          </dl>
          <dl class="anidl" >
               <dt class="anidt">발견장소</dt>
               <dd class="anidd">${detail.happenPlace}</dd>
          </dl>
          <dl class="anidl" >
               <dt class="anidt">특징</dt>
               <dd class="anidd">${detail.intro}</dd>
          </dl>
		</div>
	</form>
		<c:choose>
		<c:when test="${s_mlevel ne 'A'}">
		<div class="container">
			<div class="jjimStart">
			<form name="jjimfrm" id="jjimfrm">
			<!-- 동물 글 번호 -->
			<input type="hidden" name="anino" id="anino" value="${detail.anino}">
			<c:choose>
				<%--로그인 상태에 찜 클릭 --%>
				<c:when test="${not empty sessionScope.s_id}">
							<div class="icon-heart" id="jjimInsertContainer"> 
								<i class="bi bi-heart" id="jjimInsert" ></i>
							</div>	
							<div class="icon-heart" id="jjimDeleteContainer">
								<i class="bi bi-heart-fill" id="jjimDelete"></i>
							</div>	
				</c:when>
				<c:otherwise>
					<div class="icon-heart">
						<i class="bi bi-heart" id="jjimButton" onclick="jjim_nolog()"></i>
					</div>	
				</c:otherwise>		
			</c:choose>	
			</form>
			</div>
			
			<form name="chatfrm" id="chatfrm" method="post" action="/chat">
			<input type="hidden" name="anino" id="anino_" value="${detail.anino}">
			<input type="hidden" name="writer" id="writer" value="${center.uid}">
			<div class="icon-heart">
				<i class="bi bi-chat-left-dots-fill" onclick="chat_popup()"></i>
			</div>
			</form>
			<div class="d-grid gap-2 d-md-block" >
			  <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">신청하기</button>
			</div>
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="aniRequest">입양 신청서</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form name="aniRefrm" id="aniRefrm" method="post" enctype="multipart/form-data">
					      <input type="hidden" value="${detail.anino}" name="anino" class="anino">
						      <div class="modal-body">
						     	* 사전질문 * <br>
						     	* 모든 항목을 선택하셔야 입양 신청이 가능합니다 * <hr>
						     	1. 가구원은 몇명인가요?
						        <select class="form-select" id="gg" aria-label="가구원 선택">
									  <option selected>선택하세요</option>
									  <option value="1">한명</option>
									  <option value="2">두명</option>
									  <option value="3">세명이상</option>
								</select>
								2. 신혼부부인가요?
								<select class="form-select" id="bb" aria-label="신혼부부여부 선택">
									  <option selected>선택하세요</option>
									  <option value="1">그렇다</option>
									  <option value="2">아니다</option>
									  <option value="3">예정있다</option>
								</select>
								3. 동물 알레르기가 있나요?
								<select class="form-select" id="da" aria-label="동물 알레르기 여부 선택">
									  <option selected>선택하세요</option>
									  <option value="1">예</option>
									  <option value="2">아니오</option>
								</select>
								4. 간단한 입양 신청서 작성바랍니다.
								<textarea class="form-control" id="sub_cont" name="sub_cont"></textarea>
								<input type="file" name="img" class="form-control" multiple="multiple">
						      </div>
					      	<div class="modal-footer">
						        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-primary" onclick="adopt()">신청하기</button>
					      	</div>
				      </form>
				    </div>
				  </div>
				</div>
		</div>
			</c:when>
			</c:choose>
			<hr>
	         	<div>
	            <p style="text-align: center">
	            	문의사항은 채팅을 이용해주세요.
	            </p>
	            </div>
	 </div>
</div>
	
<script>
         //찜 관련 스크립트 
         let anino = '${detail.anino}'; //동물글 번호 
         //alert(anino);
         
         $(document).ready(function () {
             let jjimState; // 찜 상태 저

             jjimSelect(); // 페이지 로딩되면 해당 함수 먼저 호출

             function jjimSelect() {
                 $.ajax({
                     url: '/jjim/select',
                     type: 'post',
                     data: { 'anino': anino },
                     error: function (error) {
                         alert(error);
                     },
                     success: function (result) {
                         jjimState = (result === 1); // 찜 상태 업데이트

                         if (jjimState) {
                             // 찜이 되어 있을 때
                             $("#jjimDelete").off().on('click', function () {
                                 jjimAct(); // 함수 호출
                             });
                             $("#jjimInsertContainer").hide();
                             $("#jjimDeleteContainer").show();
                         } else {
                             // 찜이 되어 있지 않을 때 
                             $("#jjimInsert").off().on('click', function () {
                                jjimAct(); // 함수 호출
                             });
                             $("#jjimInsertContainer").show();
                             $("#jjimDeleteContainer").hide();
                         }
                     }
                 });
             }

             function jjimAct() {
                 $.ajax({
                     url: jjimState ? '/jjim/delete' : '/jjim/insert', // 찜 상태에 따라 요청 URL 선택
                     type: 'post',
                     data: { 'anino': anino },
                     error: function (error) {
                         alert(error);
                     },
                     success: function (result) {
                         if (result === 1) {
                             alert(jjimState ? "찜이 해제되었습니다" : "동물을 찜하셨습니다");
                             jjimState = !jjimState; // 찜 상태를 반전
                             jjimSelect(); // 변경된 찜 상태에 따라 UI 갱신
                         }
                     }
                 });
             }
         });
   
         function chat_popup(){ 
            let uid = '<%= (String)session.getAttribute("s_id") %>';
            let writer = document.getElementById('writer');
            if(uid == "null"){
               uid = "";
            }
            //alert(uid);
            if(uid.length === 0){
               alert("로그인 후 이용바랍니다");
            }else{
               let form = document.getElementById("chatfrm");
               
               //새로운 창 열기
               let newWindow = window.open("/chat", "_chating", "menubar=no, toolbar=no, width=600, height=700");
               
               //폼 보내기
               form.target = "_chating";
               //form.method = "post";
               form.submit();
               //alert(writer);
               //alert()
               //document.chatfrm.action="/chat/room";
               //document.chatfrm.submit();
            }
            
         }
         
         
</script>

<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
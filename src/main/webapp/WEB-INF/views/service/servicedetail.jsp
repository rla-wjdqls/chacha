<%@page import="kr.co.chacha.servicea.ServiceaDAO"%>
<%@page import="kr.co.chacha.service.ServiceDTO"%>
<%@ page import="kr.co.chacha.service.ServiceDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script>
//페이지 로드 시 함수 실행
window.onload = increaseViewCount;

function sdelete() {
	if(confirm("삭제하겠습니까?")) {//자바스크립트 내장함수
		$("#serviceDelete").submit();
	} else {
		
	}
}

//페이지 로드 시 조회수 증가 요청을 보내는 함수
function increaseViewCount() {
    var sno = ${serviced.sno}; // 현재 게시물의 번호

    // 서버에 조회수 증가 요청을 보냅니다.
    fetch('/increaseViewCount/' + sno, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}

//신청하기 버튼
function apply() {
	checkPerson();
}

//인원체크
function checkPerson() {
	// 서버에 현재 인원 수를 확인하는 AJAX 요청을 보냅니다.
	var url = '/service/checkPerson';
	$.ajax({
		url : url, // 서버의 URL을 지정하세요.
		method : 'POST',
		data : {
			// sno: $("#sno").val() // 필요한 경우 다른 데이터와 함께 전송
			sno : "${serviced.sno}"
		},
		success : function(response) {
			//제한인원
			var maxPerson = "${serviced.sp}";
			//현재 신청인원
			var currentPerson = response;			
			if (Number(maxPerson) <= Number(currentPerson)) {
				alert("더 이상 신청이 불가합니다");
				return false;
			} else {
				location.href = "/service/servicea?sno=${serviced.sno}";				
			}
		},
		error : function() {
			// 오류 처리
			alert('신청 처리 중 오류가 발생했습니다.');
		}
	});
}
</script>

<nav class="navbar navbar-light bg-light" style="height: 42px">
    <ul class="list-inline ml-auto" style="align-items: center;">
      <li class="list-inline-item">
         <a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동</span></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동 모집글 상세보기</span></a>
      </li>
   </ul>
</nav>

 
<div style="text-align: right; height: 50px;">
	<p><a href="/service/serviceList" class="nav-item nav-link"><input type="button" value="글목록"></a></p>	
</div>

<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<p><h3> [모집글 상세보기] </h3></p>
		</div>
	</div>
</div>

<div class="text-center">
	<table class="table table-hover" style="width: 60%; margin-left: auto; margin-right: auto;">
	  <tr>
		<th>봉사글번호</th>
		<td>${serviced.sno}</td>
	  </tr>
	  
	  <tr>
		<th>아이디</th>
		<td>${serviced.uid}</td>
	  </tr>
	  
	  <tr>
		<th>제목</th>
		<td>${serviced.stitle}</td>
	  </tr>
	  
	  <tr>
		<th>내용</th>
		<td>${serviced.sinfo}</td>
	  </tr>
	  
	  <tr>
		<th>모집시작날짜</th>
		<td>${serviced.ssdate}</td>
	  </tr>
	  
	  <tr>
		<th>모집종료날짜</th>
		<td>${serviced.sedate}</td>
	  </tr>
	  
	    <tr>
		<th>봉사시작시간</th>
		<td>${serviced.sstime}</td>
	  </tr>
	  
	  <tr>
		<th>봉사종료시간</th>
		<td>${serviced.etime}</td>
	  </tr>
	  
	  <tr>
		<th>봉사시간</th>
		<td>${serviced.time}</td>
	  </tr>
	  
	  <tr>
		<th>모집인원</th>
		<td>${serviced.sp}</td>
	  </tr>
	  
	  <tr>
		<th>장소</th>
		<td>${serviced.splace}</td>
	  </tr>
	  
	  <tr>
		<th>상태</th>
	  	<td class="myservice_state">
	 		 <c:choose>
				<c:when test="${serviced.sstate eq 'I'}">모집중</c:when>
				<c:when test="${serviced.sstate eq 'E'}">모집마감</c:when>
			</c:choose>
		</td>
	  </tr>
	  <tr>
		<th>조회수</th>
		<td>${serviced.cnt}</td>
	  </tr>
	</table>
</div>
<form id="serviceDelete" name="serviceDelete" method="post" action="/service/serviceDelete">
	<input type="hidden" name="sno" id="sno" value="${serviced.sno}"/>
</form>              

<div style="text-align:center; height: 50px; padding-top: 15px;">
	<p><a href="/service/serviceUpdate?sno=${serviced.sno}">
	<input type="button" value="수정"></a> &nbsp;
	<input type="button" onclick="sdelete();" value="삭제"> &nbsp;
	<a href="#" onclick="apply(); return false;"><input type="button" value="신청"></a></p>
</div>




<%@ include file="../footer.jsp" %>      
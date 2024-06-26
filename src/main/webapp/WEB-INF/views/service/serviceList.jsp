<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<% 
	String s_mlevel = (String)session.getAttribute("s_mlevel");
%>


<nav class="navbar navbar-light bg-light" style="height: 42px">
	<ul class="list-inline ml-auto" style="align-items: center;">
		<li class="list-inline-item"><a href="/"><i
				class="bi bi-house fs-7" style="font-size: 20px, color: #757575"
				alt="홈으로"></i></a> <i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">봉사활동</span></a>
			<i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">봉사활동
					모집글</span></a></li>
	</ul>
</nav>

<div class="container text-center">
	<div class="row">
		<div class="col-sm-12">
			<p>
			<h3>[봉사활동 모집글]</h3>
			</p>
		</div>
	</div>
</div>

<div style="text-align: right; height: 50px;">
		<c:choose>
			<c:when test="${s_mlevel eq 'b'}">
				<p>
					<input type="button" onclick="idPopup()" value="글쓰기">
				</p>		
		    </c:when>
		</c:choose>
</div>
<%
// 세션에서 로그인 여부 확인
String loggedInUser = (String) session.getAttribute("s_id");
%>
<div class="text-center">
	<table class="table table-hover"
		style="width: 70%; margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<td>봉사글번호</td>
				<td>아이디</td>
				<td>제목</td>
				<td>모집시작날짜</td>
				<td>모집종료날짜</td>
				<td>봉사시간</td>
				<td>모집인원</td>
				<td>상태</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${serviceList}" var="myservice">
				<tr>
					<td><a href="servicedetail?sno=${myservice.sno}"
						class="myservice_sno">${myservice.sno}</a></td>
					<td>${myservice.uid}</td>
					<td><a href="servicedetail?sno=${myservice.sno}">${myservice.stitle}</a></td>
					<td>${myservice.ssdate}</td>
					<td>${myservice.sedate}</td>
					<td>${myservice.time}</td>
					<td class="person_count">${myservice.sp}</td>
					<td class="myservice_state"><c:choose>
							<c:when test="${myservice.sstate eq 'I'}">모집중</c:when>
							<c:when test="${myservice.sstate eq 'E'}">모집마감</c:when>
						</c:choose></td>
					<td>${myservice.cnt}</td>
				</tr>
			</c:forEach>
			<tr align="center" height="20">
				<td colspan="9"><c:if test="${startNavi ne 1 && startNavi > 0}">
						<a href="/service/serviceList?page=${startNavi-1}">이전</a>
					</c:if> <c:forEach var="p" begin="${startNavi}" end="${endNavi}">
						<a href="/service/serviceList?page=${p}">${p}</a>
					</c:forEach> <c:if test="${endNavi ne maxPage}">
						<a href="/service/serviceList?page=${endNavi+1}">다음</a>
					</c:if></td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 검색 form -->
<div class="text-center">
	<form id="searchForm" name="searchForm" action="/service/serviceList"
		method="get">
		<select name="type" id="type">
			<option value="title" <c:if test="${type eq 'title'}">selected</c:if>>제목</option>
			<option value="id" <c:if test="${type eq 'id'}">selected</c:if>>아이디</option>
			<option value="titleId"
				<c:if test="${type eq 'titleId'}">selected</c:if>>제목 + 아이디</option>
		</select> <input class="inputId" type="text" name="keyword"
			placeholder="검색어 입력해주세요" value="${keyword}" />
		<button class="submitBtn" type="submit">검색</button>
	</form>
</div>
<script>
$(document).ready(function() {
	// 여기에 HTML 로딩 완료 후 실행할 코드를 작성합니다.
	$('.person_count').each(function(index) {
		const $personCount = $(this);
		const totalCount = $personCount.text();
		const sno = $(this).closest('tr').find('.myservice_sno').text();


        $.ajax({
            url: '/service/checkPerson',    // 서버의 URL
            type: 'POST',           // HTTP 요청 방식
            data: { sno: parseInt(sno) }, // 'sno'를 숫자로 변환하여 보냄
            success: function(data) {
                $personCount.text(data + "/" + $personCount.text());
                
                if(data >= totalCount)
                {
                	$personCount.closest('tr').find('.myservice_state').text("모집마감");
                } 
            },
            error: function(error) {
                console.error(error);
            }
        });
	}); 
});
	    
 	// JSP에서 세션 값을 JavaScript로 전달
    var loggedInUser = '<%=loggedInUser%>';

    
    function idPopup(){ 
		let uid = '<%=(String) session.getAttribute("s_id")%>';
		if (uid == "null") {
			uid = "";
		}
		//alert(uid);
		if (uid.length === 0) {
			alert("로그인 후 이용 바랍니다.");
		} else {
			window.location.href = '/service/serviceForm'; //글쓰기 페이지로 이동
		}//if end
	}//idPopup() end
</script>


<%@ include file="../footer.jsp"%>

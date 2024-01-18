<%@page import="kr.co.chacha.research.ResearchCont"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.time.LocalDate" %>

<%@ page import="java.time.format.DateTimeFormatter" %>

    
<%@ include file="../header.jsp" %>

<% 
	String s_mlevel = (String)session.getAttribute("s_mlevel");
%>

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
		<p>설문조사 페이지 입니다</p>
		<hr><br>
		<c:choose>
			<c:when test="${s_mlevel eq 'b'}">
  			<div>
  			<a href="/research/researchReg" class="btn btn">설문조사 등록하기</a>
		    </div>
		    </c:when>
		</c:choose>
		<br><br>
		<div class="container-line">
			<h5>여러분의 의견을 들려주세요~</h5>
			<br>
			<!--db 불러오기 -->
<div class="row">
    <c:forEach items="${researchList}" var="list">
        <c:choose>
            <c:when test="${list.rop eq 'Y' || (list.rop eq 'N' && s_mlevel eq 'b')}">
                <div class="col-sm-4">
                    <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px;">
                        <h5>${list.rtitle}</h5>
                        <p>${list.rdate1} ~ ${list.rdate2}</p>
                        <c:choose>
                            <c:when test="${list.rstate eq 'I'}">진행중</c:when>
                            <c:when test="${list.rstate eq 'E'}">마감</c:when>
                        </c:choose>
                        <br><hr>
                        <c:if test="${list.rstate ne 'E'}">
                            <a href="javascript:void(0);" class="btn btn-primary btn-sm" onclick="checkAndRedirect('${list.rno}')">바로가기</a>
                        </c:if>
                        <a href="/research/researchResult?rno=${list.rno}" class="btn btn-success btn-sm">결과보기</a>
                        <c:choose>
                            <c:when test="${s_mlevel eq 'b'}">
                                <a href="/research/researchModify?rno=${list.rno}" class="btn btn-secondary btn-sm">수정하기</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </c:forEach>
</div>


	<br><br><br>


<!-- 본문 끝 -->

<script>

function chechkLogin() {
    let s_id = '<%= (String)session.getAttribute("s_id") %>';
    //alert(s_id);

    if (s_id !== "null") {
        // 로그인된 경우 설문조사 페이지로 이동
        return true;
    } else {
        alert("로그인 후 이용해 주세요");
        // 로그인되지 않은 경우 경고창만 띄우고 이동하지 않음
        return false;
    }//if end
}

function checkAndRedirect(rno) {
    if (chechkLogin()) {
        $.ajax({
            url: '/research/checkUser',
            type: 'get',
            data: { 'rno': rno },
            error: function (error) {
                alert('에러!');
                console.log(error);
            },
            success: function (result) {
                if (result !== 0) {
                    alert("이미 참여한 설문에는 재참여 하실 수 없습니다.");
                } else {
                    window.location.href = '/research/researchForm?rno=' + rno;
                }
            }
        });
    }
}




</script>





<%@ include file="../footer.jsp" %>     








 
 
 
 
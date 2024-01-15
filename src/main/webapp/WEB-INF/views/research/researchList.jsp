<%@page import="kr.co.chacha.research.ResearchCont"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.time.LocalDate" %>

<%@ page import="java.time.format.DateTimeFormatter" %>


<%-- <%
    // 현재 날짜를 가져오는 메서드
    LocalDate currentDate = LocalDate.now();
    
    // rdate1을 LocalDate로 변환하는 메서드
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate researchDate = LocalDate.parse(researchList.rdate1, formatter);

    // isAfterCurrentDate 호출
    boolean afterCurrentDate = ResearchCont.isAfterCurrentDate(researchDate);
%>  --%>
    
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
 			<div class="container-fixed row">
				<c:forEach items="${researchList}" var="list">
				  	<div class="col-sm-4 col-md-4">
				  		<br>
				    	<h5>${list.rtitle}</h5>
				    	<p>${list.rdate1} ~ ${list.rdate2}</p>
<%-- 				        <c:if test="${fn:trim(list.rstate) eq 'I' && yourController.isAfterCurrentDate(list.rdate1)}">
				            <c:set target="${list}" property="rstate" value="E" />
				        </c:if> --%>
				    <c:choose>
		                <c:when test="${list.rstate eq 'I'}">진행중</c:when>
		                <c:when test="${list.rstate eq 'E'}">마감</c:when>
	            	</c:choose>
	            	
	            	<br><br>
	            	
		            <c:if test="${list.rstate ne 'E'}">
		           	 	<a href="/research/researchForm?rno=${list.rno}" class="btn btn-primary" onclick="return chechkLogin()">바로가기</a>
		            </c:if>
		           		 <a href="/research/researchResult?rno=${list.rno}" class="btn btn-success">결과보기</a>
		            <c:choose>
					<c:when test="${s_mlevel eq 'b'}">
		  				<a href="/research/researchModify?rno=${list.rno}" class="btn btn-secondary">수정하기</a>
				    </c:when>
					</c:choose>
					 </div>
				</c:forEach>
			</div>
			
			</div>
			</div>
			</div>
		</div>
	<br><br><br>


<!-- 본문 끝 -->

<<script>

function chechkLogin(){
	
	let s_id = '<%= (String)session.getAttribute("s_id") %>';
	//alert(s_id);
	
	if(uid=="null"){
		alert("로그인 후 이용해 주세요");
		return false;
	}//if end
	
	return true;
}//chechkLogin() end




</script>





<%@ include file="../footer.jsp" %>     








 
 
 
 
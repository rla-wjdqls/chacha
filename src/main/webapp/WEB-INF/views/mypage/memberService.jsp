<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
	<br><br>
		<h4>봉사신청내역</h4>
		<p>회원님들의 봉사신청내역을 확인할 수 있습니다</p>
		<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>봉사신청번호</th>
                <th>아이디</th>
                <th>신청글제목</th>
                <th>신청날짜</th>
                <th>신청시간</th>
                <th>신청상태</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${memserviceList}" var="memservice" >
                <tr>
                    <td>${memservice.sano}</td>
                    <td>${memservice.uid}</td>
                    <td><a href="/service/servicedetail?sno=${memservice.sno}">${memservice.stitle}</a></td>
                    <td><fmt:formatDate value="${memservice.sadate}" pattern="yyyy-MM-dd" /></td>
                    <td>${memservice.stime}</td>
                    <td>
		            <c:choose>
		                <c:when test="${memservice.astate eq 'o'}">신청완료</c:when>
		                <c:when test="${memservice.astate eq 'x'}">신청취소</c:when>
		            </c:choose>
		        	</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
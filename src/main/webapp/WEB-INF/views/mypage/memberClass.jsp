<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
	<div class="container">
		<h4>내 강의실</h4>
		<p>내가 신청한 강의 수강 현황을 확인할 수 있습니다</p>
		<br>
		
		<div>
			<table class="table table-condensed">
	        <thead>
	            <tr>
	                <th>아이디</th>
	                <th>강의번호</th>
	                <th>교육신청번호</th>
	                <th>내용</th>
	                <th>수료상태</th>
	                <th>신청날짜</th>
	                <th>수료날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${memberClassList}" var="memedu" >
	                <tr>
	                    <td>${memedu.uid}</td>
	                    <td>${memedu.myno}</td>
	                    <td>${memedu.eduno}</td>
	                    <td>${memedu.mycon}</td>
	                    <td>
			            <c:choose>
			                <c:when test="${memedu.mystate eq 'y'}">수료완료</c:when>
			                <c:when test="${memedu.mystate eq 'n'}">수료미완료</c:when>
			            </c:choose>
		       	   		</td>
	                    <td><fmt:formatDate value="${memedu.mydate}" pattern="yyyy-MM-dd" /></td>
	                    <td><fmt:formatDate value="${memedu.mycomple}" pattern="yyyy-MM-dd" /></td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    	</table>
		</div>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
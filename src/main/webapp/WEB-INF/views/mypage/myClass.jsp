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
	                <th>강의구분</th>
	                <th>교육신청번호</th>
	                <th>수료상태</th>
	                <th>수료날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${myClassList}" var="myedu" >
	                <tr>
	                    <td>
	                    <c:choose>
				                <c:when test="${myedu.eduop != 'dog'}">
				                    고양이 교육 강의
				                </c:when>
				                <c:otherwise>
				                    강아지 교육 강의
				                </c:otherwise>
				            </c:choose>
				            </td>
	                    <td>${myedu.eduno}</td>
			            <td>
				            <c:choose>
				                <c:when test="${myedu.score >= 60}">
				                    수료완료
				                </c:when>
				                <c:otherwise>
				                    미수료
				                </c:otherwise>
				            </c:choose>
			        	</td>		       	   		
	                    <td>${myedu.edu_date}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    	</table>
		</div>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
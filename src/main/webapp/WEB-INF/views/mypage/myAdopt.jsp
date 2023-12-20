<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
	<br><br>
		<h4>입양신청내역</h4>
		<p>나의 입양 신청 내역을 확인 할 수 있습니다</p>
		<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>입양신청번호</th>
                <th>신청글</th>
                <th>신청날짜</th>
                <th>신청상태</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myServiceList}" var="myservice" >
                <tr>
                    <td>${myservice.sano}</td>
                    <td>${myservice.sadate}</td>
                    <td>${myservice.stime}</td>
                    <td>${myservice.astate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
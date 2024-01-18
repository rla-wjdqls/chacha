<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->
<% String s_id = (String)session.getAttribute("s_id"); %>

	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
	<!-- 목격제보, 입양후기, 봉사글, 입양동물, (교육? 테이블 없음) -->
	<!-- 어느 게시판 글인지 어떻게 보여줄지 아직 미정 --> 

	<div class="container">
	<br><br>
		<h4>글목록</h4>
		<p>내가 쓴 글목록을 확인 할 수 있습니다</p><hr><br>
		<p>총 게시물 : ${totalPost} 개</p><br>
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>글번호</th>
                <th width="700">제목</th>
                <th>조회수</th>
                <!-- <th>작성일</th> -->
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${myServiceList}" var="myservice">
	    <c:if test="${s_id eq myservice.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td>${myservice.sno}</td>
	            <td><a href="/service/servicedetail?sno=${myservice.sno}">${myservice.stitle}</a></td>
	            <td>${myservice.cnt}</td>
	            <%-- <td><fmt:formatDate value="${myservice.uploaddate}" pattern="yyyy-MM-dd" /></td> --%>
	        </tr>
	    </c:if>
		</c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->





<%@ include file="./mypageFooter.jsp" %>      
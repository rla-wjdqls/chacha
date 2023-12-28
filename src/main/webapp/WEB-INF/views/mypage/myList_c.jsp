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
		<p>내가 쓴 글목록을 확인 할 수 있습니다</p>
	<br>
	<input type="button" value="전체선택" class="btn btn default">
	<input type="button" value="삭제" class="btn btn default">
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
            	<th></th>
                <th>글번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${myHelpList}" var="myhelp">
	    <c:if test="${s_id eq myhelp.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td><input type="checkbox"></td> <!-- 삭제기능 넣을 것 -->
	            <td>${myhelp.textno}</td>
	            <td><a href="/help/helpDetail?textno=${myhelp.textno}">${myhelp.texttitle}</a></td>
	            <td>${myhelp.cnt_help}</td>
	            <td><fmt:formatDate value="${myhelp.uploaddate}" pattern="yyyy-MM-dd" /></td>
	        </tr>
	    </c:if>
		</c:forEach>
		<c:forEach items="${myAdoprvList}" var="myadoprv">
	    <c:if test="${s_id eq myadoprv.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td><input type="checkbox"></td> <!-- 삭제기능 넣을 것 -->
	            <td>${myadoprv.arno}</td>
	            <td>${myadoprv.artitle}</td>
	            <td>${myadoprv.cnt_adoprv}</td>
	            <td><fmt:formatDate value="${myadoprv.ardate}" pattern="yyyy-MM-dd" /></td>
	        </tr>
	    </c:if>
		</c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
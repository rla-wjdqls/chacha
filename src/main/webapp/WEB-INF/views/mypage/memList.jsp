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
	<br>
		<h4>글목록</h4>
		<p>내가 쓴 글목록을 확인 할 수 있습니다</p>
	<br><br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>동물번호</th>
                <th>이름</th>
                <th>나이</th>
                <th>성별</th>
                <th>무게</th>
                <th>중성화</th>
                <th>백신</th>
                <th>입양상태</th>
                <th>입양가능</th>
                <th>작성일자</th>
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${myList_a}" var="mylista">
	    <c:if test="${s_id eq mylista.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td>${mylista.anino}</td>
	            <td>${mylista.aname}</td>
	            <td>${mylista.age}</td>
	            <td>${mylista.gender}</td>
	            <td>${mylista.weight}</td>
	            <td>${mylista.genop}</td>
	            <td>${mylista.vac}</td>
	            <td>${mylista.adopt}</td>
	            <td>${mylista.adopt_pos}</td>
	            <td>${mylista.animal_date}</td>
	        </tr>
	    </c:if>
		</c:forEach>
        </tbody>
    </table>
	</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      












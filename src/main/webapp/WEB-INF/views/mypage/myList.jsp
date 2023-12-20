<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


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
	<input type="button" value="전체선택">
	<input type="button" value="삭제">
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
            <c:forEach items="${myCommentList}" var="mycomment" >
                <tr>
                	<td><input type="checkbox"></td> <!--삭제기능 넣을 것-->
                    <td>${mycomment.comno}</td>
                    <td>${mycomment.adcm}</td>
                    <td>${mycomment.artitle}</td>
                    <td>${mycomment.acdate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
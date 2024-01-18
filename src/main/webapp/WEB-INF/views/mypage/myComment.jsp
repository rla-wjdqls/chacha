<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
	<br><br>
		<h4>댓글목록</h4>
		<p>내가 쓴글 댓글 목록을 확인 할 수 있습니다</p>
		<p>총 댓글 수 : ${totalComment} 개</p><br>
	<input type="button" value="전체선택" class="btn btn default">
	<input type="button" value="삭제" class="btn btn default">
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th></th>
                <th>글번호</th>
                <th>내용</th>
                <th>원문제목</th>
                <th>작성일</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myCommentList}" var="mycomment" >
                <tr>
                    <td><input type="checkbox"></td> <!--삭제기능 넣을 것-->
                    <td>${mycomment.commentNo}</td>
                    <td>${mycomment.content}</td>
                    <td>${mycomment.artitle}</td>
                    <td><fmt:formatDate value="${mycomment.commentDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
        		<!-- 검색 시작  -->	 
    	<div class="text-center">
		 <tr>
		 	<td colspan='4' style='text-align:center'; height: 50px;>
		 		<form action="bbsList.jsp" onsubmit="return searchCheck()"><!-- myscript.js 함수 작성함 -->
		 			<select name="col">
		 				<option value="subject_content">제목+내용
		 				<option value="subject">제목
		 				<option value="content">내용
		 				//<option value="wname">작성자
		 			</select>
					<input type="text" name="word" id="word">		 		
					<input type="submit" value="검색" class="btn">		 		
		 		</form>
		 	</td>
		 </tr>
		 </div>
		<!-- 검색 끝   -->	
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
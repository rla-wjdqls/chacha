<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>


	<div id="page-content-wrapper">
	<div class="container">
	<br><br>
		<h4>댓글목록</h4>
		<p>내가 쓴글 댓글 목록을 확인 할 수 있습니다</p><hr><br>
		<p>총 댓글 수 : ${totalComment} 개</p><br>
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>글번호</th>
                <th width="400px">원글제목</th>
                <th width="400px">내용</th>
                <th>작성일</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myCommentList}" var="mycomment" >
                <tr>
                    <td>${mycomment.commentNo}</td>
                    <td><a href="/help/helpDetail?textno=${mycomment.textno}">${mycomment.texttitle}</a></td>
                    <td>${mycomment.content}</td>
                    <td><fmt:formatDate value="${mycomment.commentDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
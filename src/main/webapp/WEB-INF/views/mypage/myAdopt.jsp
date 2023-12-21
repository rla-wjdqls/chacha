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
            	<!--신청글 제목없음 -->
                <th>신청번호</th>
                <th>신청글 사진</th>
                <th>신청내용</th>
                <th>신청일</th>
                <th>신청상태</th> <!--사용자에게는 value 값으로 보여줄 것-->
                <th>첨부파일</th>
                
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myAdoptList}" var="myAdopt" >
                <tr>
                    <td>${myAdopt.apno}</td>
                    <td>${myAdopt.anipic}</td>
                    <td>${myAdopt.sub_cont}</td>
                    <td>${myAdopt.sub_date}</td>
                    <td>${myAdopt.sub_state}</td>
                    <td>${myAdopt.subpic}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
		
		
	<!--비밀번호 맞으면 수정페이지(myInfoModify)로 넘어감 -->
	<div class="container">
		<h4>회원정보</h4><br>
		<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
		<br><hr><br>
		<div class="container-line">
			<h5>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.<h5>
			<br>
			<input type="password" placeholder="비밀번호를 입력해주세요" name="passwd" id="passwd">
			<input type="button" value="확인" name="ok" id="ok">
		</div>
		</div>
	</div>




<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
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
		<p>회원님들의 입양신청내역을 확인 할 수 있습니다</p>
	<table class="table table-condensed">
        <thead>
            <tr>
            	<!--신청글 제목없음 -->
                <th>신청번호</th>
                <th>아이디</th>
                <th>신청일자</th>
                <th>신청상태</th> <!--사용자에게는 value 값으로 보여줄 것-->
                <th>첨부파일</th>
                
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${memAdoptList}" var="memAdopt" >
                <tr>
                    <td>${memAdopt.apno}</td>
                    <td>${memAdopt.uid}</td>
                    <td><fmt:formatDate value="${memAdopt.sub_date}" pattern="yyyy-MM-dd" /></td>
                    <td style="text-align: left">
				        <select name="job"  id="job">
				          <option value="0">선택하세요.</option>
				          <option value="S">신청완료</option>
				          <option value="P" selected>심사중</option>
				          <option value="W">심사완료</option>
				          <option value="G">입양가능</option>
				          <option value="C">책임금결제</option>
				          <option value="F">입양완료</option>
				          <option value="X">입양불가능</option>
				        </select>
<%-- 		            <c:choose>
		                <c:when test="${memAdopt.sub_state eq 'S'}">신청완료</c:when>
		                <c:when test="${memAdopt.sub_state eq 'P'}">심사중</c:when>
		                <c:when test="${memAdopt.sub_state eq 'W'}">심사완료</c:when>
		                <c:when test="${memAdopt.sub_state eq 'G'}">입양가능</c:when>
		                <c:when test="${memAdopt.sub_state eq 'C'}">책임금결제</c:when>
		                <c:when test="${memAdopt.sub_state eq 'F'}">입양완료</c:when>
		                <c:when test="${memAdopt.sub_state eq 'X'}">입양불가능</c:when>
		            </c:choose>  --%>
		        	</td>
                    <td>${memAdopt.subpic}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br><hr><br><br>
    	<h4>책임금 결제 내역</h4>
		<p>회원님들의 책임금 결제 내역을 확인 할 수 있습니다</p>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>결제번호</th>
                <th>신청번호</th>
                <th>아이디</th>
                <th>결제금액</th>
                <th>결제수단</th>
                <th>결제여부</th> <!--사용자에게는 value 값으로 보여줄 것-->
                <th>결제일자</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${memAdoptList}" var="memAdopt" >
                <tr>
                    <td>${memAdopt.payno}</td>
                    <td>${memAdopt.apno}</td>
                    <td>${memAdopt.uid}</td>
                    <td>${memAdopt.patamt}</td>
                    <td>
		            <c:choose>
		                <c:when test="${memAdopt.paymet eq 'cd'}">카드</c:when>
		                <c:when test="${memAdopt.paymet eq 'ch'}">현금</c:when>
		            </c:choose>
		        	</td>
                    <td>
		            <c:choose>
		                <c:when test="${memAdopt.payop eq 'Y'}">결제완료</c:when>
		                <c:when test="${memAdopt.payop eq 'N'}">결제대기</c:when>
		            </c:choose>
		        	</td>
                    <td><fmt:formatDate value="${memAdopt.pdate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br><br>
    
	</div>
	</div>
	



<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
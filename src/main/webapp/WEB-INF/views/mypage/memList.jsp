<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->
<% String s_id = (String)session.getAttribute("s_id"); %>

	<!-- Page content wrapper-->
	<div id="page-content-wrapper">
	<!-- Page content-->

	<div class="container">
	<br>
		<h4>회원관리</h4>
		<p>그냥 데려가개 회원님들의 정보를 확인 할 수 있습니다</p>
	<br><br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>비밀번호</th>
                <th>전화번호</th>
                <th>생년월일</th>
                <th>회원등급</th>
                <th>가입일자</th>
                <th>우편번호</th>
                <th>주소1</th>
                <th>주소2</th>
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${memberList}" var="memlist">
	        <tr>
	            <td>${memlist.uid}</td>
	            <td>${memlist.uname}</td>
	            <td>${memlist.email}</td>
	            <td>${memlist.passwd}</td>
	            <td>${memlist.tel}</td>
	            <td>${memlist.birth}</td>
	            <td>
 				<select name="mlevel" id="mlevel">
                  <c:choose>
                      <c:when test="${memlist.mlevel eq 'a'}">
                          <option value="a" selected>관리자</option>
                          <option value="b">파트너</option>
                          <option value="c">사용자</option>
                      </c:when>
                      <c:when test="${memlist.mlevel eq 'b'}">
                          <option value="a">관리자</option>
                          <option value="b" selected>파트너</option>
                          <option value="c">사용자</option>
                      </c:when>
                      <c:otherwise>
                          <option value="a">관리자</option>
                          <option value="b">파트너</option>
                          <option value="c" selected>사용자</option>
                      </c:otherwise>
                  </c:choose>
                </select>
		        </td>
	            <td><fmt:formatDate value="${memlist.mdate}" pattern="yyyy-MM-dd" /></td>
	            <td>${memlist.zipcode}</td>
	            <td>${memlist.addr1}</td>
	            <td>${memlist.addr2}</td>
	        </tr>
		</c:forEach>
        </tbody>
    </table>
	</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      












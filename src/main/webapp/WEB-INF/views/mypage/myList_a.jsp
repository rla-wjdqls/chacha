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
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td><a href="/center/detail?anino=${mylista.anino}">${mylista.anino}</a></td>
	            <td>${mylista.aname}</td>
	            <td>${mylista.age}</td>
                <td>
	            <c:choose>
	                <c:when test="${mylista.gender eq 'M'}">남자</c:when>
	                <c:when test="${mylista.gender eq 'F'}">여자</c:when>
	            </c:choose>
	       	   </td>
	            <td>${mylista.weight}</td>
	            <td>
            	<c:choose>
	                <c:when test="${mylista.genop eq 'Y'}">완료</c:when>
	                <c:when test="${mylista.genop eq 'N'}">미완료</c:when>
	            </c:choose>
	            </td>
	            <td>
	            <c:choose>
	                <c:when test="${mylista.vac eq 'Y'}">완료</c:when>
	                <c:when test="${mylista.vac eq 'N'}">미완료</c:when>
	            </c:choose>
	            </td>
	              <td>
 				<select name="adopt" id="adopt">
                  <c:choose>
                      <c:when test="${mylista.adopt eq 'a'}">
                          <option value="a" selected>신청완료</option>
                          <option value="b">심사중</option>
                          <option value="c">입양가능</option>
                          <option value="b">책임금결제</option>
                          <option value="c">입양완료</option>
                          <option value="c">입양불가</option>
                      </c:when>
                      <c:when test="${mylista.adopt eq 'a'}">
                          <option value="a">신청완료</option>
                          <option value="b" selected>심사중</option>
                          <option value="c">입양가능</option>
                          <option value="b">책임금결제</option>
                          <option value="c">입양완료</option>
                          <option value="c">입양불가</option>
                      </c:when>
                      <c:when test="${mylista.adopt eq 'a'}">
                          <option value="a">신청완료</option>
                          <option value="b">심사중</option>
                          <option value="c" selected>입양가능</option>
                          <option value="b">책임금결제</option>
                          <option value="c">입양완료</option>
                          <option value="c">입양불가</option>
                      </c:when>
                      <c:when test="${mylista.adopt eq 'a'}">
                          <option value="a">신청완료</option>
                          <option value="b">심사중</option>
                          <option value="c">입양가능</option>
                          <option value="b" selected>책임금결제</option>
                          <option value="c">입양완료</option>
                          <option value="c">입양불가</option>
                      </c:when>
                      <c:when test="${mylista.adopt eq 'a'}">
                          <option value="a">신청완료</option>
                          <option value="b">심사중</option>
                          <option value="c">입양가능</option>
                          <option value="b">책임금결제</option>
                          <option value="c" selected>입양완료</option>
                          <option value="c">입양불가</option>
                      </c:when>
                      <c:otherwise>
                          <option value="a">신청완료</option>
                          <option value="b">심사중</option>
                          <option value="c">입양가능</option>
                          <option value="b">책임금결제</option>
                          <option value="c">입양완료</option>
                          <option value="c" selected>입양불가</option>
                      </c:otherwise>
                  </c:choose>
                </select>
		        </td>
		        <td>
 				<select name="adopt_pos" id="adop_pos">
                  <c:choose>
                      <c:when test="${mylista.adopt_pos eq 'Y'}">
                          <option value="Y" selected>입양가능</option>
                          <option value="N">입양불가</option>
                      </c:when>
                      <c:when test="${mylista.adopt_pos eq 'N'}">
                          <option value="Y">입양가능</option>
                          <option value="N" selected>입양불가</option>
                      </c:when>
                  </c:choose>
                </select>
		        </td>
	            <td><fmt:formatDate value="${mylista.animal_date}" pattern="yyyy-MM-dd" /></td>
	        </tr>
		</c:forEach>
        </tbody>
    </table>
	</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      












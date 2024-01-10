<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>



<nav class="navbar navbar-light bg-light" style="height: 42px">
    <ul class="list-inline ml-auto" style="align-items: center;">
      <li class="list-inline-item">
         <a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동</span></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동 모집글</span></a>
      </li>
   </ul>
</nav>
	
<div class="container text-center">
	<div class="row">
 		<div class="col-sm-12"> 
			<p><h3> [봉사활동 모집글] </h3></p>
		</div>
	</div>
</div>

<div style="text-align: right; height: 50px;">
	<p><a href="/service/serviceForm" class="nav-item nav-link"><input type="button" value="글쓰기"></a></p>
</div>

<div class="text-center">
	<table class="table table-hover" style="width: 70%; margin-left: auto; margin-right: auto;">
		<thead> 
			<tr>
			 	 <td>봉사글번호</td>
				 <td>아이디</td>
				 <td>제목</td>
				 <td>모집시작날짜</td>
				 <td>모집종료날짜</td>
				 <td>봉사시간</td>
				 <td>모집인원</td>
				 <td>상태</td>
				 <td>조회수</td>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach items="${serviceList}" var="myservice" >
                <tr>  	
                    <td><a href="servicedetail?sno=${myservice.sno}">${myservice.sno}</td>
                    <td>${myservice.uid}</td>
                    <td><a href="servicedetail?sno=${myservice.sno}">${myservice.stitle}</td>
                    <td>${myservice.ssdate}</td>
                    <td>${myservice.sedate}</td>
                    <td>${myservice.time}</td>
                    <td>${myservice.sp}</td>
                     <td>
		            <c:choose>
		                <c:when test="${myservice.sstate eq 'I'}">모집중</c:when>
		                <c:when test="${myservice.sstate eq 'E'}">모집마감</c:when>
		            </c:choose>
		       	   </td>
                    <td>${myservice.cnt}</td>
                </tr>
  			</c:forEach>
  			<tr align="center" height="20">
  				<td colspan="9">
  					<c:if test="${startNavi ne 1 && startNavi > 0}">
  						<a href="/service/serviceList?page=${startNavi-1}">이전</a>
  					</c:if>
  					<c:forEach var="p" begin="${startNavi}" end="${endNavi}">
  						<a href="/service/serviceList?page=${p}">${p}</a>
  					</c:forEach>
  					<c:if test="${endNavi ne maxPage}">
  						<a href="/service/serviceList?page=${endNavi+1}">다음</a>
  					</c:if>
  				</td>
  			</tr>
  		</tbody>	  
  </table>
</div> 
<!-- 검색 form -->
<div class="text-center">
	<form id="searchForm"name="searchForm" action="/service/serviceList" method="get" >
		<select name="type" id="type">
			<option value="">전체</option>
			<option value="title" <c:if test="${type eq 'title'}">selected</c:if>>제목</option>
			<option value="id"  <c:if test="${type eq 'id'}">selected</c:if>>아이디</option>
			<option value="titleId"  <c:if test="${type eq 'titleId'}">selected</c:if>>제목 + 아이디</option>
		</select>
		<input class="inputId" type="text" name="keyword" placeholder="검색어 입력해주세요" value="${keyword}"/>
		<button class="submitBtn" type="submit">검색</button>
	</form>
</div>	



<%@ include file="../footer.jsp" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
	<br><br>
		<h4>찜목록</h4>
		<p>콕! 찜해 놓은 아이들을 볼 수 있는 공간입니다</p>
		<br>
	<table class="table table-condensed">
        <thead>
            <tr>
            	<th>	</th>
                <th>사진</th>
                <th>이름</th>
                <th>성별</th>
                <th>나이</th>
                <th>무게</th>
                <th>중성화여부</th>
                <th>접종여부</th>
            </tr>
        </thead>     
		<tbody>
            <c:forEach items="${myjjimList}" var="jjim" >
                <tr>
                   <td>
		            <c:choose>
					<%--로그인 상태에 찜 클릭 --%>
					<c:when test="${not empty sessionScope.s_id}">
						<div class="icon-heart" id="jjimInsertContainer"> 
							<i class="bi bi-heart" id="jjimInsert"></i>
						</div>	
						<div class="icon-heart" id="jjimDeleteContainer">
								<i class="bi bi-heart-fill" id="jjimDelete"></i>
						</div>	
					</c:when>
					<c:otherwise>
						<div class="icon-heart">
							<i class="bi bi-heart" id="jjimButton" onclick="jjim_nolog()"></i>
						</div>	
					</c:otherwise>		
					</c:choose>	
		           </td>
                   <td><a href="/center/detail?anino=${jjim.anino}"><img src="/storage/${jjim.anipic}" class="anipic"></a></td>
                   <td>${jjim.aname}</td>
                   <td>
		            <c:choose>
		                <c:when test="${jjim.gender eq 'M'}">남자</c:when>
		                <c:when test="${jjim.gender eq 'F'}">여자</c:when>
		            </c:choose>
		       	   </td>
                   <td>${jjim.age}</td>
                   <td>${jjim.weight}</td>
                   <td>${jjim.genop}</td>
                   <td>${jjim.vac}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      


















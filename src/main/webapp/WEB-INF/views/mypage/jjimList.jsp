<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
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
                    <td>${jjim.jjim_icon}</td>
                    <td>${jjim.anipic}</td>
                    <td>${jjim.aname}</td>
                    <td>${jjim.gender}</td>
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


















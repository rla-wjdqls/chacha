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
	<br><br>
		<h4>글목록</h4>
		<p>내가 쓴 글목록을 확인 할 수 있습니다</p>
	<br>
	<input type="button" value="전체선택" class="btn btn default" id="btn-select-all">
	<input type="button" value="삭제" class="btn btn default" id="btn-delete">
	<br>
	<table class="table table-condensed">
        <thead>
            <tr>
            	<th><input type="checkbox" id="cbx_chkAll"></th>
                <th>글번호</th>
                <th>제목</th>
                <th>조회수</th>
                <!-- <th>작성일</th> -->
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${myServiceList}" var="myservice">
	    <c:if test="${s_id eq myservice.uid}"> <!-- help 테이블의 작성자 아이디와 s_id 가 일치하면 원하는 값 가져옴 -->
	        <!-- 조건이 참일 때 실행할 내용 -->
	        <tr>
	            <td><input type="checkbox" class="chk" name="chk"></td> <!-- 삭제기능 넣을 것 -->
	            <td>${myservice.sno}</td>
	            <td><a href="/service/servicedetail?sno=${myservice.sno}">${myservice.stitle}</a></td>
	            <td>${myservice.cnt}</td>
	            <%-- <td><fmt:formatDate value="${myservice.uploaddate}" pattern="yyyy-MM-dd" /></td> --%>
	        </tr>
	    </c:if>
		</c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<script>
$(document).ready(function () {
    $("#btn-select-all").change(function () {
        if ($("#cbx_chkAll").is(":checked")) {
            $("input[name=chk]").prop("checked", true);
        } else {
            $("input[name=chk]").prop("checked", false);
        }
    });

    $("input[name=chk]").change(function () {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if (total != checked) {
            $("#cbx_chkAll").prop("checked", false);
        } else {
            $("#cbx_chkAll").prop("checked", true);
        }
    });
});
</script>








<%@ include file="./mypageFooter.jsp" %>      
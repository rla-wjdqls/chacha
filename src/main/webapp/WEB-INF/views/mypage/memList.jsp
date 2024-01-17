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
                <th></th>
            </tr>
        </thead>
  		<tbody>
  		<form id="memListfrm" name="memListfrm" method="post" action="memListModify">
		<c:forEach items="${memberList}" var="memlist">
		<input type="hidden" id="uid" name="uid" value="${memlist.uid}">
  		<input type="hidden" id="mlevel" name="mlevel" value="${memlist.mlevel}">
	        <tr>
	            <td>${memlist.uid}</td>
	            <td>${memlist.uname}</td>
	            <td>${memlist.email}</td>
	            <td>${memlist.passwd}</td>
	            <td>${memlist.tel}</td>
	            <td>${memlist.birth}</td>
	            <td>
 				<select name="mlevel" id="mlevel_${memlist.uid}">
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
	            <td><input type="button" value="수정" class="btn btn-update"></td>
	        </tr>
		</c:forEach>
        </tbody>
    </table>
    </form>
    <br><hr>
		<h4>소셜 회원관리</h4>
		<p>그냥 데려가개 소셜 회원님들의 정보를 확인 할 수 있습니다</p>
    <br><br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>이름</th>
                <th>이메일</th>
                <th>회원등급</th>
                <th>가입일자</th>
            </tr>
        </thead>
  		<tbody>
		<c:forEach items="${smemberList}" var="smemlist">
	        <tr>
	            <td>${smemlist.s_uname}</td>
	            <td>${smemlist.s_email}</td>
	            <td>${smemlist.s_mlevel}</td>
	            <td><fmt:formatDate value="${smemlist.s_mdate}" pattern="yyyy-MM-dd" /></td>
	        </tr>
		</c:forEach>
        </tbody>
    </table>
	</div>
	</div>

<script>

$(document).ready(function () {
	// 수정 버튼 클릭 시
    $(".btn-update").click(function () {
        // 해당 행의 uid와 mlevel 값을 가져와서 폼에 설정
        var uid = $(this).data("uid");
        var mlevel = $(this).data("mlevel");
        
        // 기존의 hidden input의 id 속성을 uid와 mlevel로 변경
        $("#memListfrm #uid").attr("id", "uid_" + uid);
        $("#memListfrm #mlevel").attr("id", "mlevel_" + uid);
        
        // 기존의 hidden input의 name 속성을 uid와 mlevel로 변경
        $("#memListfrm #uid_" + uid).attr("name", "uid_" + uid);
        $("#memListfrm #mlevel_" + uid).attr("name", "mlevel_" + uid);

        // 기존의 hidden input의 값을 변경된 id로 설정
        $("#memListfrm #uid_" + uid).val(uid);
        $("#memListfrm #mlevel_" + uid).val(mlevel);

        // 폼 제출
        $("#memListfrm").submit();
    });
});
</script>


<%@ include file="./mypageFooter.jsp" %>      












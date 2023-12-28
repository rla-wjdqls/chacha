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
					<c:when test="${not empty sessionScope.s_id}">
						<div class="icon-heart" id="jjimDeleteContainer">
							<i class="bi bi-heart-fill" id="jjimDelete"></i>
						</div>	
					</c:when>	
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
                   <td>
                   <c:choose>
		                <c:when test="${jjim.genop eq 'Y'}">완료</c:when>
		                <c:when test="${jjim.genop eq 'X'}">미완료</c:when>
		           </c:choose>
		           </td>
		           <td>
		           <c:choose>
		                <c:when test="${jjim.vac eq 'Y'}">완료</c:when>
		                <c:when test="${jjim.vac eq 'X'}">미완료</c:when>
		           </c:choose>
		           </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	</div>
	</div>


<!-- 본문 끝 -->

<script>
	let anino = '${jjim.anino}';
	//alert(anino); //확인 안됨
	
    $(document).ready(function() {
        // 삭제 버튼 클릭 시
        $("#jjimDelete").click(function() {
            // 서버로 삭제 요청을 보내는 AJAX 요청
            
            $.ajax({
                type: "POST", // 또는 "GET" 등 필요에 따라 변경
                url: "/mypage/delete", // 실제 서버 엔드포인트로 변경
                data: {
                    // 삭제에 필요한 데이터를 전달 (예: 삭제할 아이템의 식별자)
                    anino: anino
                },
                error: function(error) {
                    // 실패 시 수행할 작업
                    console.log(error);
                },
                success: function(result) {
                    // 성공 시 수행할 작업
                    if(result ===1){
                    alert("삭제 성공");
                    }
                }
            });
        });
    });
</script>


<%@ include file="./mypageFooter.jsp" %>      


















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>


<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
	<br><br>
		<h4>봉사신청내역</h4>
		<p>나의 봉사 신청 내역을 확인 할 수 있습니다</p>
		<br>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>봉사신청번호</th>
                <th>신청글제목</th>
                <th>신청날짜</th>
                <th>신청시간</th>
                <th>신청상태</th>
                <th></th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myServiceList}" var="myservice" >
                <tr>
                    <td>${myservice.sano}</td>
                    <td><a href="/service/servicedetail?sno=${myservice.sno}">${myservice.stitle}</a></td>
                    <td><fmt:formatDate value="${myservice.sadate}" pattern="yyyy-MM-dd" /></td>
                    <td>${myservice.time}</td>
                    <td>
		            <c:choose>
		                <c:when test="${myservice.astate eq 'O'}">신청완료</c:when>
		                <c:when test="${myservice.astate eq 'X'}">신청취소</c:when>
		            </c:choose>
		        	</td>
		        	 <td><input type="button" value="신청취소" class="btn" name="btn_sc" id="btn_sc" data-uid="${myservice.uid}" data-sano="${myservice.sano}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		</div>
	</div>


<!-- 본문 끝 -->


<script>


$("#btn_sc").click(function(){
	 //alert();
	 
	if(!confirm("정말 봉사 취소 하시겠습니까?")){
		return false;
	}//if end
	 
   let uid = $(this).data("uid");
   let sano = $(this).data("sano");
   //alert(uid); 	  //kim9595
   //alert(sano); 	  //kim9595
	   $.ajax({
       url: '/mypage/srvDelete',
       type: 'post',
       //dataType: 'json',
       data: { 'uid': uid, 'sano': sano},
       error: function (error) {
           alert('에러!');
           console.log(error);
       },
       success: function (result) {
       	if (result === 'success') {
               alert('선택하신 봉사활동이 취소 되었습니다');
               console.log(result);
           } else {
               alert('서버에서 성공 메시지를 올바르게 반환하지 않았습니다.');
           }
       }//success end
       
   });//ajax end  
	     
   
})//click end



</script>











<%@ include file="./mypageFooter.jsp" %>      
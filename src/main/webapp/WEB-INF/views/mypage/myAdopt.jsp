<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

	<div id="page-content-wrapper">

	<!-- Page content-->
	<div class="container">
	<br><br>
		<h4>입양신청내역</h4>
		<p>나의 입양 신청 내역을 확인 할 수 있습니다</p>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>신청번호</th>
                <th>신청글</th>
                <th>신청일자</th>
                <th>첨부파일</th>
                <th>신청상태</th> <!--사용자에게는 value 값으로 보여줄 것-->
                <th>	  </th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myAdoptList1}" var="myAdopt1" >
                <tr>
                    <td>${myAdopt1.apno}</td>
                    <td><a href="/center/detail?anino=${myAdopt1.anino}"><img src="/storage/${myAdopt1.anipic}" class="anipic"></a></td>
                    <td><fmt:formatDate value="${myAdopt1.sub_date}" pattern="yyyy-MM-dd" /></td>
                   <td>${myAdopt1.subpic}</td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt1.sub_state eq 'S'}">신청완료</c:when>
		                <c:when test="${myAdopt1.sub_state eq 'P'}">심사중</c:when>
		                <c:when test="${myAdopt1.sub_state eq 'W'}">심사완료</c:when>
		                <c:when test="${myAdopt1.sub_state eq 'C'}">책임금결제</c:when>
		                <c:when test="${myAdopt1.sub_state eq 'F'}">입양완료</c:when>
		                <c:when test="${myAdopt1.sub_state eq 'X'}">입양불가능</c:when>
		            </c:choose>         
		        	</td>
		        	 <td>
			            <c:if test="${myAdopt1.sub_state eq 'C'}">
			                <input type="button" value="결제하기" class="btn btn" id="btn_payment" name="btn_payment" onclick="requestPay()">
			            </c:if>
			        </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    신청상태 : 신청완료 -> 심사중 -> 심사완료 -> 입양가능 -> 책임금결제 -> 입양완료
    <br><hr><br><br>
    	<h4>책임금 결제 내역</h4>
		<p>나의 책임금 결제 내역을 확인 할 수 있습니다</p>
	<table class="table table-condensed">
        <thead>
            <tr>
                <th>결제번호</th>
                <th>신청번호</th>
                <th>결제금액</th>
                <th>결제수단</th>
                <th>결제여부</th> <!--사용자에게는 value 값으로 보여줄 것-->
                <th>결제일자</th>
            </tr>
        </thead>
  		<tbody>
            <c:forEach items="${myAdoptList}" var="myAdopt" >
                <tr>
                    <td>${myAdopt.payno}</td>
                    <td>${myAdopt.apno}</td>
                    <td><fmt:formatNumber value="${myAdopt.patamt}" pattern="##,###"/></td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt.paymet eq 'cd'}">카드</c:when>
		            </c:choose>
		        	</td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt.payop eq 'Y'}">결제완료</c:when>
		                <c:when test="${myAdopt.payop eq 'N'}">결제대기</c:when>
		                <c:when test="${memAdopt.payop eq 'H'}">환불완료</c:when>
		            </c:choose>
		        	</td>
                    <td><fmt:formatDate value="${myAdopt.pdate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br><br>
	</div>
	</div>

<script>


var IMP = window.IMP;
IMP.init('imp40880183');

function requestPay() {
    // 서버에서 주문번호를 생성하여 가져오는 로직
    $.ajax({
        url: "/mypage/payNum",
        method: "GET",
        success: function (result) {
            
            var merchant_uid = result.payno;
            var buyer_email = result.buyer_email;
            var buyer_name = result.buyer_name;
            var buyer_tel = result.buyer_tel;
            
            IMP.request_pay({
                pg: "html5_inicis",
                pay_method: "card",
                merchan4t_uid: merchant_uid, // p202401021120
                name: "그냥데려가개 입양 책임금",
                amount: 100,
                buyer_email: buyer_email, // kim9595@gmail.com
                buyer_name: buyer_name, // 김정빈
                buyer_tel: buyer_tel // 010-2323-5834
            }, function (rsp) {
                if (rsp.success) {
                    $.ajax({
                        url: "/payment/verify/" + rsp.imp_uid,
                        type: "POST",
                    }).done(function(data) {
                    	alert(rsp.imp_uid);  //imp_620437863810
                    	//alert(merchant_uid); //p20240117225037
                    	
                        // 결제 금액과 검증 금액 확인 
                        if(rsp.paid_amount == data.response.amount){
                        	
                            var msg = '결제가 완료되었습니다.';
                            msg += '\n성함: ' + rsp.buyer_name;
                            msg += '\n이메일: ' + rsp.buyer_email;
                            msg += '\n결제 수단: ' + rsp.pay_method;
                            msg += '\n결제 금액: ' + rsp.paid_amount + '원';
                            
                            alert(msg);
                            succeedPay(rsp.imp_uid);
                            
                        } else {
                            alert("결제 검증 실패");
                        }
                    });
                } else {
                    // 결제 실패 시 작성할 로직 추가
                    alert("결제에 실패하였습니다.");
                }
            });
        },
        error: function (xhr, status, error) {
            console.error('주문번호 생성 오류:', error);
            alert("주문번호 생성에 실패하였습니다.");
        }
    });
}

function succeedPay(imp_uid){
	//alert("succedpay" + params);
	//alert(imp_uid);
    $.ajax({
        url: '/mypage/payUpdate',
        type: 'POST',
        //contentType: 'application/json',  // Set the content type to JSON
        //data: JSON.stringify({ 'imp_uid': imp_uid }), 
        success: function(response){
            if(response.result == "success"){
                let msg = "결제 및 검증이 완료되었습니다."
                alert(msg);
            } else {
                let msg = "결제가 완료되었으나 에러가 발생했습니다."
                alert(msg);
            }
            
            window.location.href = "http://localhost:9095/mypage/myAdopt"; // 리다이렉트할 URL로 변경
        }, // success ends
        error : function(error){
            alert("에러");
            console.log(error);
        }  // error ends 
    }); // ajax ends 
} // succeedPay() ends


</script>



<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
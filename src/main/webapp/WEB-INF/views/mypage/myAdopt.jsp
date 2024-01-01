<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->
	<div class="container">
	<br><br>
		<h4>입양신청내역</h4>
		<p>나의 입양 신청 내역을 확인 할 수 있습니다</p>
		<input type="button" value="결제하기" class="btn btn" id="btn_payment" name="btn_payment" onclick="requestPay()" >
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
            <c:forEach items="${myAdoptList}" var="myAdopt" >
                <tr>
                    <td>${myAdopt.apno}</td>
                    <td><a href="/center/detail?anino=${myAdopt.anino}"><img src="/storage/${myAdopt.anipic}" class="anipic"></a></td>
                    <td><fmt:formatDate value="${myAdopt.sub_date}" pattern="yyyy-MM-dd" /></td>
                   <td>${myAdopt.subpic}</td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt.sub_state eq 'S'}">신청완료</c:when>
		                <c:when test="${myAdopt.sub_state eq 'P'}">심사중</c:when>
		                <c:when test="${myAdopt.sub_state eq 'W'}">심사완료</c:when>
		            </c:choose>
		        	</td>
		        	<td></td>
		        	<!-- <td><input type="button" value="결제" class="btn btn basic"></td> -->
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
                    <td><fmt:formatNumber value="${memAdopt.patamt}" pattern="##,###"/></td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt.paymet eq 'cd'}">카드</c:when>
		                <c:when test="${myAdopt.paymet eq 'ch'}">현금</c:when>
		            </c:choose>
		        	</td>
                    <td>
		            <c:choose>
		                <c:when test="${myAdopt.payop eq 'Y'}">결제완료</c:when>
		                <c:when test="${myAdopt.payop eq 'N'}">결제대기</c:when>
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

IMP.init('imp40880183');

function requestPay() {
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호를 전달
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}' // 예: https://www.my-service.com/payments/complete/mobile
	}, function(rsp) { // callback 로직
		//* ...중략 (README 파일에서 상세 샘플코드를 확인하세요)... *//
	});
}




/* function requestPay() {
    IMP.init('imp40880183'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
    IMP.request_pay({
      pg: "inicis",
      pay_method: "card",
      merchant_uid: 'merchant_' + new Date().getTime(),
      name: '결제테스트',
      amount: 100,
      buyer_email: 'iamport@siot.do',
      buyer_name: '구매자',
      buyer_tel: '010-1234-5678',
      buyer_addr: '서울특별시 강남구 삼성동',
      buyer_postcode: '123-456'
    }, function (rsp) { // callback
      // 결제 성공 시 로직
      console.log(rsp);
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        alert(msg);
        location.href = "http://localhost:9095/member/myAdopt";
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        //에러내용 : 등록된 사용자 또는 PG 설정 정보가 없거나, 조회 할 수 없습니다
        alert(msg);
      }
    });
  } */

/* $(document).ready(function () {
    $("#btn_payment").click(function () {
      requestPay();
    });
  }); */

/* $("#btn_payment").click(function(){
alert();
})//click end */

</script>



<!-- 본문 끝 -->


<%@ include file="./mypageFooter.jsp" %>      
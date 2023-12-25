<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./mypageHeader.jsp" %>

<!-- 본문 시작 template.jsp -->


	<!-- Page content wrapper-->
	<div id="page-content-wrapper">

	<!-- Page content-->



	<div class="container">
		<h4>회원탈퇴</h4><br>
		<p>회원 탈퇴 전 유의사항을 확인하세요.</p>
		<hr><br>
		<div class="box_btm box_whtie">
		<div class="regi_complete">
			<p class="h2_tit">회원탈퇴 전 꼭 읽어주세요!</p><br>
			<p class="h_desc">
				<span class="multi_line">CJ ONE 회원 탈퇴를 하시면 CJ ONE  회원 약관 및 개인정보 제공, 활용에 관한 약관 동의가 모두 철회되며</span><br>
				<span class="multi_line">모든 CJ ONE 제휴 브랜드의 회원 서비스 및 웹사이트로부터 탈퇴됩니다.</span>
			</p>
		</div>
		</div>		

	<!-- 유의 사항 -->
		<div class="box_gray box_btm min_margin">
			<dl class="box_info double">
				<dt class="first">회원 탈퇴 시 유의사항</dt>
				<dd>
					<ul class="bul_list">
						<li class="dot_arr">CJ ONE 회원 탈퇴 시 모든 CJ ONE 제휴 브랜드로부터 함께
							탈퇴되며 30일 이내 재가입이 불가능합니다.</li>


						<li class="dot_arr">탈퇴하시면 현재 보유하고 계신 쿠폰과 CJ ONE 적립 포인트는 즉시 자동
							소멸하며, 충전 포인트 잔여 시에는 탈퇴 처리되지 않습니다. (충전 포인트 인출 : CJ ONE앱 > 전체 메뉴 >
							CJ ONE PAY > 결제하기 > 포인트 충전 > 포인트 인출)</li>
						<li class="dot_arr">충전 잔여 포인트가 탈퇴 후 생성될 때 자동 환불 처리가 되며, 환불
							계좌가 존재하지 않으면 고객센터에서 연락을 통해 환불이 진행됩니다.</li>



						<li class="dot_arr">(구) CGV 멤버십 포인트, CJ온스타일의 적립금, 캔디 등 CJ ONE
							모든 제휴 브랜드에서 보유하신 혜택들은 즉시 자동 소멸되며 복구 되지 않습니다.</li>
						<li class="dot_arr">구매하신 상품의 반품으로 인해 마이너스포인트를 보유한 경우 탈퇴처리 되지
							않습니다.</li>
						<li class="dot_arr">진행 중인 전자상거래 이용내역(배송/교환/반품 중인 상태)이 있거나
							이용하신 서비스가 완료되지 않은 경우 탈퇴하실 수 없습니다.</li>
						<li class="dot_arr">기타 탈퇴와 관련된 모든 정책은 CJ ONE 회원가입 시 동의하신 CJ
							ONE 회원 약관 및 개인정보 제공, 활용 동의 내용에 따릅니다.</li>
						<li class="dot_arr">회원 탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 해당 아이디에 대한
							회원 정보 및 서비스 정보는 모두 삭제됩니다.</li>
						<li class="dot_arr">탈퇴한 아이디는 영구적으로 사용이 중지되며, 30일 이후에 가입이
							가능합니다.</li>
					</ul>
				</dd>

				<dt>회원 정보 보존 안내 사항</dt>
				<dd>
					<ul class="bul_list">
						<li class="dot_arr">탈퇴 후 30일간 재가입 방지 및 포인트 불법 이용 및 부정 행위를
							방지하기 위해 회원님의 아이디를 포함한 회원 정보가 보존됩니다.<br>(회원가입 시 동의하신 개인정보 처리
							방침에 명시한 파기절차와 방법에 따라 30일 이후 회원 정보를 지체 없이 파기합니다)
						</li>

						<li class="dot_arr">전자상거래 이용내역이 있는 회원님은 전자상거래 등에서의 소비자보호에 관한
							법률에 의거 교환/반품/환불 및 사후처리(A/S)등을 위해 회원 정보가 관리됩니다.</li>
					</ul>
				</dd>
			</dl>
		</div>
		<!-- //유의 사항 -->

		<p class="p_tx">유의 및 안내 사항을 모두 확인하였으며, 탈퇴 시 위 사항에 동의한 것으로 간주합니다.</p>
		
	
		
		<form action="memberWithdraw" method="post">
			<div class="btn_center">
				<button type="button" class="btn" id="btn_cancel">취소</button>
				<button type="submit" class="btn btn_em" id="btn_tt">탈퇴</button>
				<!-- <input type="submit" class="btn btn_em" id="btn_tt" id="btn_tt" onclick="javascript:dbcheck()">탈퇴 -->
			</div>	
		</form>
	</div>

	<br>


<!-- 본문 끝 -->

<script>

function dbcheck() {
	alert("정말 탈퇴하시겠습니까?");
}//dbcheck() end


</script>



<%@ include file="./mypageFooter.jsp" %>      
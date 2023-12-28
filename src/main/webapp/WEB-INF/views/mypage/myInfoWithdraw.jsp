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
				<span class="multi_line">그냥 데려가개 회원 탈퇴를 하시면 그냥 데려가개 회원 약관 및 개인정보 제공, 활용에 관한 약관 동의가 모두 철회되며</span><br>
				<span class="multi_line">모든 회원 서비스로부터 탈퇴됩니다.</span>
			</p>
		</div>
		</div>		

	<!-- 유의 사항 -->
		<div class="box_gray box_btm min_margin">
			<dl class="box_info double">
				<dt class="first">회원 탈퇴 시 유의사항</dt>
				<dd>
					<ul class="bul_list">
						<li class="dot_arr">그냥 데려가개를 탈퇴 하시는 경우 입양, 교육, 봉사 등 그냥 데려가개에서 운영하고 있는 다양한 
						서비스를 이용하시는데 제한이 있습니다.</li>
						<li class="dot_arr">회원님께서 작성하신 글, 댓글 이력들은 탈퇴하시더라도 남아 있습니다.</li>
						<li class="dot_arr">회원 탈퇴를 하시면 해당 아이디는 즉시 탈퇴 처리되며, 해당 아이디에 대한
							회원 정보 및 서비스 정보는 보존 됩니다.</li>
						<li class="dot_arr">탈퇴한 아이디는 영구적으로 사용이 중지됩니다.</li>
					</ul>
				</dd>

				<dt>회원 정보 보존 안내 사항</dt>
				<dd>
					<ul class="bul_list">
						<li class="dot_arr">탈퇴 후 회원님의 아이디를 포함한 회원 정보가 보존됩니다.<br>
						(회원정보 완전한 삭제를 원하실 경우 02-1401-8061로 문의 주시기 바랍니다.)
						</li>

					</ul>
				</dd>
			</dl>
		</div>
		<!-- //유의 사항 -->

		<p class="p_tx">유의 및 안내 사항을 모두 확인하였으며, 탈퇴 시 위 사항에 동의한 것으로 간주합니다.</p>
		
	
		
		<form action="memberWithdraw" method="get">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline ml-auto" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">보호소</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">입양대기 동물소개</span></a>
			</li>
		</ul>
	</nav>

<div class="container-fluid">
	<h3 style="text-align: center">${center.aname}</h3>
		<form name="centerfrm" id="centerftm" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${center.anino}" name="anino" class="anino">
		<nav class="navbar navbar-light i-nav">
  			<div class="input-container" style="display: inline-block;">
				   <input type="button" value="수정" class="btn btn-warning rotate-text" onclick="center_Update()">
				   <input type="button" value="삭제" class="btn btn-danger rotate-text" onclick="center_delete()">
		    </div>
		</nav>
	

		<div class="container">
			<div class="container">
			<c:choose>
				<c:when test="${center.anipic == '-' || empty center.anipic}">
				  	<img src="/img/noimg.png" style="float: left; margin-right: 20px;" width="270px" alt="기본 이미지">
				</c:when>
				<c:otherwise>
				  	<img src="/storage/${center.anipic}" style="float: left; margin-right: 20px;" width="270px" alt="이미지">
				</c:otherwise>
			</c:choose>
			</div>
			
			
			<div class="container-1 rotate-text"> 
				<dl class="anidl" style="float: left">
					<dt class="anidt">나이</dt>
					<dd class="anidd" id="anidd">${center.age}살</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">성별</dt>
					<dd class="anidd">${center.gender}</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">몸무게</dt>
					<dd class="anidd">${center.weight}</dd>
				</dl>
				<dl class="anidl" >
					<dt class="anidt" >중성화여부</dt>
					<dd class="anidd" >${center.genop}</dd>
				</dl>
				<dl class="anidl">
					<dt class="anidt">예방접종여부</dt>
					<dd class="anidd">${center.vac}</dd>
				</dl>
				<dl class="anidl" >
					<dt class="anidt">입양가능여부</dt>
					<dd class="anidd">${center.adopt_pos}</dd>
				</dl>
			</div>
		</div>
			</form>
			
		<div class="container">
			<div class="jjimStart">
			<form name="jjimfrm" id="jjimfrm">
			<!-- 동물 글 번호 -->
			<input type="hidden" name="anino" id="anino" value="${center.anino}">
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
			</form>
			</div>
			
			<div class="icon-heart">
				<i class="bi bi-chat-left-dots-fill"></i>
			</div>
			<div class="d-grid gap-2 d-md-block" >
			  <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">신청하기</button>
			</div>
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="aniRequest">입양 신청서</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form name="aniRefrm" id="aniRefrm">
				      <div class="modal-body">
				     	* 사전질문 * <br>
				     	* 모든 항목을 선택하셔야 입양 신청이 가능합니다 * <hr>
				     	1. 가구원은 몇명인가요?
				        <select class="form-select" id="gg" aria-label="가구원 선택">
							  <option selected>선택하세요</option>
							  <option value="1">한명</option>
							  <option value="2">두명</option>
							  <option value="3">세명이상</option>
						</select>
						2. 신혼부부인가요?
						<select class="form-select" id="bb" aria-label="신혼부부여부 선택">
							  <option selected>선택하세요</option>
							  <option value="1">그렇다</option>
							  <option value="2">아니다</option>
							  <option value="3">예정있다</option>
						</select>
						3. 동물 알레르기가 있나요?
						<select class="form-select" id="da" aria-label="동물 알레르기 여부 선택">
							  <option selected>선택하세요</option>
							  <option value="1">예</option>
							  <option value="2">아니오</option>
						</select>
						4. 간단한 입양 신청서 작성바랍니다.
						<textarea class="form-control" id="sub_cont" name="sub_cont"></textarea>
						<input type="file" name="img" class="form-control" multiple="multiple">
				      </div>
			      	<div class="modal-footer">
				        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" onclick="adopt()">신청하기</button>
			      	</div>
			      </form>
			    </div>
			  </div>
			</div>
			<hr>
			<div>
				<p style="text-align: center">
				${center.intro}
				</p>
			</div>		
		</div>
	</div>	
		<script>
			//찜 관련 스크립트 
			let anino = '${center.anino}'; //동물글 번호 
			
			$(document).ready(function () {
			    let jjimState; // 찜 상태 저

			    jjimSelect(); // 페이지 로딩되면 해당 함수 먼저 호출

			    function jjimSelect() {
			        $.ajax({
			            url: '/jjim/select',
			            type: 'post',
			            data: { 'anino': anino },
			            error: function (error) {
			                alert(error);
			            },
			            success: function (result) {
			                jjimState = (result === 1); // 찜 상태 업데이트

			                if (jjimState) {
			                    // 찜이 되어 있을 때
			                    $("#jjimDelete").off().on('click', function () {
			                        jjimAct(); // 함수 호출
			                    });
			                    $("#jjimInsertContainer").hide();
			                    $("#jjimDeleteContainer").show();
			                } else {
			                    // 찜이 되어 있지 않을 때 
			                    $("#jjimInsert").off().on('click', function () {
			                    	jjimAct(); // 함수 호출
			                    });
			                    $("#jjimInsertContainer").show();
			                    $("#jjimDeleteContainer").hide();
			                }
			            }
			        });
			    }

			    function jjimAct() {
			        $.ajax({
			            url: jjimState ? '/jjim/delete' : '/jjim/insert', // 찜 상태에 따라 요청 URL 선택
			            type: 'post',
			            data: { 'anino': anino },
			            error: function (error) {
			                alert(error);
			            },
			            success: function (result) {
			                if (result === 1) {
			                    alert(jjimState ? "찜이 해제되었습니다" : "동물을 찜하셨습니다");
			                    jjimState = !jjimState; // 찜 상태를 반전
			                    jjimSelect(); // 변경된 찜 상태에 따라 UI 갱신
			                }
			            }
			        });
			    }
			});

			
</script>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
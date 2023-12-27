<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./centerheader.jsp" %>

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
					<c:choose>
						<c:when test="${empty jjim.jjimno}">
							<div class="icon-heart1" > 
								<i class="bi bi-heart" id="jjimInsert"></i>
							</div>	
						</c:when>
						<c:otherwise>
							<%--이미 하트를 눌렀을 때 --%>
							<div class="icon-heart2">
									<i class="bi bi-heart-fill" id="jjimDelete"></i>
							</div>	
						</c:otherwise>
					</c:choose>	
				</c:when>
				<c:otherwise>
					<div class="icon-heart1">
						<i class="bi bi-heart" id="jjimButton" onclick="jjim_nolog()"></i>
					</div>	
				</c:otherwise>		
			</c:choose>	
			</form>
			</div>
			
			<div class="icon-heart3">
				<i class="bi bi-chat-left-dots-fill"></i>
			</div>
			<div class="d-grid gap-2 d-md-block" >
			  <button class="btn btn-primary" type="button">신청하기</button>
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
			
			$("#jjimInsert").click(function() {
				//alert(anino);
				jjimInsert(anino);
			}); //찜 클릭 
			
			function jjimInsert(anino) {
				//alert(anino);
				$.ajax({
					url : '/jjim/insert'  	//요청 명령어
				   ,type : 'post'
				   ,data :  { 'anino': anino }
				   ,error : function(error){ 	//실패 
					   alert(error);
				   }//error end
				   ,success : function(result) {
					//alert(result);
					if(result==1){
						alert("찜하셨습니다");
						let i='<i class="bi bi-heart-fill" id="jjimDelete"></i>';
						$(".icon-heart1").html(i);
					}
				}//success end
				})
			}
			
		</script>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
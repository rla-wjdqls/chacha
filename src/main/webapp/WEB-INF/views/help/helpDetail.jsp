<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/js/jquery-3.7.1.min.js"></script>

<%@ include file="../header.jsp"%>
<style>
.right {
	float: right;
}

th {
	width: 10%;
}

td {
	width: 40%;
}

.btnn {
	border-radius: 15px; /* 원하는 모서리의 반지름 값을 지정합니다. */
	padding: 6px 9px; /* 원하는 패딩 값을 지정합니다. */
	border: none;
	color: white;
}

.gray {
	background-color: #D5D5D5; /* 원하는 회색 값으로 변경합니다. */
	color: white; /* 텍스트 색상을 조절합니다. */
	
.con {
	width: 700px;
}

}
</style>
<script>
	function hdelete() {
		if (confirm("삭제하겠습니까?")) {//자바스크립트 내장함수
			$("#helpDelete").submit();
		} else {

		}
	}
</script>

<nav class="navbar navbar-light bg-light" style="height: 42px">
	<ul class="list-inline ml-auto" style="align-items: center;">
		<li class="list-inline-item"><a href="/"><i
				class="bi bi-house fs-7"
				style="font-size: 20px, color: #757575; margin-left: 15px;"
				alt="홈으로"></i></a> <i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">반려이야기</span></a>
			<i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">목격/제보</span></a>
		</li>
	</ul>
</nav>


<div class="container text-center">
	<div class="row">
		<div class="col-sm-12">
			<h3>목격/제보글 상세보기</h3>
			<p>
				<a href="/help/helpList" class="right">[글목록]</a>
			</p>
			<br> <br>
		</div>
	</div>
</div>

<div class="container text-center">
	<table class="table table-hover container">
		<thead>
			<tr class="success">
				<th>제목</th>
				<td colspan="3">${helpd.texttitle}</td>
			</tr>

			<tr>
				<th>글번호</th>
				<td>${helpd.textno}</td>

				<th>작성자</th>
				<td>${helpd.uid}</td>

			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">${helpd.text}</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><img src="../storage/${helpd.helppic}"
					width="400"></td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${helpd.cnt}</td>

				<th>작성일</th>
				<td>${helpd.uploaddate}</td>
			</tr>
		</thead>
	</table>
</div>
<form id="helpDelete" name="helpDelete" method="post"
	action="/help/helpDelete">
	<input type="hidden" name="textno" id="textno" value="${helpd.textno}" />
</form>

<div style="text-align: center; height: 50px; padding-top: 15px;">
	<p>
		<a href="/help/helpUpdate?textno=${helpd.textno}"> <input
			type="button" class="btnn btn-primary" value="수정"></a> <input
			type="button" class="btnn gray" onclick="hdelete()" value="삭제">
		&nbsp;
	</p>
</div>

<br>
<br>


<div class="container">
	<h5 style="text-align:left; display: inline;"><img src="/img/commentlogo.png" alt="logo" style="width: 30px; height: 30px;  display: inline;"> 댓글</h5>
	<!-- 댓글 목록을 표시하는 부분 -->
	<!-- 댓글 시작 -->
	<div class="row">
		<div class="col-sm-12">
			<!-- 댓글 등록 -->
			<form action="commentInsertForm" id="commentInsertForm">
				<!-- 부모글 번호 -->
				<input type="hidden" name="textno" id="textno" value="${helpd.textno}">
				<table class="table table-borderless">
					<tr>
						<td style="width: 1240px;"><input type="text" name="content" id="content"
							placeholder="댓글을 입력해 주세요" class="form-control"></td>
						<td style="width: 150px;">
							<button type="button" name="commentInsertBtn"
								id="commentInsertBtn" class="btn btn-secondary">댓글등록</button>
						</td>
				</table>
			</form>
		</div>
	</div>


	<div class="row">
		<div class="col-sm-12">
			<!-- 댓글 목록 -->
			<div class="commentList"></div>
		</div>
	</div>
	<!-- 댓글 끝 -->
</div>


	<!-- 댓글 관련 자바스크립트 -->
	<script>
		let textno = '${helpd.textno}'; //부모글 번호

		$(document).ready(function() { //페이지 로딩시 댓글 목록 출력
			commentList();
		}); //ready() end

		//댓글등록 버튼을 클릭했을 때
		$("#commentInsertBtn").click(function() {
			let content = $("#content").val();
			content = content.trim();
			if (content.length == 0) {
				alert("댓글 내용을 입력해 주세요!");
				$("#content").focus(); //커서 갖다 놓기(아주 쓸모있음!!)
			} else {
				//<form id="commentInsertForm"></form>의 컨트롤 요소들을 전부 갖옴
				let insertData = $("#commentInsertForm").serialize();
				//alert(insertData);  //product_code=2&content=apple
				commentInsert(insertData); //댓글등록 함수 호출
			}//if end
		});//click end

		function commentInsert(insertData) { //댓글등록 함수
			//alert("댓글등록 함수 호출: " + insertData);  //product_code=21&content=apple
			$.ajax({
				url : '/comment/insert' //요청명령어
				,
				type : 'post',
				data : insertData //전달값
				,
				error : function(error) {
					alert(error);
				}//error end
				,
				success : function(result) {
					if (result == 1) { //댓글등록 성공
						alert("댓글이 등록되었습니다");
						commentList(); //댓글등록 후 댓글목록 함수 호출
						$("#content").val('');//기존 댓글내용을 빈 문자열로 대입(초기화)
					}//if end			   
				}//success end		   		
			});//ajax() end	
		}//commentInsert() end

		function commentList() {
			//alert("댓글목록 함수 호출");
			$
					.ajax({
						url : '/comment/list',
						type : 'get',
						data : {
							'textno' : textno
						} //부모글번호(전역변수로 선언되어 있음)
						,
						error : function(error) {
							alert(error);
							//console.log(error);
						}//error end
						,
						success : function(result) {
							let a = ''; //출력할 결과값
							$.each(	result,
									function(key, value) {
										a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px; text-align: left;">';
										a += '	<div class="commentInfo' + value.commentNo + '" >';
										a += '  ' + value.uid + ' ' + ' <span class="commentDate" style="font-size: 14px; color: #808080;">(' + value.commentDate + ')</span>';
										a += '	<a href="javascript:commentUpdate(' + value.commentNo + ',\'' + value.content + '\')">[수정]</a>';
										a += '		<a href="javascript:commentDelete(' + value.commentNo + ')">[삭제]</a>';
										a += '	</div>';
										a += '	<div class="commentContent' + value.commentNo +'">';
										a += '		<p>' + value.content + '</p>';
										a += '	</div>';
										a += '</div>';

									}); //each() end

							$(".commentList").html(a);

						}//success end
					}); //ajax() end
		}//commentList() end

		//댓글수정 - 댓글내용을 <input type=text>에 출력
		function commentUpdate(commentNo, content) {
			let a = '';
			a += '<div class="input-group">';
			a += '	<input type="text" value="' + content +'" id="content_' + commentNo +'">';
			a += '  <button type="button" onclick="commentUpdateProc('
					+ commentNo + ')">수정</button>';
			a += '</div>';
			//alert(a);
			$(".commentContent" + commentNo).html(a);
		}//commentUpdate() end

		//댓글 수정 후 댓글목록 함수 호출
		function commentUpdateProc(commentNo) {
			let updateContent = $("#content_" + commentNo).val();
			//alert(updateContent);

			$.ajax({
				url : '/comment/update',
				type : 'post',
				data : {
					'commentNo' : commentNo,
					'content' : updateContent
				} //또는 "cno="+cno+"&content="+updateContent"
				,
				success : function(result) {
					if (result == 1) {
						alert("댓글이 수정되었습니다");
						commentList(); //댓글수정 후 목록 출력
					}//if end
				}//success end
			}); //ajax() end
		}//commentUpdateProc() end

		function commentDelete(commentNo) {
			//alert("댓글삭제" + cno);
			$.ajax({
				url : '/comment/delete/' + commentNo //RESTful 방식으로 웹서비스 요청. 예)/comment/delete/5
				,
				type : 'post',
				success : function(result) {
					if (result == 1) {
						alert("댓글이 삭제되었습니다");
						commentList(); //댓글삭제 후 목록 출력
					} else {
						alert("댓글 삭제 실패: 로그인 후 사용이 가능합니다");
					}//if end
				}//success end
			});//ajax() end
		}//commentDelete() end
	</script>

	<%@ include file="../footer.jsp"%>
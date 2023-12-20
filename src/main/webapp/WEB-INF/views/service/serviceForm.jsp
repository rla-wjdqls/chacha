<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<hr style="margin-bottom: 0">
<nav class="navbar navbar-light bg-light" style="height: 42px">
	<ul class="list-inline ml-auto" style="align-items: center;">
		<li class="list-inline-item"><a href="/"><i
				class="bi bi-house fs-7" style="font-size: 20px, color: #757575"
				alt="홈으로"></i></a> <i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">봉사활동</span></a>
			<i class="bi bi-arrow-right-short"
			style="font-size: 20px, color: #666"></i></li>
		<li class="list-inline-item"><a><span style="color: #757575">봉사활동
					모집글쓰기</span></a></li>
	</ul>
</nav>
<!-- 본문 시작 template.jsp -->
<div class="container text-center">
	<p>
	<h3>[봉사모집글쓰기]</h3>
	</p>
	<div style="text-align: right; height: 50px;">
		<p>
			<a href="/service/serviceList" class="nav-item nav-link"><input
				type="button" value="글목록"></a>
		</p>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<table class="table">
				<tr>
					<th class="success">아이디</th>
					<td><input type="text" name="uid" id="uid"
						class="form-control" maxlength="20" required></td>
				</tr>
				<tr>
					<th class="success">제목</th>
					<td><input type="text" name="subject" id="subject"
						class="form-control" maxlength="100" required></td>
				</tr>
				<tr>
					<th class="success">내용</th>
					<td><textarea rows="5" class="form-control" name="content"
							id="content"></textarea></td>
				</tr>

			</table>

		</div>

	</div>
</div>

<div class="container text-center">

	<div class="row">
		<div class="col-sm-12">
			<table class="table">
				<style>* {
							font-size: 16px;
							font-family: Consolas, sans-serif;
							}
				</style>
				<body>
					<form>
						<p>봉사모집시작일자&nbsp;&nbsp;<input type="date">&nbsp;&nbsp;봉사모집종료날짜&nbsp;&nbsp;<input type="date"></p>
					</form>
				</body>
			</div>
		</div>
	</div>
</table>

				<div class="row">
					<div class="col-sm-12">
						<table class="table">
							<tr>
								<th class="success">봉사시간</th>
								<td><input type="text" name="uid" id="uid" class="form-control" maxlength="20" required></td>
							</tr>
							<tr>
								<th class="success">모집인원</th>
								<td><input type="text" name="uid" id="uid" class="form-control" maxlength="20" required></td>
							</tr>
							<tr>
								<th class="success">장소</th>
								<td><input type="text" name="uid" id="uid" class="form-control" maxlength="20" required></td>
							</tr>
							<tr>
								<th class="success">상태</th>
								<td><input type="text" name="uid" id="uid" class="form-control" maxlength="20" required></td>
							</tr>
							<tr>
								<th class="success">비밀번호</th>
								<td><input type="password" name="passwd" id="passwd"
									class="form-control" maxlength="10" required></td>
							</tr>
							<th>첨부파일</th>
							<td style="text-align: left"><input type="file"
								name="filename" id="filename" size="20">
								<hr></td>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="새글쓰기" class="btn btn-success"> <input
									type="reset" value="취소" class="btn btn-danger"></td>
						</table>
					</div>
				</div>
		



<%@ include file="../footer.jsp"%>
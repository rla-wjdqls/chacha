<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline ml-auto" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">입양대기 동물</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">입양대기 동물 추가</span></a>
			</li>
		</ul>
	</nav>

	<div class="container text-center">
<!-- 본문 시작 template.jsp -->
		<div class="row">
			<div class="col-sm-12">
				<p><h3>동물 추가</h3></p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<form name="centerfrm" id="centerfrm" method="post" action="insert" enctype="multipart/form-data">
					<table class="table table-hover">
						<tbody style="text-align: left">
						<tr>
							<td>동물번호</td>
							<td><input type="text" name="anino" class="form-control"> </td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="aname" class="form-control"> </td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
							<label>
								남자<input class="form-check-input" type="radio" value="M" name="gender">
								여자<input class="form-check-input" type="radio" value="W" name="gender">
							</label>
							</td>
						</tr>
						<tr>
							<td>몸무게</td>
							<td><input placeholder="예시: 15kg"type="text" name="weight" class="form-control"> </td>
						</tr>
						<tr>
							<td>중성화 여부</td>
							<td>
							<label>
								예<input class="form-check-input" type="radio" value="Y" name="genop">
								아니오<input class="form-check-input" type="radio" value="N" name="genop">
							</label>
							</td>
						</tr>
						<tr>
							<td>접종 여부</td>
							<td>
							<label>
								예<input class="form-check-input" type="radio" value="Y" name="vac">
								아니오<input class="form-check-input" type="radio" value="N" name="vac">
							</label>
							</td>
						</tr>
						<tr>
							<td>간단한 소개</td>
							<td>
  								<textarea placeholder="강아지에 대한 간단한 소개를 작성해 주세요" class="form-control" name="intro"></textarea>
							</td>
						</tr>
						<tr>
							<td>동물 사진</td>
							
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
<!-- 본문 끝 -->
	

<%@ include file="../footer.jsp" %>      
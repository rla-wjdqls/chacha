<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>


<div class="container mt-2">
	<h2>목격/제보 게시판 글쓰기</h2>
	<p>목격하신 유기 동물들을 제보해주세요!</p>

	<div class="row">
		<div class="col-sm-12">
			<form name="helpfrm" id="helpfrm" method="post" action="insert" enctype="multipart/form-data">
				<table class="table table-hover">
					<tr>
						<td>제목</td>
						<td><input type="text" name="texttitle" class="form-control"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="3" cols="60" name="text"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="img" class="form-control"></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="완료" class="btn btn-success"></td>
					</tr>

					
					</tbody>
			</table>
		</form>
	</div>
	<!-- col end -->
</div>
</div>

<!-- row end -->

<%@ include file="../footer.jsp"%>

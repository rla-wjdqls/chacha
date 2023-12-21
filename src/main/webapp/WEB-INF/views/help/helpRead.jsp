<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 -->
<h3>목격/제보글 상세보기</h3>

<p><a href="helpList.jsp">[글목록]</a></p>

<div class="row">
	 <div class="col-sm-12">
		<form name="helpfrm" id="helpfrm" method="post" action="insert" enctype="multipart/form-data">
			<input type="hidden" name="textno" value="${help.textno}">
			<table class="table table-hover">
				<tbody style="text-align: left;">
					<tr>
						<td>글 번호</td>
						<td><input type="text" name="textno" class="form-control" value="${help.TEXTNO}"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="texttitle" class="form-control" value="${help.TEXTTITLE}"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="uid" class="form-control" value="${help.UID}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="5" cols="60" name="text" class="form-control">${help.TEXT}</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<c:if test="${help.HELPPIC != '-'}">
								<img src="/storage/${help.HELPPIC}" width="100px">
							</c:if>
							<br><br>
						<input type="file" name="img" class="form-control"></td>
					</tr>
					<tr>
						<td>등록날짜</td>
						<td><input type="text" name="uploaddate" class="form-control" value="${help.UPLOADDATE}"></td>
					</tr>
					<tr>
						<td>좋아요</td>
						<td><input type="number" name="love" class="form-control" value="${help.LOVE}"></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><input type="number" name="cnt" class="form-control" value="${help.CNT}"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정"   onclick="help_update()" class="btn btn-success">
							<input type="button" value="삭제"   onclick="help_delete()" class="btn btn-danger">
						
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div><!-- col end -->
</div><!-- row end -->



<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
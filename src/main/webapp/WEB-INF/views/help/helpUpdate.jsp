<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


	
<div class="container mt-2">
	<div class="text-center"><h2>목격/제보글 수정</h2></div>
	
		
			<form name="helpfrm" id="helpfrm" method="post" action="/help/helpUpdate">	
			<input type="hidden" name="textno" id="textno" value="${helpup.textno}"/>
				<div class="col-sm-12">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input type="text" name="texttitle" id="texttitle" class="form-control" value="${helpup.texttitle}"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="uid" id="uid" value="${helpup.uid}" class="form-control" maxlength="20" required></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="3" cols="60" name="text" id="text"
								class="form-control">${helpup.text}</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="img" id="helppic" class="form-control" value="${helpup.helppic}"></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="완료" class="btn btn-success">
							<input type="button" value="취소" onclick="location.href='/help/helpList'" class="btn btn-danger">
						</td>
					</tr>

				</table>
			</diV>
			</form>		 
		</div>


<%@ include file="../footer.jsp" %>      
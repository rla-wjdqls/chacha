<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>


<div class="container mt-2">
	<h2>목격/제보 게시판 글쓰기</h2>
	<p>목격하신 유기 동물들을 제보해주세요!</p>

		<div class="mb-2 mt-2">
			<textarea class="form-control" rows="1" id="texttitle" name="texttitle" placeholder="제목"></textarea>
		</div>

		<div class="mb-3 mt-3">
			<textarea class="form-control" rows="3" id="text" name="text" placeholder="내용"></textarea>
		</div>


		<div class="form-group">
          <div class="custom-file">
            <input type="file" class="form-control visibility-hidden" id="helppic" name="helppic">
          </div>
        </div>
		

		<div class="mb-3 mt-3">
			<button type="submit" class="btn btn-primary">완료</button>
			<button type="reset" class="btn btn-light">취소</button>
		</div>
</div>

<%@ include file="../footer.jsp"%>

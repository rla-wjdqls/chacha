<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<div class="container">
    <div class="card-body">
      <h2>입양 후기 글 작성</h2>
      <p>사랑스러운 가족이 생긴 것을 자랑해주세요~</p>
      <form class="forms-sample" action="your-action-url" method="post">
      
        <div class="form-group">
          <label for="InputName">제목</label>
          <input type="text" class="form-control" id="artitle" name="artitle" placeholder="반려동물 이름">
        </div>
        
        <div class="form-group mb-3 mt-3">
          <div class="custom-file">
            <input type="file" class="form-control visibility-hidden" id="arimg" name="arimg">
          </div>
        </div>
        <div class="form-group">
          <label for="Textarea">내용</label>
          <textarea class="form-control" id="arinfo" name="arinfo" rows="4"></textarea>
        </div>
        
        <div class="mb-3 mt-3">
	        <button type="submit" class="btn btn-primary">완료</button>
	        <button type="button" class="btn btn-light">취소</button>
        </div>
      </form>
    </div>
</div>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
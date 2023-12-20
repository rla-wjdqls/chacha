<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<div class="col-12 grid-margin stretch-card">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">입양 후기 글 작성</h4>
      <p class="card-description">사랑스러운 가족이 생긴 것을 자랑해주세요~</p>
      <form class="forms-sample" action="your-action-url" method="post">
        <div class="form-group">
          <label for="InputName">이름</label>
          <input type="text" class="form-control" id="Name" name="name" placeholder="반려동물 이름">
        </div>
        <div class="form-group">
          <label for="Password">비밀번호</label>
          <input type="password" class="form-control" id="Password" name="password" placeholder="Password">
        </div>
        <div class="form-group">
          <label for="Gender">성별</label>
          <select class="form-control" id="Gender" name="gender">
            <option>수컷</option>
            <option>암컷</option>
          </select>
        </div>
        <div class="form-group">
          <label>사진 올리기</label>
          <div class="custom-file">
            <input type="file" class="form-control visibility-hidden" id="customFileLang" name="file" lang="es"/>
          </div>
        </div>
        <div class="form-group">
          <label for="Textarea">내용</label>
          <textarea class="form-control" id="Textarea" name="textarea" rows="4"></textarea>
        </div>
        <button type="submit" class="btn btn-gradient-primary mr-2">완료</button>
        <button type="button" class="btn btn-light">취소</button>
      </form>
    </div>
  </div>
</div>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
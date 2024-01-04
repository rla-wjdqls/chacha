<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>
<style>* {font-size: 16px; font-family: Consolas, sans-serif;}</style>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<nav class="navbar navbar-light bg-light" style="height: 42px">
    <ul class="list-inline ml-auto" style="align-items: center;">
      <li class="list-inline-item">
         <a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동</span></a>
         <i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
      </li>
      <li class="list-inline-item">
         <a><span style="color: #757575">봉사활동 모집글수정하기</span></a>
      </li>
   </ul>
</nav>

<div class="container text-center">
	<p><h3>[봉사모집수정하기]</h3></p>
</div>

<div style="text-align: right; height: 50px;">
	<p><a href="/service/serviceList" class="nav-item nav-link"><input type="button" value="글목록"></a></p>	
</div>

<form  name="servicefrm" id="servicefrm" method="post" action="/service/serviceUpdate">
<input type="hidden" name="sno" id="sno" value="${serviceup.sno}"/>
<div class="container col-sm-12">
	<table class="table"> 
		<tr>
			<th class="success">아이디</th>
			<td><input type="text" name="uid" id="uid" value="${serviceup.uid}" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
			<th class="success">제목</th>
			<td><input type="text" name="stitle" id="stitle" value="${serviceup.stitle}" class="form-control" maxlength="100" required></td>
		</tr>
		<tr>
			<th class="success">내용</th>
			<td><textarea rows="5" class="form-control" id="summernote" name="sinfo">${serviceup.sinfo}</textarea></td>
		</tr>
	</table>
</div>
<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100,
        width: 700,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>

<div class="container col-sm-12">
	<table class="table">	
		<p>봉사모집시작일자<input type="date"name="ssdate" id="ssdate" value="${serviceup.ssdate}" class="form-control" maxlength="100" required>봉사모집종료날짜&nbsp;<input type="date" name="sedate" id="sedate" value="${serviceup.sedate}" class="form-control" maxlength="100" required></p>
	</table>
</div>		
<div class="container col-sm-12">
	<table class="table">	
		<p>봉사시작시간<input type="time"name="sstime" id="sstime" value="${serviceup.sstime}" class="form-control" maxlength="100" required>봉사종료시간&nbsp;<input type="time" name="etime" id="etime" value="${serviceup.etime}" class="form-control" maxlength="100" required></p>
	</table>
</div>			

<div class="container col-sm-12">
	<table class="table">
		<tr>
			<th class="success">봉사시간</th>
			<td><input type="text" name="time" id="time" value="${serviceup.time}" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
			<th class="success">모집인원</th>
			<td><input type="text" name="sp" id="sp" value="${serviceup.sp}" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
			<th class="success">장소</th>
			<td><input type="text" name="splace" id="splace" value="${serviceup.splace}" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
			<th>상태</th>
				<td>
					<select class="form-select" name="sstate" id="sstate">
					  <option <c:if test="${empty serviceup.sstate}">selected</c:if>>선택</option>
					  <option <c:if test="${serviceup.sstate eq 'I'}">selected</c:if> value="I">모집중</option>
					  <option <c:if test="${serviceup.sstate eq 'E'}">selected</c:if> value="E">모집완료</option>
					</select>
				</td>
			</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit"value="수정하기" class="btn btn-success">
				<input type="button" value="취소" onclick="location.href='/service/serviceList'" class="btn btn-danger">
			</td>	
	</table>
</div>
<form>

<%@ include file="../footer.jsp" %>      
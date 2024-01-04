<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>


 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<style>* {font-size: 16px; font-family: Consolas, sans-serif;}</style>

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
         <a><span style="color: #757575">봉사활동 모집글쓰기</span></a>
      </li>
   </ul>
</nav>



<div class="container text-center">
	<p><h3>[봉사모집글쓰기]</h3></p>
</div>

<div style="text-align: right; height: 50px;">
	<p><a href="/service/serviceList" class="nav-item nav-link"><input type="button" value="글목록"></a></p>	
</div>
	
<form  name="servicefrm" id="servicefrm" method="post" action="/service/serviceForm">
<div class="container col-sm-12">
	<table class="table"> 
		<tr>
			<th class="success">제목</th>
			<td><input type="text" name="stitle" id="stitle" class="form-control"></td>
		</tr>		
		<tr style="text:center">
			<th class="success">내용</th>
			<td>
				<textarea id="summernote" name="sinfo"></textarea>
			</td>
		</tr>
	</table>
</div>	

 <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
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
		<p>봉사모집시작일자<input type="date"name="ssdate" id="ssdate" class="form-control" maxlength="100" required>봉사모집종료날짜&nbsp;<input type="date" name="sedate" id="sedate" class="form-control" maxlength="100" required></p>
	</table>
</div>		

<div class="container col-sm-12">
	<table class="table">
	<div class="container col-sm-12">
		
		<p>&nbsp;봉사시작시간&nbsp;<input type="time" name="sstime" id="sstime">&nbsp;봉사종료시간&nbsp;<input type="time" name="etime" id="etime"></p>
	
	</div>
		<tr>
			<th class="success">봉사시간</th>
			<td><input type="text" name="time" id="time" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
			<th class="success">모집인원</th>
			<td><input type="text" name="sp" id="sp" class="form-control" maxlength="20" required></td>
		</tr>
	
		<tr>
			<th class="success">장소</th>
			<td><input type="text" name="splace" id="splace" class="form-control" maxlength="20" required></td>
		<tr>
			<th>상태</th>
				<td>
					<select class="form-select" name="sstate" id="sstate">
					  <option selected>선택</option>
					  <option value="I">모집중</option>
					  <option value="E">모집완료</option>
					</select>
				</td>
			</tr>
	
		<tr>
			<td colspan="2" align="center">
				<input type="submit"value="새글쓰기" class="btn btn-success">
				<input type="button" value="취소" onclick="location.href='/service/serviceList'" class="btn btn-danger">
			</td>	
	</table>
</div>
</form>

<%@ include file="../footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>
<script type="text/javascript" src="/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
         <a><span style="color: #757575">봉사활동 신청</span></a>
      </li>
   </ul>
</nav>



<div class="container text-center">
	<p><h3>[봉사활동 신청하기]</h3></p>
</div>

<div style="text-align: right; height: 50px;">
	<p><a href="/service/serviceList" class="nav-item nav-link"><input type="button" value="글목록"></a></p>	
</div>

<form  name="servicefrm" id="servicefrm" method="post" action="/service/serviceForm">
<div class="container col-sm-12">
	<table class="table"> 
		
		<tr>
			<th class="success">이름</th>
			<td><input type="text" name="stitle" id="stitle" class="form-control" maxlength="100" required></td>
		</tr>
		<tr>
			<th class="success">전화번호</th>
			<td><input type="text" name="stitle" id="stitle" class="form-control" maxlength="100" required></td>
		</tr>
	</table>
</div>

<div class="container col-sm-12">
	<table class="table">	
		<p>&nbsp;봉사날짜선택 &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="date" value="" min="" max=""></p>
	</table>
</div>		

<div class="container col-sm-12">
	<table class="table">
		<tr>
			<th class="success">봉사시간</th>
			<td><input type="text" name="time" id="time" class="form-control" maxlength="20" required></td>
			
		</tr>
	
	
		<tr>
			<td colspan="2" align="center">
				<input type="submit"value="신청하기" class="btn btn-success">
				<input type="button" value="취소" onclick="location.href='/service/serviceList'" class="btn btn-danger">
			</td>	
	</table>
</div>
</form>

<%@ include file="../footer.jsp"%>

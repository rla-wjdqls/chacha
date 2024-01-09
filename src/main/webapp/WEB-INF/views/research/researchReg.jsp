<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
<nav class="navbar navbar-light bg-light" style="height: 42px">
			 <ul class="list-inline ml-auto" style="align-items: center;">
				<li class="list-inline-item">
					<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px, color: #757575" alt="홈으로"></i></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">반려이야기</span></a>
					<i class="bi bi-arrow-right-short" style="font-size: 20px, color: #666"></i>
				</li>
				<li class="list-inline-item">
					<a><span style="color: #757575">설문조사</span></a>
				</li>
			</ul>
		</nav>
<br>
<div class="container text-center"> <h3>설문조사 등록</h3>
	<div class="container">
		<p>설문조사를 등록해 주세요</p>
		<hr><br><br>
		 <div class="container-line" id="surveyContainer">
            <!-- 설문조사 내용이 여기에 동적으로 추가될 것입니다. -->
            	<div class="row">
		<div class="col-sm-12">
		<form name="researchfrm" id="researchfrm" method="post" action="researchQCReg">
		<table class="table">
	            <tr>
	                <th>제목</th>
					<td><input type="text" name="rtitle" id="rtitle" placeholder="제목 입력해 주세요"></td>
	            </tr>
 	 	        <tr>
					<th>시작일자</th>
					<td><input type="date" name="rdate1" id="rdate1" class="form-control"></td>
	            </tr>
	           <tr>
					<th>종료일자</th>
					<td><input type="date" name="rdate2" id="rdate2" class="form-control"></td>
	            </tr>  
	         <tr>
	                <th>진행상태</th>
					<td>
						<select name="rstate" id="rstate">
							<option value="I">진행중</option>
							<option value="E">마감</option>
						</select>
					</td>
	            </tr>
	            <tr>
	                <th>공개여부</th>
					<td>
						<select name="rop" id="rop">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
						</select>
					</td>
	            </tr>
	    </table>
	    <input type="submit" value="등록" class="btn" name="btn_r" id="btn_r">
		</form>
		</div>
		<!-- col end -->
		</div>
	        <br>
	        </div>
			</div>
		</div>
		<br><br><br>
</form>
</div>








<!-- 본문 끝 -->		

<%@ include file="../footer.jsp" %>      
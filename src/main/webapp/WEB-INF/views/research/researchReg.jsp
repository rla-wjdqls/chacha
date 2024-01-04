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
		<form name="researchfrm" id="researchfrm" method="post" action="" enctype="multipart/form-data">
		<table class="table">
	            <tr>
	                <th>제목</th>
					<td><input type="text" placeholder="제목 입력해 주세요" name="rtitle" id="rtitle"></td>
	            </tr>
	            <tr>
					<th>시작일자</th>
					<td><input type="date"name="rdate1" id="rdate1" class="form-control" required></td>
	            </tr>
	           <tr>
					<th>종료일자</th>
					<td><input type="date" name="rdate2" id="rdate2" class="form-control" required></td>
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
						<select name="rstate" id="rstate">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
						</select>
					</td>
	            </tr>
	    </table>
		<br><br><br>
		<table class="table">
	        <thead id="researchInto" name="researchInfo">
	            <tr>
	                <th></th>
	                <th>질문번호</th>
	                <th>질문유형</th>
	                <th>질문내용</th>
	                <th>선택지</th>
	            </tr>
	        </thead>
	  		<tbody id="researchTable" name="researchTable">
			<%-- <c:forEach items="${myList_a}" var="mylista"> --%>
		        <!-- 조건이 참일 때 실행할 내용 -->
		        <tr>
		            <td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1"></td>
		            <td>질문1</td>
		            <td>
		            	<select>
		            		<option>객관식(중복불가)</option>
		            		<option>객관식(중복허용)</option>
		            		<option>주관식</option>
		            	
		            	</select>
		            </td>
		            <td><input type="text" placeholder="질문을 입력해주세요" id="qcont" name="qcont"></td>
		            <td>
		            <input type="text" placeholder="답변을 입력해주세요" id="choice" name="choice">
		            <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2" onclick="deleteRow(this)"><br>
		            <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1" onclick="addAnswerField(this)">
		            </td>
		        </tr>
		        <tr>
		            <td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1"></td>
		            <td>질문2</td>
		            <td>
		            	<select>
		            		<option>객관식(중복불가)</option>
		            		<option selected>객관식(중복허용)</option>
		            		<option>주관식</option>
		            	</select>
		            </td>
		            <td><input type="text" placeholder="질문을 입력해주세요" id="qcont" name="qcont"></td>
		            <td>
		            <input type="text" placeholder="답변을 입력해주세요" id="choice" name="choice">
		            <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2" onclick="deleteRow(this)"><br>
		            <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1" onclick="addAnswerField(this)">
		            </td>
		        </tr>
		        <tr>
		            <td><input type="button" value="삭제" class="btn" name="btn_d1" id="btn_d1"></td>
		            <td>질문3</td>
		            <td>
		            	<select>
		            		<option>객관식(중복불가)</option>
		            		<option>객관식(중복허용)</option>
		            		<option selected>주관식</option>
		            	</select>
		            </td>
		            <td><input type="text" placeholder="질문을 입력해주세요" id="qcont" name="qcont"></td>
		            <td>
		            <input type="text" placeholder="답변을 입력해주세요" id="choice" name="choice">
		            <input type="button" value="삭제" class="btn" name="btn_d2" id="btn_d2" onclick="deleteRow(this)"><br>
		            <input type="button" value="추가" class="btn" name="btn_a1" id="btn_a1" onclick="addAnswerField(this)">
		            </td>
		        </tr>
			<%-- </c:forEach> --%>
	        </tbody>
	    </table>
	    <input type="button" value="추가" class="btn" name="btn_a2" id="btn_a2" onclick="addTableBody()"><br><br>
	    <input type="button" value="등록" class="btn" name="btn_r" id="btn_r">
		</form>
		</div>
		<!-- col end -->
		</div>
	        <br>
	        </div>
			</div>
		</div>
		<br><br><br>


<!-- 본문 끝 -->
		
</form>
</div>






<%@ include file="../footer.jsp" %>      
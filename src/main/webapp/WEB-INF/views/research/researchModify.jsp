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
<div class="container text-center"> <h3>설문조사 수정</h3>
	<div class="container">
		<p>설문조사 내용 수정 할 수 있습니다</p>
		<hr><br><br>
		 <div class="container-line" id="surveyContainer">
            <!-- 설문조사 내용이 여기에 동적으로 추가될 것입니다. -->
          <div class="row">
		<div class="col-sm-12">
		<form name="rmodifyfrm" id="rmodifyfrm" method="post" action="researchModify">
		<input type="hidden" name="rno" id="rno" value="${researchList2.rno}"/>
		<table class="table">
	            <tr>
	                <th>제목</th>
					<td><input type="text" name="rtitle" id="rtitle" value="${researchList2.rtitle}" placeholder="제목 입력해 주세요"></td>
	            </tr>
 	 	        <tr>
					<th>시작일자</th>
					<td><input type="date" name="rdate1" id="rdate1" value="${researchList2.rdate1}" class="form-control"></td>
	            </tr>
	           <tr>
					<th>종료일자</th>
					<td><input type="date" name="rdate2" id="rdate2" value="${researchList2.rdate2}" class="form-control"></td>
	            </tr>  
				<tr>
				    <th>진행상태</th>
				    <td>
				        <select name="rstate" id="rstate">
					        <option value="I" <c:if test="${researchList2.rstate eq 'I'}">selected</c:if>>진행중</option>
					        <option value="E" <c:if test="${researchList2.rstate eq 'E'}">selected</c:if>>마감</option>
				        </select>
				    </td>
				</tr>
				<tr>
	                <th>공개여부</th>
					<td>
						<select name="rop" id="rop">
					        <option value="Y" <c:if test="${researchList2.rop eq 'Y'}">selected</c:if>>공개</option>
					        <option value="N" <c:if test="${researchList2.rop eq 'N'}">selected</c:if>>비공개</option>
				        </select>
						</select>
					</td>
	            </tr>
	    </table>
		<br><br><br>
    	<input type="submit" value="수정" class="btn" name="btn_m" id="btn_m">
		</form>
		<form id="researchDeletefrm" name="researchDeletefrm" method="post" action="researchDelete">
			<input type="hidden" name="rno" id="rno" value="${researchList2.rno}"/>
			<input type="submit" value="삭제" class="btn" name="btn_d" id="btn_d" onclick="researchDel()">
		</form> 
		</div>
		<!-- col end -->
		</div>
	        <br>
	    </div>
		</div>
		</div>
		<br><br><br>

<script>

function researchDel(){
	if(confirm("정말 삭제하겠습니까?")) {
		$("#researchDelete").submit();
	}//if end
}//researchDelete() end






</script>






<!-- 본문 끝 -->		

<%@ include file="../footer.jsp" %>
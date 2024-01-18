<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


<!-- 본문 시작 template.jsp -->
<div class="container mt-2">

      <h2>입양 후기 글 작성</h2>
      <p>사랑스러운 가족이 생긴 것을 자랑해주세요~</p>
      
      <div class="row">
		<div class="col-sm-12">
			<form name="adoptfrm" id="adoptfrm" method="post" action="insert" enctype="multipart/form-data">
				<input type="hidden" name="anino" id="anino" value=""/>
				<table class="table table-hover">
					<tr>
						<td>제목</td>
						<td><input type="text" name="artitle" class="form-control"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="3" cols="60" name="arinfo"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="img" class="form-control"></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="완료" class="btn btn-success"></td>
					</tr>

					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<script>
   let anino = sessionStorage.getItem('anino');
   console.log(anino);
   $("#anino").val(anino);
   
</script>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
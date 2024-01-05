<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<div class="container mt-2">
    <div class="text-center"><h2>입양후기글 수정</h2></div>
    
    <form name="adoptfrm" id="adoptfrm" method="post" action="/adopt/adoptUpdate" enctype="multipart/form-data">   
        <input type="hidden" name="arno" id="arno" value="${adoptup.arno}"/>
        <div class="col-sm-12">
            <table class="table">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="artitle" id="artitle" class="form-control" value="${adoptup.artitle}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea rows="3" cols="60" name="arinfo" id="arinfo" class="form-control">${adoptup.arinfo}</textarea></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <input type="file" name="img" id="arimg" class="form-control">
                        <small>현재 첨부된 파일: ${adoptup.arimg}</small>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="완료" class="btn btn-success">
                        <input type="button" value="취소" onclick="location.href='/adopt/adoptReview'" class="btn btn-danger">
                    </td>
                </tr>
            </table>
        </div>
    </form>         
</div>

<%@ include file="../footer.jsp" %> 
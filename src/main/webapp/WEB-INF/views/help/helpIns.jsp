 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<!-- 본문 시작 -->
<%
	//사용자가 입력 요청한 정보를 가져오기
	String texttitle =request.getParameter("texttitle").trim();
	String text		 =request.getParameter("text").trim();
	String helppic	 =request.getParameter("helppic").trim();
	String uid		 =request.getParameter("uid").trim();
	String uploaddate=request.getParameter("uploaddate").trim();
	Int love		 =request.getParameter("love").trim();
	Int cnt			 =request.getParameter("cnt").trim();
	
	//dto객체에 담기
	dto.setTexttitle(texttitle);
	dto.setText(text);
	dto.setHelppic(helppic);
	dto.setUid(uid);
	dto.setUploaddate(uploaddate);
	dto.setLove(love);
	dto.setCnt(cnt);
	
	int cnt = dao.create(dto);
	if(cnt==0){
		out.println("<p>글 추가 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else {
		out.println("<script>");
		out.println("	alert('게시글이 추가되었습니다.');");
		out.println("	location.href='helpList.jsp';"); //목록페이지 이동
		out.println("</script>");
	}
%>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>      
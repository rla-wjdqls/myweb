<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 noticeUpdateProc.jsp -->

<h3>* 글수정 *</h3>


<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno").trim()); 
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();

	dto.setNoticeno(noticeno);
	dto.setSubject(subject);
	dto.setContent(content);

	int cnt = dao.updateProc(dto);
	
	if(cnt==0){
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('게시글이 수정되었습니다');");
		out.println("	location.href='noticeList.jsp';");
		out.println("</script>");
	}//if end	
%>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
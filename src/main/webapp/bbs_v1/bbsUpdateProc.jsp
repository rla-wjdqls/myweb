<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 bbsUpdateProc.jsp -->
<!-- 수정 요청한 정보를 가져와서, DB에 가서 행 수정하기 -->


<h3>* 글수정 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">[글목록]</a>
</p>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno").trim()); 
	String wname   = request.getParameter("wname").trim();	
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd  = request.getParameter("passwd").trim();
	String ip 	   = request.getRemoteAddr();

	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);

	int cnt = dao.updateProc(dto);
	
	if(cnt==0){
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('게시글이 수정되었습니다');");
		out.println("	location.href='bbsList.jsp';");
		out.println("</script>");
	}//if end	
%>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>



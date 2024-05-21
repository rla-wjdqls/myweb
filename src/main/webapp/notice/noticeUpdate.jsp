<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 noticeUpdate.jsp -->

<h3>* 게시판 수정 *</h3>
<p>
	<a href="noticeForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="noticeList.jsp">[글목록]</a>
</p>
	
<% 
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	dto = dao.read(noticeno);
	if(dto==null){
		out.println("해당글 없음!");
	} else{
%>																					
	<form name="noticefrm" id="noticefrm" method="post" action="noticeUpdateProc.jsp">
		<input type="hidden" name="noticeno" value="<%=noticeno%>">
	
		<table class="table table-bordered">
			<tr>
			   <th class="success" style="text-align: center">제목</th>
			   <td><input type="text" name="subject" id="subject" value="<%=dto.getSubject() %>" class="form-control" maxlength="100" required></td>
			</tr>
			<tr>
			   <th class="success" style="text-align: center">내용</th>
			   <td>
				   <textarea rows="5"  class="form-control" name="content" id="content"><%=dto.getContent()%></textarea>
			   </td>
			</tr>
			<tr>
			    <td colspan="2" align="center">
			       <input type="submit" value="수정" class="btn btn-success">
			       <input type="reset" value="취소" class="btn btn-danger">
			    </td>
			</tr>
		</table>
	</form>

<%
	}//if end
%>










<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 bbsUpdate.jsp -->
<!-- 글번호가 일치하는 행을 가져와서, 수정폼에 출력하기 -->
	<h3>* 게시판 수정 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">[글목록]</a>
</p>
	
<% 
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto = dao.read(bbsno);
	if(dto==null){
		out.println("해당글 없음!");
	} else{
%>																			<!-- myscript.js에 함수 작성함 -->
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit= "return bbsCheck()">
	<input type="hidden" name="bbsno" value="<%=bbsno%>"><!-- 글번호 -->
	<table class="table table-bordered">
		<tr>
		   <th class="success" style="text-align: center">작성자</th>
		   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname() %>" class="form-control" maxlength="20" required autofocus></td>
		</tr>
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
		   <th class="success" style="text-align: center">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
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
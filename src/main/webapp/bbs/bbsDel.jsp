<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

    
<!-- 본문 시작 bbsDel.jsp -->	
<!-- 글번호(bbsno)와 비밀번호(passwd)가 일치하면 삭제 -->
	<h3>* 글 삭제 *</h3>
	<p><a href="bbsList.jsp">[글목록]</a></p>
	
<% 
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
%>												<!-- myscript.js -->
	<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()">
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		<table class="table table-bordered">
			<tr>
				<th class="info" style="text-align: center">비밀번호</th>
				<td class="active"><input type="password" name="passwd" id="passwd" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn btn-danger">
				</td>
			</tr>
		</table>
	</form>
	
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>
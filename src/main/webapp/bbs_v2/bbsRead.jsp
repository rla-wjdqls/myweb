<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

    
<!-- 본문 시작 bbsIns.jsp -->	
	<h3>* 게시판 상세보기 *</h3>

<% 
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto = dao.read(bbsno);
	if(dto==null){
		out.println("해당글 없음!");
	}else{	
		
		dao.incrementCnt(bbsno); //조회수증가
%>

	<table class="table table-bordered">
		<tr>
			<th class="success" style="text-align: center">제목</th>
			<td class="active"><%=dto.getSubject() %></td>
		</tr>	
		<tr>
			<th class="success" style="text-align: center">내용</th>
			<td class="active">
<%
			//특수문자 및 엔터를 <br> 태그로 치환하기
			String content = dto.getContent();
			content = Utility.convertChar(content);
			out.println(content);
%>        	
			
			</td>
		</tr>
		<tr>
			<th class="success" style="text-align: center">조회수</th>
			<td class="active"><%=dto.getReadcnt() %></td>
		</tr>
		<tr>
			<th class="success" style="text-align: center">작성자</th>
			<td class="active"><%=dto.getWname() %></td>
		</tr>
		<tr>
			<th class="success" style="text-align: center">작성일</th>
			<td class="active"><%=dto.getRegdt() %></td>
		</tr>
		<tr>
			<th class="success" style="text-align: center">IP</th>
			<td class="active"><%=dto.getIp() %></td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn btn-info" value="답변쓰기" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
		<input type="button" class="btn btn-success" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>'">
		<input type="button" class="btn btn-danger" value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
		
<%	
	}//if end
%>



<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>








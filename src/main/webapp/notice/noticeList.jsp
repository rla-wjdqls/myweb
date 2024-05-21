<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 noticeList.jsp -->

<h3>* 글목록 *</h3>
<p><a href="noticeForm.jsp">[글쓰기]</a></p>


<table class="table table-bordered">
	  <tr class="success">
	    <th style="text-align: center">제목</th>
	    <th style="text-align: center">작성일</th>
	  </tr>
<% 
	ArrayList<NoticeDTO> list = dao.list();
	if(list==null){
		out.println("<tr>");
		out.println("   <td colspan='5'>글 없음!</td>");
		out.println("</tr>");
	}else{
		
		//오늘 날짜를 문자열 "2023-10-16" 만들기
		String today = Utility.getDate();
	
		 for(int i=0; i<list.size(); i++){
		//모을 때 한줄 씩 모았으므로 한줄 씩 가져와서 dto에 담는다  
			dto = list.get(i);
%>
		 	<tr class="active">
				<td><a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>"><%=dto.getSubject()%></a></td>
		 		<td><%=dto.getRegdt().substring(0, 10)%></td>
		 	</tr>
<%
		 }//for end		
	}//if end
%>
</table>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>














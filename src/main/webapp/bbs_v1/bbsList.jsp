<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 bbsList.jsp -->


<h3>* 글목록 *</h3>
<p><a href="bbsForm.jsp">[글쓰기]</a></p>

<table class="table table-bordered">
  <tr class="success">
    <th style="text-align: center">제목</th>
    <th style="text-align: center">조회수</th>
    <th style="text-align: center">작성자</th>
    <th style="text-align: center">작성일</th>
  </tr>
<% 
	ArrayList<BbsDTO> list = dao.list();
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
		 		<td style="text-align: left">
<% 
				//답변이미지 출력
				for(int n=1; n<=dto.getIndent(); n++){
					out.println("<img src='../images/reply.gif'>");
				}//for end
%>
		 		<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno() %>"><%=dto.getSubject()%>	
		 			
<% 
				//오늘 작성한 글 제목 뒤에 new 이미지 출력
				//작성일(regdt)에서 "년월일" 자르기
				String regdt = dto.getRegdt().substring(0, 10);

				if(regdt.equals(today)){ //작성일이 오늘 날짜와 같다면
					out.println("<img src='../images/new.gif'>");
				}//if end
				
				//조회수가 10 이상이면 hot 이미지 출력
				if(dto.getReadcnt()>=10){
					out.println("<img src='../images/hot.gif'>");
				}//if end	
%>		 		
		 		</a>
		 		</td>
		 		<td><%=dto.getReadcnt()%></td>		 		
		 		<td><%=dto.getWname()%></td>
		 		<td><%=dto.getRegdt().substring(0, 10)%></td>
		 	</tr>
<%
		 }//for end
		 
		 //글갯수 출력
		 //int totalRecord = list.size();
		 int totalRecord = dao.count();
		 out.println("<tr>");
		 out.println("	<td colspan='4' style='text-align:center;'>");
		 out.println("		글갯수:<strong> " + totalRecord +"</strong>" + " 개 입니다");
		 out.println("	</td>");
		 out.println("</tr>");
		 
    }//if end
%>
	</table>


<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
    
<!-- 본문 시작 template.jsp -->
<h3>* 새글쓰기 *</h3>
<p><a href="noticeList.jsp">[글목록]</a></p>
																 				 <!-- myscript.js 함수 작성함 -->
<form name="noticefrm" id="noticefrm" method="post" action="noticeIns.jsp" onsubmit= "return noticeCheck()">
<table class="table">
	<tr>
	   <th class="success" style="text-align: center">제목</th>
	   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success" style="text-align: center">내용</th>
	   <td><textarea rows="5" class="form-control" name="content" id="content" placeholder="내용을 입력하세요."></textarea></td>
	</tr>


	<tr>
	    <td colspan="2" align="center">
	       <input type="submit" value="새글쓰기" class="btn btn-success">
	       <input type="reset"  value="취소" class="btn btn-danger">
	    </td>
	</tr>
</table>
</form>






















<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>
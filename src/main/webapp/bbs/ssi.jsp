<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.bbs.*" %>

<jsp:useBean id="dao" class="net.bbs.BbsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO" scope="page"></jsp:useBean>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	//검색
	String col  = request.getParameter("col");	//검색컬럼
	String word = request.getParameter("word"); //검색어

	col  = Utility.checkNull(col); //문자열이 null이면 빈문자열로 치환
	word = Utility.checkNull(word);

	//현재 페이지
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}//if end
%>







































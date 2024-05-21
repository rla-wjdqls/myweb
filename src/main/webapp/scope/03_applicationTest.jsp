<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>03_applicationTest.jsp</title>
</head>
<body>

	<h3>내장객체</h3>
<% 
	/*
		● [application 내장객체]	
	      - ServletContext application
	      - 사용자 모두가 공유하는 전역적 의미의 객체
	      - 서버에 대한 정보를 관리하는 객체
	*/
	

	//D:\java202307\workspace
	//			   \.metadata
	//			   \.plugins
	//			   \org.eclipse.wst.server.core
	//			   \tmp0
	//			   \wtpwebapps
	//			   \myweb
	//			   \images
	out.print(application.getRealPath("/images")); // /images 폴더의 실제 물리적인 경로
	//웹경로 http://localhost:9090/myweb.images
	
	//위와 결과 값은 같으나 톰캣 10 이상에서는 지원하지 않음
	out.print(request.getRealPath("/images"));
	out.print("<hr>");
	
	
	//application 내부 변수
	application.setAttribute("uid", "ITWILL");
	out.print(application.getAttribute("uid")); //ITWILL
	out.print("<hr>");

	
	
	//● [response 내장객체] - 요청한 사용자에게 응답할 때
	
	//response.sendRedirect("") 페이지 이동
	
	//요청한 사용자에게 응답메세지 전송 (AJAX에서 많이 사용)
	PrintWriter print = response.getWriter();
	



%>




</body>
</html>


































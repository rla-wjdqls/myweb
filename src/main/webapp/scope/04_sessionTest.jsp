<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>04_sessionTest.jsp</title>
</head>
<body>

	<h3>session 내장객체</h3>
<% 
	/*
		● [session 내장객체] ★★★
	      - HttpSession session
	      - 요청한 사용자에게 개별적으로 접근 (나만의 캐비넷)
	      - 선언한 세션변수는 전역적 상태로 유지된다
	      - 요청한 정보의 상태를 유지하기 위해서
	      - 일정시간동안 이벤트가 발생되지 않으면 자동 삭제
	*/

	//세션 내장객체에서 발급해 주는 아이디
	out.print("세션 임시 아이디 : ");
	out.print(session.getId()+"<hr>"); //91CD3B1898AA4880EF81457205D05F75

	//세션변수
	//->별도의 자료형이 없다
	//->myweb 프로젝트의 모든 페이지에서 공유되는 전역변수 (메일/카페/블로그 등 상태유지에 사용)
	session.setAttribute("s_id", "itwill");
	session.setAttribute("s_pw", "12341234");

	//세션변수 값 가져오기
	Object obj = session.getAttribute("s_id");
	String s_id = (String)obj; //다형성
	String s_pw = (String)session.getAttribute("s_pw");
	
	out.print("세션변수 s_id :" + s_id + "<hr>"); //itwill
	out.print("세션변수 s_pw :" + s_pw + "<hr>"); //12341234

	//세션변수 강제 제거(로그아웃할때) -> null값
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	
	out.print("세션변수 삭제후<hr>");
	out.print("세션변수 s_id :" + session.getAttribute("s_id")); //null
	out.print("<hr>");
	out.print("세션변수 s_pw :" + session.getAttribute("s_pw")+ "<hr>"); //null
	
	//세션영역에 있는 모든값 전부 강제 삭제
	session.invalidate();
	
	
	//세션 시간
	out.print("현재 세션 유지 시간 : ");
	out.print(session.getMaxInactiveInterval()); //1800초(30분) 세션 유지 디폴트 값. (단위:초)
	out.print("초(30분)");
	out.print("<hr>");
	
	session.setMaxInactiveInterval(60*10); //10분
	
	out.print("변경된 세션 유지 시간 : ");
	out.print(session.getMaxInactiveInterval()); //600초(10분)
	out.print("초(10분)");
	out.print("<hr>");
	
	/*
	  /WEB-INF/web.xml 배치관리자에서 세션시간 변경 (추천)
	  <!-- 세션 유지 시간 설정 (20분)  -->
	  <session-config>
	  	<session-timeout>20</session-timeout>
	  </session-config>
	*/
	
	
	
%>





</body>
</html>




















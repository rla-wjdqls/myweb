<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- layout.css import-->
  <link rel="stylesheet" href="./css/layout.css">
  
  <script src="./js/myscript.js"></script> 
  <style>
  
    #flower{
  	width: 200px;
    height: 200px;
  
  }
  #flower:hover {
  	transform: rotate(100deg) 
  }
  </style>

 
</head>
<body>

<!-- 메인 카테고리 시작 -->
	<nav class="navbar navbar-default">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
	        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
	        <li><a href="./member/loginForm.jsp">로그인</a></li>
	        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
	        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
	      </ul>
	    </div>
	  </div>
	</nav><!-- 메인 카테고리 끝 -->
	
	<!-- Content 시작-->
	<!-- First Container 시작 -->
	<div class="container-fluid bg-1 text-center">
	  <img src="./images/flower2.png" id="flower" class="img-responsive img-circle margin" style="display:inline" alt="라이언" width="50%" onclick="alert('노란색꽃!')">
	  <h3>I'm an adventurer</h3>
	</div><!-- First Container 끝 -->
	
	<!-- Second Container 시작 -->
	<div class="container-fluid bg-2 text-center">
	    <div class="row">
	        <div class="col-xs-12">
	            <!-- 본문 시작-->
	            <div class="container">           
	                <img src="./images/flower.png" id="flower" class="img-rounded" alt="Cinque Terre" width="50%" onclick="alert('하얀색꽃!')"> 
	            </div>
	
	            <div id="clock"></div>
	            <button type="button" class="btn btn-default btn-lg" onclick="showtime()">시작</button>
	            <button type="button" class="btn btn-lg" onclick="killtime()">종료</button>
	           
	            <!-- 본문 끝-->
	        </div><!-- col-xs-12 끝 -->
	    </div>
	</div><!-- Second Container 끝 -->
	
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
	    Copyright &copy; 2023 MyWeb
	</footer>
	
	<script>
	 function showtime(){
	
	const d=new Date(); //변수의 상수화, 시스템의 현재 날짜 정보 가져오기 (년월일시분초)
	
	let today=""; //결과값
	
	today += d.getFullYear() + "."; //2023.
	
	if(d.getMonth()+1<10){ 
	today += "0";
	}//if end
	today += d.getMonth() +1+ "."; //2023.08
	
	if(d.getDate()<10){
	today += "0"; 
	}//if end
	today += d.getDate(); //2023.08.08 
	
	const days = ["일","월","화","수","목","금","토"]
	today += " ("+days[d.getDay()] + ") "; //2023.08.08 (화)
	
	if(d.getHours()<12){  //2023.08.08 (화) AM
	today += "AM "; 
	} else today += "PM ";
	
	if(d.getHours()<13){
	today += d.getHours()+":";
	}else today += d.getHours()-12+":"; //2023.08.08 (화) PM 2:
	
	
	if(d.getMinutes()<10){
	today += "0";
	}//if end
	today += d.getMinutes()+ ":"; //2023.08.08 (화) PM 2:03
	
	if(d.getSeconds()<10){
	today += "0";
	}//if end
	today += d.getSeconds(); //2023.08.08 (화) PM 2:03:18
	
	document.getElementById("clock").innerText=today;
	
	timer = setTimeout(showtime,1000);
	
	}//showtime() end
	
	let timer; 
	
	function killtime(){
	
	clearTimeout(timer); //시간해제
	
	}//killtime() end
	
	</script>

</body>

</html>
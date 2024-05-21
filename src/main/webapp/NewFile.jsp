<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>stickcode_summernote</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
<h1>Summernote</h1>

<form name="bbsfrm" id="bbsfrm" method="post">

<table class="table">
	<tr>
	   <th class="success" style="text-align: center">작성자</th>
	   <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" required autofocus></td>
	</tr>
	<tr>
	   <th class="success" style="text-align: center">제목</th>
	   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success" style="text-align: center">비밀번호</th>
	   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
	</tr>
</table>

<div id="summernote">
	<script>
	    // 메인화면 페이지 로드 함수
	    $(document).ready(function () {
	        $('#summernote').summernote({
	            placeholder: '내용을 작성하세요',
	            height: 200,
	            maxHeight: 200
	        });
	    });
	</script>
</div>
<table class="table">
	<tr>
	 	<td colspan="2" align="center">
		       <input type="submit" value="작성" class="btn btn-success">
		       <input type="reset"  value="취소" class="btn btn-danger">
		</td>
	</tr>
</table>


</body>
</html>
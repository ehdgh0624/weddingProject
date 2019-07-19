<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;" >
	<h1 style="text-align: center;" >댓글 수정</h1>
	<form action="/UpdateComment.do">
	
	<input type="text" value="${experienceCommentContent}" name="experienceCommentContent">
	<input type="hidden" name="experienceCommentNo" value="${experienceCommentNo}"> 
	<br>
	<input type="submit" value="수정하기">
	<input type='button' onclick='javascript()' value='창닫기'/>
	</form>
</div>


<script type="text/javascript">
		function javascript(){
		    self.close();  
		}

</script>

</body>
</html>
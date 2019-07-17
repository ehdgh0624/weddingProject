<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;" >
		<h1 style="text-align: center;" >댓글달기</h1>
		<form action="/exCommentRegs.do">
		<input type="text" name="experienceCommentContent">
		<input type="hidden" name="experienceCommentNo" value="${experienceCommentNo}"> 
		<input type="hidden" name="experienceCommentLevel" value="2"> 
		<input type="hidden" name="experienceCommentRef" value="${experienceCommentRef}">
		<input type="hidden" name="experienceCommentWriter" value="${sessionScope.member.memberId }"> 
		
		<br>
		<input type="submit" value="확인">
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
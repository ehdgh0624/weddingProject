<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트트으으으으
		
<script type="text/javascript" 
src="/resources/editor/ckeditor/ckeditor.js"></script>

<form action="/test.do" method="post">
<textarea name="editor"  id="editor" cols="80"></textarea>
<input type="submit" value="등록하기"> 
</form>		
		<script type="text/javascript">
			CKEDITOR.config.height = 300;
			CKEDITOR.config.toolbarCanCollapse = true;
			CKEDITOR.replace('editor' , {
			});
			</script>
			
</body>




</script>
</html>
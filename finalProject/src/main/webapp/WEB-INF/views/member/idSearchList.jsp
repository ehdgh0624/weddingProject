<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/photo.css"> <!--게시판 사진  css --><html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
<h1>아이디 찾기 결과</h1>
<br><br>
<table class="comm-tbl">
	<colgroup>
		<col width="10%">
		<col width="20%">
		<col width="/">
	</colgroup>
		<tr>
			<th>No</th>
			<th>Id</th>
			<th>가입일</th>
		</tr>
	<c:forEach items="${list }" var="list" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${list.memberId }</td>
			<td>${list.enrollDate }</td>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>
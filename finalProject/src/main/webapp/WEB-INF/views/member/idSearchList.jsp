<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<colgroup>
		<col width="10%">
		<col width="20%">
		<col width="/">
	</colgroup>
		<tr>
			<th>No</th>
			<th>Id</th>
			<th>비고</th>
		</tr>
	<c:forEach items="${list }" var="list" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${list.memberId }</td>
			<td></td>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>
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

			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="/%">
				</colgroup>
				<tr>
					<th>No</th>
					<th>파일이미지</th>
					<th>미리보기</th>
				</tr>
				<c:forEach var="s" items="${gallList }" varStatus="i">
					<tr class="listView">
						<td class="simNo">${i.count }</td>
						<td><input type="file" value="${s.filename }"></td>
						<td><img src="${s.filepath }"></td>
					</tr>
				</c:forEach>
			</table>


</body>
</html>
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
					<col width="5%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="/">
				</colgroup>
				<tr>
					<th>CODE</th>
					<th>업체명</th>
					<th>가격</th>
					<th>전화번호</th>
					<th>업체지역</th>
				</tr>
				<c:set var="total" value='0'></c:set>
				<!-- 총금액세팅 -->
				<c:forEach var="s" items="${simulatorSelect }">
					<tr class="listView">
						<td class="simNo">${s.code }</td>
						<td>${s.prdName }</td>
						<td>${s.prdPrice }</td>
						<td>${s.prdTel }</td>
						<td>${s.prdLoc }</td>
					</tr>
				</c:forEach>
			</table>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/hall.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/collectionList.css"> 
<script type="text/javascript" src="/resources/js/content.js"></script><!-- content.js -->

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
	
	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="common-tbl-box">
			<h2 class="comm-content-tit">예약자리스트</h2> 
				<c:forEach var="entry" items="${resMap }">
					<h1>업체종류 :${entry.key }<h1>		
					<table class="comm-tbl">		
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>예약번호</th>
							<th>이름(아이디)</th>
							<th>이메일</th>
							<th>//////</th>
							<th>결제수단</th>
						</tr>
						<c:forEach var="list" items="${entry.value }"> <!-- 키값꺼내오기 -->
							<tr onclick="location.href='/reservationView.do?reservationNo=${list.reservationNo }'">
								<td>${list.reservationNo }</td>
								<td>${list.memberName }(${list.memberId })</td>
								<td>${list.memberEmail }</td>
								<td>${list.prdName }</td>
								<td>${list.payMethod }</td>
							</tr>
						</c:forEach>
					</table>		
					<hr>			
			</c:forEach>	
		</div>
	</div>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>
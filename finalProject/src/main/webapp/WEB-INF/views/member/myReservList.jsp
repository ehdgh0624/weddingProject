<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="common-tbl-box">
			<h2 class="comm-content-tit">예약리스트</h2> 
				<c:forEach var="entry" items="${resMap }">
					<h1>결혼예정일 :${entry.key }</h1>		
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
							<th>분류</th>
							<th>업체명</th>
							<th>가격</th>
							<th>예약날짜</th>
						</tr>
						<c:set var="total" value='0'></c:set>  <!-- 총금액세팅 -->
						<c:forEach var="list" items="${entry.value }"> <!-- 키값꺼내오기 -->
							<tr onclick="location.href='/reservationView.do?memberId=${sessionScope.member.memberId }reservationNo=${list.reservationNo }'">
								<td>${list.reservationNo }</td>
								<td>${list.code }</td>
								<td>${list.prdName }</td>
								<td class="price">${list.totalPrice }</td>
								<td>${list.orderDate }</td>
							</tr>
							<c:set var="total" value="${total+list.totalPrice }"/>
						</c:forEach>
					</table>		
					<h1>총금액 : ${total } // 나의 예산 : ${sessionScope.member.budget}</h1>	
					<hr>			
			</c:forEach>	
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>



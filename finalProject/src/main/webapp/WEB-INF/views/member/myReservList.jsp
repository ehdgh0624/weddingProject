<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<script>
//콤마찍기
function addComma(num) {
  return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

$(document).ready(function(){
	$(".price").each(function(){
		$(this).children("span").text(addComma($(this).children("span").html()));
	});
	
	$(".myReserv-price").children("p").each(function(){
		$(this).children("b").text(addComma($(this).children("b").html()));
	})
})
</script>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<h2 class="comm-content-tit">예약리스트</h2>
		<div class="area">
			<div class="common-tbl-box">
				<c:forEach var="entry" items="${resMap }">
					<h1 class="main-comm-sub-tit">결혼예정일 &nbsp; <b>${entry.key }</b></h1>		
					<table class="comm-tbl type2">		
						<colgroup>
							<col width="10%">
							<col width="12%">
							<col width="/">
							<col width="20%">
							<col width="12%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>예약번호</th>
							<th>분류</th>
							<th>업체명</th>
							<th>가격</th>
							<th>예약날짜</th>
							<th>상세보기</th>
						</tr>
						<c:set var="total" value='0'></c:set>  <!-- 총금액세팅 -->
						<c:forEach var="list" items="${entry.value }"> <!-- 키값꺼내오기 -->
							<tr>
								<td>${list.reservationNo }</td>
								<td>
									<c:choose>
										<c:when test="${list.code eq 'H' }">웨딩홀</c:when>
										<c:when test="${list.code eq 'D' }">드레스</c:when>
										<c:when test="${list.code eq 'M' }">메이크업&헤어</c:when>
										<c:when test="${list.code eq 'S' }">스튜디오</c:when>
									</c:choose>
								</td>
								<td>${list.prdName }</td>
								<td class="price"><span>${list.totalPrice }</span> 원</td>
								<td>${list.orderDate }</td>
								<td>
									<div class="common-tbl-btn-group" style="padding-top:0;">
										<button class="btn-style1 small" onclick="location.href='/reservationView.do?memberId=${sessionScope.member.memberId }&reservationNo=${list.reservationNo }'">예약 상세 보기</button>
									</div>
								</td>
							</tr>
							<c:set var="total" value="${total+list.totalPrice }"/>
						</c:forEach>
					</table>
					<div class="clearfix myReserv-price">
						<p class="fl">나의 예산 : <b>${sessionScope.member.budget}</b> 만원</p>
						<p class="fr">총 금액 : <b>${total }</b> 만원</p>
					</div>		
				</c:forEach>	
			</div>
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>



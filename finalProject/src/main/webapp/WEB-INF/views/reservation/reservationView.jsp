<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<h1>결혼예정일 : ${reservation.weddingDate} ${reservation.weddingTime}<span style="float: right;">총 결제금액 : ${reservation.totalPrice}</span></h1>
			<br>
			<table class="comm-tbl">
				<colgroup>
					<col width="30%">
					<col width="/">
				</colgroup>
				<tr>
					<th colspan="2" style="text-align: center;">예약자 정보</th>
				</tr>
				<tr>
					<th>예약자 ID</th>
					<td>${reservation.memberId}</td>
				</tr>
				<tr>
					<th>예약자 성함</th>
					<td>${reservation.memberName}</td>
				</tr>
				<tr>
					<th>예약자 연락처</th>
					<td>${reservation.memberPhone}</td>
				</tr>
				<tr>
					<th>예약자 이메일</th>
					<td>${reservation.memberEmail}</td>
				</tr>
				<tr>
					<th colspan="2" style="text-align: center;">주문 정보</th>
				</tr>
				<tr>
					<th>주문일</th>
					<td>${reservation.orderDate}</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${reservation.code == 'G'}">
							<th>상품명</th>
						</c:when>
						<c:otherwise>
							<th>업체명</th>
						</c:otherwise>
					</c:choose>
					<td>${reservation.prdName}</td>
				</tr>
				<c:choose>
					<c:when test="${reservation.code == 'G'}">
						<tr>
							<th>주문수량</th>
							<td>${reservation.amount}</td>
						</tr>
						<tr>
							<th>총 결제금액</th>
							<td>${reservation.totalPrice}</td>
						</tr>
						<tr>
							<th>주문메모</th>
							<td>${reservation.orderMemo}</td>
						</tr>
						<tr>
							<th colspan="2" style="text-align: center;">배송 정보</th>
						</tr>
						<tr>
							<th>배송예정 주소</th>
							<td>${reservation.orderAddr}</td>
						</tr>
						<tr>
							<th>수령인</th>
							<td>${reservation.receiveName}</td>
						</tr>
						<tr>
							<th>수령인 연락처</th>
							<td>${reservation.receivePhone}</td>
						</tr>
						<tr>
							<th>배송상태</th>
							<c:if test="${reservation.deliveryStatus == 0}">
								<td>상품준비중</td>
							</c:if>
							<c:if test="${reservation.deliveryStatus == 1}">
								<td>발송준비중</td>						
							</c:if>
							<c:if test="${reservation.deliveryStatus == 2}">
								<td>배송중</td>						
							</c:if>
							<c:if test="${reservation.deliveryStatus == 3}">
								<td>배송완료</td>						
							</c:if>
						</tr>
						<c:if test="${reservation.deliveryStatus == 2 || reservation.deliveryStatus == 3}">
							<tr>
								<th>배송번호(송장번호)</th>
								<td>${reservation.deliveryNum}</td>
							</tr>
						</c:if>
						<tr>
							<th colspan="2" style="text-align: center;">결제 정보</th>
						</tr>
						<tr>
							<th>결제수단</th>
							<td>${reservation.payMethod}</td>
						</tr>
						<tr>
							<th>결제상태</th>
							<td id="orderStatus">
							<c:choose>
								<c:when test="${reservation.orderStatus == 0}">
									결제대기
								</c:when>
								<c:when test="${reservation.orderStatus == 1}">
									결제완료
								</c:when>
								<c:when test="${reservation.orderStatus == 2}">
									결제취소 대기
								</c:when>
								<c:otherwise>
									결제취소 완료
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<c:if test="${reservation.payMethod == '신용카드' || reservation.payMethod == '휴대폰'}">
							<tr>
								<th>결제일시</th>
								<td>${reservation.paymentDate}</td>
							</tr>
						</c:if>
						<c:if test="${reservation.payMethod == '무통장'}">
							<c:choose>
								<c:when test="${reservation.orderStatus == 0}">
									<tr>
										<th>가상계좌</th>
										<td>${reservation.bankNum}</td>
									</tr>
									<tr>
										<th>은행명</th>
										<td>${reservation.bankName}</td>
									</tr>
									<tr>
										<th>예금주</th>
										<td>${reservation.bankHolder}</td>
									</tr>
									<tr>
										<th>입금기한</th>
										<td>${reservation.bankDate}</td>
									</tr>							
								</c:when>
								<c:when test="${reservation.orderStatus == 1}">
									<tr>
										<th>결제일시</th>
										<td>${reservation.paymentDate}</td>
									</tr>							
								</c:when>
							</c:choose>
						</c:if>	
					</c:when>
					<c:otherwise>
						<c:if test="${reservation.code == 'S'}">
							<tr>
								<th>분류</th>
								<td>스튜디오</td>
							</tr>
							<c:if test="${not empty reservation.option1}">
								<tr>
									<th rowspan="2">옵션1</th>
									<td>옵션명 : ${reservation.option1}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option2}">
								<tr>
									<th rowspan="3">옵션2</th>
									<td>옵션명 : ${reservation.option2}</td>
								</tr>
								<tr>
									<td>
										방문일자 :
										<span>${reservation.option2Date}</span>
										<span>${reservation.option2Time}</span>
									</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option3}">
								<tr>
									<th rowspan="2">옵션3</th>
									<td>옵션명 : ${reservation.option3}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${reservation.code == 'D'}">
							<tr>
								<th>분류</th>
								<td>드레스</td>
							</tr>
							<c:if test="${not empty reservation.option1}">
								<tr>
									<th rowspan="3">옵션1</th>
									<td>옵션명 : ${reservation.option1}</td>
								</tr>
								<tr>
									<td>
										방문일자 :
										<span>${reservation.option1Date}</span>
										<span>${reservation.option1Time}</span>
									</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option2}">
								<tr>
									<th rowspan="2">옵션2</th>
									<td>옵션명 : ${reservation.option2}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option3}">
								<tr>
									<th rowspan="2">옵션3</th>
									<td>옵션명 : ${reservation.option3}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${reservation.code == 'M'}">
							<tr>
								<th>분류</th>
								<td>메이크업</td>
							</tr>
							<c:if test="${not empty reservation.option1}">
								<tr>
									<th rowspan="2">옵션1</th>
									<td>옵션명 : ${reservation.option1}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option2}">
								<tr>
									<th rowspan="2">옵션2</th>
									<td>옵션명 : ${reservation.option2}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
							<c:if test="${not empty reservation.option3}">
								<tr>
									<th rowspan="2">옵션3</th>
									<td>옵션명 : ${reservation.option3}</td>
								</tr>
								<tr>
									<td>가격 : </td>
								</tr>
							</c:if>
						</c:if>
					</c:otherwise>
				</c:choose>
			</table>
			<c:if test="${reservation.code == 'G'}">
				<button onclick="cancelPay()">결제취소</button>			
			</c:if>
			<hr>
		</div>	
	</div>
	
	<script>
		function cancelPay(){
			var reservationNo = ${reservation.reservationNo};
			var memberId = '${reservation.memberId}';
			var orderStatus = $('#orderStatus');
			$.ajax({
				url : "/cancelPay.do",
				type : "post",
				data : {reservationNo:reservationNo,memberId:memberId},
				success : function(data){
					if(data > 0){
						orderStatus.text("결제취소 대기");
						alert("결제취소를 신청했습니다. 최대 24시간까지 소요될 수 있습니다.");
					}else if(data == 0){
						alert("결제취소를 할 수 없습니다. 잠시 후 다시 시도해주세요.")						
					}else{
						alert("로그인 후 다시 시도해주세요.");
						location.href="/loginPage.do"
					}
				},
				error : function(){
					alert("잠시 후 다시 시도해주세요.")
				}
			});
		}
	</script>

	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>
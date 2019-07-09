<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		예약번호 : ${reservation.reservationNo}
		<br>
		타입분류 : ${reservation.code}
		<br>
		<c:choose>
			<c:when test="${reservation.code == 'S' || reservation.code == 'D' || reservation.code == 'M'}">
				업체번호 : ${reservation.prdNo}
				<br>
				결혼 예정일 : ${reservation.weddingDate}
				<br>
				결혼 예정시각 : ${reservation.weddingTime}
				<br>
				총 가격 : ${reservation.totalPrice}
				<br>
				예약자 아이디 : ${reservation.memberId}
				<br>
				예약자 이름 : ${reservation.memberName}
				<br>
				예약자 연락처 : ${reservation.memberPhone}
				<br>
				예약자 이메일 : ${reservation.memberEmail}
				<br>
				주문날짜 : ${reservation.orderDate}
				<br>
				<c:if test="${not empty reservation.option1 || not empty reservation.option2 || not empty reservation.option3}">
					<c:if test="${not empty reservation.option1}">
						옵션1 : ${reservation.option1}
						<c:if test="${not empty reservation.option1Date}">
							옵션1 예약날짜 : ${reservation.option1Date}
						<br>
						</c:if>
						<c:if test="${not empty reservation.option1Time}">
							옵션1 에약시간 : ${reservation.option1Time}
						</c:if>
						<br>
					</c:if>
					<c:if test="${not empty reservation.option2}">
						옵션2 : ${reservation.option2}
						<br>
						<c:if test="${not empty reservation.option2Date}">
							옵션2 예약날짜 : ${reservation.option2Date}
						<br>
						</c:if>
						<c:if test="${not empty reservation.option2Time}">
							옵션2 에약시간 : ${reservation.option2Time}
						</c:if>
						<br>
					</c:if>
					<c:if test="${not empty reservation.option3}">
						옵션3 : ${reservation.option3}
						<c:if test="${not empty reservation.option3Date}">
							옵션3 예약날짜 : ${reservation.option3Date}
						<br>
						</c:if>
						<c:if test="${not empty reservation.option3Time}">
							옵션3 에약시간 : ${reservation.option3Time}
						</c:if>
					</c:if>
				</c:if>			
			</c:when>
			<c:otherwise>
				상품번호 : ${reservation.prdNo}
				<br>
				결혼 예정일 : ${reservation.weddingDate}
				<br>
				결혼 예정시각 : ${reservation.weddingTime}
				<br>
				총 가격 : ${reservation.totalPrice}
				<br>
				예약자 아이디 : ${reservation.memberId}
				<br>
				예약자 이름 : ${reservation.memberName}
				<br>
				예약자 연락처 : ${reservation.memberPhone}
				<br>
				예약자 이메일 : ${reservation.memberEmail}
				<br>
				결제수단 : ${reservation.payMethod}
				<br>
				구매수량 : ${reservation.amount}
				<br>
				<c:choose>
					<c:when test="${reservation.orderStatus == 0}">
						주문상태 : 결제대기 중
						<br>
					</c:when>
					<c:when test="${reservation.orderStatus == 1}">
						주문상태 : 결제완료				
						<br>
					</c:when>
					<c:when test="${reservation.orderStatus == 2}">
						주문상태 : 결제취소 대기
						<br>
					</c:when>
					<c:otherwise>
						주문상태 : 결제취소 완료
						<br>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${not empty reservation.deliveryNum}">
						송장번호 : ${reservation.deliveryNum}
						<br>
					</c:when>
					<c:otherwise>
						송장번호 : 준비 중
						<br>
					</c:otherwise>
				</c:choose>
				주문날짜 : ${reservation.orderDate}
				<br>
				주문메모 : 	${reservation.orderMemo}
				<br>
				배송예정 주소 : ${reservation.orderAddr}
				<br>
				수령인 이름 : ${reservation.receiveName}
				<br>
				수령인 연락처 : ${reservation.receivePhone}
				<br>
				입금 은행 : ${reservation.bankName}
				<br>
				입금 계좌 : ${reservation.bankNum}
				<br>
				예금주 : ${reservation.bankHolder}
				<br>
				입금기한 : ${reservation.bankDate}
				<br>
			</c:otherwise>
		</c:choose>
		<br>
		
		
		
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
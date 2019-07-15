<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 아임포트 결제모듈 API 스크립트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 기타 스크립트 -->
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		/* 결제 성공 시 넘겨줄 정보 */
		var code = '${reservation.code}';
		var prdNo = ${reservation.prdNo};
		var prdName = '${reservation.prdName}';
		var weddingDate = '${weddingDate}';
		var weddingTime = '${reservation.weddingTime}';
		var totalPrice = ${reservation.totalPrice};
		var memberId = '${reservation.memberId}';
		var memberName = '${reservation.memberName}';
		var memberPhone = '${reservation.memberPhone}';
		var memberEmail = '${reservation.memberEmail}';
		var payMethod = '${reservation.payMethod}';
		var amount = ${reservation.amount};
		var orderMemo = '${reservation.orderMemo}';
		var orderAddr = '${reservation.orderAddr}';
		var receiveName = '${reservation.receiveName}';
		var receivePhone = '${reservation.receivePhone}';
		/* 결제 성공 시 넘겨줄 정보 끝 */
		/* 결제코드에 사용될 초단위 시간 */
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		var paymentDate = d.getFullYear()+'년 '+(d.getMonth()+1)+'월 '+d.getDate()+'일 '+d.getHours()+'시 '+d.getMinutes()+'분 '+d.getSeconds()+'초';
		/* 결제코드에 사용될 초단위 시간 끝 */
		IMP.init('imp06800707');				//내 가맹점 식별코드
		IMP.request_pay({
			merchant_uid : "ID"+date,			//결제ID
			name : prdName,						//결제상품명
			amount : 100,						//결제금액 : 테스트 시 price 지우고 100입력
			buyer_email : memberEmail,			//메일 테스트 시 id 지우고 "자기 메일" 입력
			buyer_name : memberName				//주문자 이름
		},function(rsp){
			if(rsp.success){
				var impUid = rsp.imp_uid;			//고유ID
				var paidAmount = rsp.paid_amount;	//결제금액
				var applyNum = rsp.apply_num;		//카드사 승인번호
				$('#submitCode').val(code);
				$('#submitPrdNo').val(prdNo);
				$('#submitPrdName').val(prdName);
				$('#submitWeddingDate').val(weddingDate);
				$('#submitWeddingTime').val(weddingTime);
				$('#submitTotalPrice').val(totalPrice);
				$('#submitMemberId').val(memberId);
				$('#submitMemberName').val(memberName);
				$('#submitMemberPhone').val(memberPhone);
				$('#submitMemberEmail').val(memberEmail);
				$('#submitPayMethod').val(payMethod);
				$('#submitAmount').val(amount);
				$('#submitOrderMemo').val(orderMemo);
				$('#submitOrderAddr').val(orderAddr);
				$('#submitReceiveName').val(receiveName);
				$('#submitReceivePhone').val(receivePhone);
				$('#submitImpUid').val(impUid);
				$('#submitApplyNum').val(applyNum);
				$('#submitPaymentDate').val(paymentDate);
				window.opener.name="parentPage";
				$('#paymentSuccess').submit();
				window.close();
			}else{
				alert("결제 실패 - 결제 페이지를 닫습니다.");
				window.close();
			}
		});	
	});
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
결제가 완료될 때까지 잠시만 기다려주세요.
<form id="paymentSuccess" action="/reservationGoods.do" method="post" target="parentPage" style="visibility: hidden;position: absolute;top: 0;">
	<input id="submitCode" name="code" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitPrdNo" name="prdNo" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitPrdName" name="prdName" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitWeddingDate" name="weddingDate" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitWeddingTime" name="weddingTime" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitTotalPrice" name="totalPrice" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitMemberId" name="memberId" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitMemberName" name="memberName" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitMemberPhone" name="memberPhone" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitMemberEmail" name="memberEmail" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitPayMethod" name="payMethod" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitAmount" name="amount" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitOrderMemo" name="orderMemo" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitOrderAddr" name="orderAddr" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitReceiveName" name="receiveName" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitReceivePhone" name="receivePhone" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitImpUid" name="impUid" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitApplyNum" name="applyNum" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitPaymentDate" name="paymentDate" type="text" style="cursor: inherit;width:10px;" readonly>
</form>
</body>
</html>
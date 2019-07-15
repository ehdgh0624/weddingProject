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

		/* 상황에 따른 PG사 선택 */
		var callPg = null;
		if(payMethod == '신용카드'){
			callPg = "html5_inicis";
		}else if(payMethod == '휴대폰'){
			callPg = "danal";
		}
		/* 상황에 따른 PG사 선택 끝 */
		
		/* 상황에 따른 결제방식 선택 */
		var callPayMethod = null;
		if(payMethod == '신용카드'){
			callPayMethod = "card";
		}else if(payMethod == '무통장'){
			callPayMethod = "vbank";
		}else{
			callPayMethod = "phone";
		}		
		/* 상황에 따른 결제방식 선택 끝 */
		
		/* 무통장 입금기한 */
		var vbankDue = null;
		if(payMethod == '무통장'){
			var year = new Date().getFullYear().toString();
			var month = YYYYMMDDhhmm(new Date().getMonth()+1,2);
			var day = YYYYMMDDhhmm(new Date().getDate()+3,2);
			var hour = YYYYMMDDhhmm(new Date().getHours(),2);
			var minute = YYYYMMDDhhmm(new Date().getMinutes(),2);
			var second = YYYYMMDDhhmm(new Date().getSeconds(),2);
			vbankDue = year+month+day+hour+minute+second;
		}
		function YYYYMMDDhhmm(number, length){
			var str = number.toString();
			while(str.length < length){
				str = '0' + str;
			}
		}			
		/* 무통장 입금기한 */

		/* 결제코드에 사용될 초단위 시간 */
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		var paymentDate = d.getFullYear()+'년 '+(d.getMonth()+1)+'월 '+d.getDate()+'일 '+d.getHours()+'시 '+d.getMinutes()+'분 '+d.getSeconds()+'초';
		/* 결제코드에 사용될 초단위 시간 끝 */
		IMP.init('imp06800707');				//내 가맹점 식별코드
		IMP.request_pay({
			pg: callPg,							//복수 pg 사용 시 : KG이니시스(웹표준방식)
			pay_method : callPayMethod,
			vbank_due : vbankDue,
			merchant_uid : "ID"+date,			//결제ID
			name : prdName,						//결제상품명
			amount : 100,						//결제금액 : 테스트 시 price 지우고 100입력
			buyer_email : memberEmail,			//메일 테스트 시 id 지우고 "자기 메일" 입력
			buyer_name : memberName				//주문자 이름
		},function(rsp){
			if(rsp.success){
				var impUid = null;			//고유ID
				var paidAmount = null;		//결제금액
				var applyNum = 0;			//카드사 승인번호
				
				var vbankNum = null;		//가상계좌 입금 계좌번호
				var vbankName = null;		//가상계좌 은행
				var vbankHolder = null;		//예금주
				var vbankDate = null;		//가상계좌 입금기한
				
				if(payMethod == '신용카드'){
					impUid = rsp.imp_uid;
					paidAmount = rsp.paid_amount;
					applyNum = rsp.apply_num;
				}else if(payMethod == '휴대폰'){
					paidAmount = rsp.paid_amount;
				}else{
					paidAmount = rsp.paid_amount;
					vbankNum = rsp.vbank_num;
					vbankName = rsp.vbank_name;
					vbankHolder = "관리자";
					vbankDate = rsp.vbank_date;
				}
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
				$('#submitBankName').val(vbankName);
				$('#submitBankNum').val(vbankNum);
				$('#submitBankHolder').val(vbankHolder);
				$('#submitBankDate').val(vbankDate);				
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
	<input id="submitBankName" name="bankName" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitBankNum" name="bankNum" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitBankHolder" name="bankHolder" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitBankDate" name="bankDate" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitImpUid" name="impUid" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitApplyNum" name="applyNum" type="text" style="cursor: inherit;width:10px;" readonly>
	<input id="submitPaymentDate" name="paymentDate" type="text" style="cursor: inherit;width:10px;" readonly>
</form>
</body>
</html>
package kr.co.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;				//예약번호
	private String code;					//타입분류
	private int prdNo;						//업체번호, 상품번호
	private Date weddingDate;				//결혼 예정일
	private String weddingTime;				//결혼 예정시각
	private int totalPrice;					//총 가격
	private String memberId;				//예약자 아이디
	private String memberName;				//예약자 이름
	private String memberPhone;				//예약자 연락처
	private String payMethod;				//결제수단
	private int amount;						//구매 수량
	private int orderStatus;				//주문 상태(결제대기=0/결제완료=1/결제취소대기=2/결제취소완료=3)
	private String deliveryNum;				//배송번호(택배)
	private Date orderDate;					//주문날짜
	private String orderMemo;				//주문메모
	private String orderAddr;				//배송예정주소
	private String memberEmail;				//예약자 이메일
	private String receiveName;				//수령인
	private String receivePhone;			//수령인 연락처
	private String bankName;				//은행명
	private String bankNum;					//계좌번호
	private String bankHolder;				//예금주
	private String bankDate;				//입금기한
	private String option1;					//옵션1
	private String option2;					//옵션2
	private String option3;					//옵션3
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int reservationNo, String code, int prdNo, Date weddingDate, String weddingTime, int totalPrice,
			String memberId, String memberName, String memberPhone, String payMethod, int amount, int orderStatus,
			String deliveryNum, Date orderDate, String orderMemo, String orderAddr, String memberEmail,
			String receiveName, String receivePhone, String bankName, String bankNum, String bankHolder,
			String bankDate, String option1, String option2, String option3) {
		super();
		this.reservationNo = reservationNo;
		this.code = code;
		this.prdNo = prdNo;
		this.weddingDate = weddingDate;
		this.weddingTime = weddingTime;
		this.totalPrice = totalPrice;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.payMethod = payMethod;
		this.amount = amount;
		this.orderStatus = orderStatus;
		this.deliveryNum = deliveryNum;
		this.orderDate = orderDate;
		this.orderMemo = orderMemo;
		this.orderAddr = orderAddr;
		this.memberEmail = memberEmail;
		this.receiveName = receiveName;
		this.receivePhone = receivePhone;
		this.bankName = bankName;
		this.bankNum = bankNum;
		this.bankHolder = bankHolder;
		this.bankDate = bankDate;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}
	public Date getWeddingDate() {
		return weddingDate;
	}
	public void setWeddingDate(Date weddingDate) {
		this.weddingDate = weddingDate;
	}
	public String getWeddingTime() {
		return weddingTime;
	}
	public void setWeddingTime(String weddingTime) {
		this.weddingTime = weddingTime;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getDeliveryNum() {
		return deliveryNum;
	}
	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public String getOrderAddr() {
		return orderAddr;
	}
	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getReceivePhone() {
		return receivePhone;
	}
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankNum() {
		return bankNum;
	}
	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}
	public String getBankHolder() {
		return bankHolder;
	}
	public void setBankHolder(String bankHolder) {
		this.bankHolder = bankHolder;
	}
	public String getBankDate() {
		return bankDate;
	}
	public void setBankDate(String bankDate) {
		this.bankDate = bankDate;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	
}
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

		<div id="myPageContainer" class="clearfix area">
		 <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/searchReser.do" method="get">
               <select name="select" id="select"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
                  <option value="0">==선택==</option>
                  <option value="1">회원</option>
                  <option value="2">결제상태</option>
                  <option value="3">배송상태</option>
               </select>
               <select name="type" id="type"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
					
               </select>
               <input placeholder="검색어를 입력해주세요." type="search" name="keyword" class="search-word" id="searchInput"value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
         <br><br><br><br>
		<table class=comm-tbl>
			<colgroup>
				<col width="2%">
				<col width="8%">
				<col width="5%">
				<col width="4%">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="8%">
				<col width="8%">
				<col width="7%">
			</colgroup>
			<tr>
				<th>NO</th>
				<th>상품번호/<br>상품이름</th>
				<th>구매수량</th>
				<th>총가격</th>
				<th>예약자 아이디/<br>이름</th>
				<th>배송지 주소</th>
				<th>결제수단</th>
				<th>결제상태</th>
				<th>배송상태</th>
				<th>주문날짜</th>
				<th>운송장 번호</th>
				<th>수정</th>
			</tr>
			<c:forEach items="${ar.list }" var="r" >
				<tr>
					<td>${r.reservationNo }</td>
					<td>${r.prdNo } / ${r.prdName}  </td>
					<td>${r.amount } 개</td>
					<td>${r.totalPrice }</td>
					<td>${r.memberId } / ${r.memberName } </td>
					<td>${r.orderAddr } </td>
					<td>${r.payMethod } </td>
					<c:choose>
						<c:when test="${r.orderStatus == 0 }">
							<td class="os">결제 대기</td>
						</c:when>
						<c:when test="${r.orderStatus == 1}">
							<td class="os">결제 완료</td>
						</c:when>
						<c:when test="${r.orderStatus == 2 }">
							<td class="os">결제 취소 <br>대기</td>
						</c:when>
						<c:when test="${r.orderStatus == 3 }">
							<td class="os">결제 취소</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${r.deliveryStatus == 0 }">
							<td class="ds">상품 준비중</td>
						</c:when>
						<c:when test="${r.deliveryStatus == 1 }">
							<td class="ds">발송 준비중</td>
						</c:when>
						<c:when test="${r.deliveryStatus == 2 }">
							<td class="ds">배송중</td>
						</c:when>
						<c:when test="${r.deliveryStatus == 3 }">
							<td class="ds">배송 완료</td>
						</c:when>
					</c:choose>
					<td>${r.orderDate} </td>
					<td class="dn">${r.deliveryNum} </td>
					<td><button type="button"  class="delete-btn">수정</button><button type="button" id="ok" class="ok-btn" style="display: none;" title="${r.reservationNo }">완료</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">${ar.pageNavi}</div>
		 
	</div>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>
<script>
	$(".delete-btn").each(function(){
		$(this).on("click",function(){
			$(this).hide();
			$(this).next().show();
			$(this).parent().siblings('.dn').html("")	
			$(this).parent().siblings('.dn').append("<input type='text' naem='dn'>")
			$(this).parent().siblings('.ds').html("")	
			$(this).parent().siblings('.ds').append("<select name='ds'> <option value='0'>상품 준비중</option><option value='1'>발송 준비중</option><option value='2'>배송중</option><option value='3'>배송완료</option> </select>")	
			$(this).parent().siblings('.os').html("")	
			$(this).parent().siblings('.os').append("<select name='ds'> <option value='0'>결제 대기</option><option value='1'>결제 완료</option><option value='2'>결제 취소 대기</option><option value='3'>결제완료</option> </select>")	
		});
	});
	$(".ok-btn").each(function(){
		$(this).on("click",function(no){
			var reserNo = $(this).attr("title");
			var dn = $(this).parent().siblings('.dn').children().val();
			var ds = $(this).parent().siblings('.ds').children().val();
			var os = $(this).parent().siblings('.os').children().val();
			
			location.href="/reservationUpdate.do?reservationNo="+reserNo+"&deliveryNum="+dn+"&deliveryStatus="+ds+"&orderStats="+os;
		});
	});
	$("#select").change(function(){
		if($("#select").val() == 1){
			$("#type").html("");
			$("#type").append("<option value='0'>아이디</option><option value='1'>이름</option>");
			$("#searchInput").attr("placeholder","검색어를 입력해주세요.")
		}else if($("#select").val() == 2){
			$("#type").html("");
			$("#type").append("<option value='0'>결제대기</option><option value='1'>결제완료</option><option value='2'>결제취소대기</option><option value='3'>결제취소</option>");
			$("#searchInput").attr("placeholder","아이디를 입력해주세요.")
			
		}else if($("#select").val() == 3){
			$("#type").html("");
			$("#type").append("<option value='0'>상품준비중</option><option value='1'>배송준비중</option><option value='2'>배송중</option><option value='3'>배송완료</option>");
			$("#searchInput").attr("placeholder","아이디를 입력해주세요.")
		}
	});
	$(document).ready(function(){
		var select = "${param.select}";
		var type = "${param.type}";
		if(select == 1){
			$("#select").children().eq(1).attr("selected",true);
			if(type == 0){
				$("#type").append("<option value='0' selected>아이디</option><option value='1'>이름</option>");
			}else if(type == 1){
				$("#type").append("<option value='0' >아이디</option><option value='1' selected>이름</option>");
			}
		}else if(select == 2){
			$("#select").children().eq(2).attr("selected",true);
			if(type == 0){
				$("#type").append("<option value='0' selected>결제대기</option><option value='1'>결제완료</option><option value='2'>결제취소대기</option><option value='3'>결제취소</option>");
			}else if(type == 1){
				$("#type").append("<option value='0' >결제대기</option><option value='1' selected>결제완료</option><option value='2'>결제취소대기</option><option value='3'>결제취소</option>");
			}else if(type == 2){
				$("#type").append("<option value='0' >결제대기</option><option value='1' >결제완료</option><option value='2' selected>결제취소대기</option><option value='3'>결제취소</option>");
			}else if(type == 3){
				$("#type").append("<option value='0' >결제대기</option><option value='1' >결제완료</option><option value='2'>결제취소대기</option><option value='3' selected>결제취소</option>");
			}
		}else if(select == 3){
			$("#select").children().eq(3).attr("selected",true);
			if(type == 0){
				$("#type").append("<option value='0' selected>상품준비중</option><option value='1'>배송준비중</option><option value='2'>배송중</option><option value='3'>배송완료</option>");
			}else if(type == 1){
				$("#type").append("<option value='0'>상품준비중</option><option value='1' selected>배송준비중</option><option value='2'>배송중</option><option value='3'>배송완료</option>");
			}else if(type == 2){
				$("#type").append("<option value='0'>상품준비중</option><option value='1'>배송준비중</option><option value='2' selected>배송중</option><option value='3'>배송완료</option>");
			}else if(type == 3){
				$("#type").append("<option value='0'>상품준비중</option><option value='1'>배송준비중</option><option value='2'>배송중</option><option value='3' selected>배송완료</option>");
			}
		}
	});
</script>

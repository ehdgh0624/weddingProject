<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<div>
			<!-- 상품명 table -->
			<table style="width: 100%;">
				<tr>
					<!-- 이전페이지 -->
					<td rowspan="2" style="width: 80px; height: 80px;">
						<button style="width: 60px; height: 60px; background-color: lightgray; border-radius: 2px;">이전</button>
					</td>
					<!-- 상품명 -->
					<td><span style="font-size: 28px;">${goods.goodsName}</span></td>
					<!-- 스크랩북 -->
					<td style="float: right;">
						<c:choose>
							<c:when test="${not empty scrapbook}">
								<button class="scrapStar" id="${goods.goodsNo}" name="${goods.code}">
									<img src="/resources/img/star_b2.png" style="width: 30px; height: 30px;">
								</button>
							</c:when>
							<c:otherwise>
								<button class="defaultStar" id="${goods.goodsNo}" name="${goods.code}">
									<img src="/resources/img/star_b1.png" style="width: 30px; height: 30px;">
								</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<!-- 별점 -->
					<td>
						<span style="vertical-align: middle;font-size: 18px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${goods.goodsScope}.png" style="height:18px;vertical-align: middle;">
					</td>
				</tr>
			</table>
			<!-- 상호명 테이블 끝 -->
			<br>
			<!-- 사진 carousel -->
			<div>
				<div style="max-width: 1200px; height: 600px; background-color: pink; border-radius: 3px; overflow: hidden;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 0; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 4px 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
				<div style="width: 190px; height: 120px; background-color: pink; margin: 8px 0 8px 4px; display: inline-block; overflow: hidden; border-radius: 3px;">
					<img src="/resources/img/test_img2.jpg" style="width: 100%;">
					<!-- 이미지 경로로 대체할 예정 -->
				</div>
			</div>
			<!-- 사진 carousel 끝 -->
			<br> <br> <br>
			<!-- 상세설명, 리뷰가 포함된 content 시작 -->
			<div style="position: relative;">
				<!-- 왼쪽 상세설명, 리뷰, 지도 -->
				<div style="width: 70%; display: inline-block;">
					<h2>상세설명</h2>
					<hr>
					${goods.goodsContent}
					<br> <br> <br>
					<h2>가격확인 및 결제 진행</h2>
					<br>

					<form>
						<table class="comm-tbl">
							<colgroup>
								<col width="30%">
								<col width="/">
							</colgroup>
							<tr>
								<th>예식일</th>
								<td colspan="2">
									<input type="text" name="weddingDate" id="weddingDate" class="datepicker wedding-date middle" placeholder="예식일을 선택해주세요" required>
								</td>
							</tr>
							<tr>
								<th>예식시간</th>
								<td colspan="2">
									<select name="weddingTime" id="weddingTime">
										<option value="default">::: 예식 시작 시간 선택 :::</option>
										<option>AM 11:00</option>
										<option>AM 11:30</option>
										<option>PM 12:00</option>
										<option>PM 12:30</option>
										<option>PM 1:00</option>
										<option>PM 1:30</option>
										<option>PM 2:00</option>
										<option>PM 2:30</option>
										<option>PM 3:00</option>
										<option>PM 3:30</option>
										<option>PM 4:00</option>
										<option>PM 4:30</option>
										<option>PM 5:00</option>
										<option>PM 5:30</option>
										<option>PM 6:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="2" style="text-align: center;">부케 주문제작</th>
							</tr>
							<tr>
								<th>상품명</th>
								<td>${goods.goodsName}</td>
							</tr>
							<tr>
								<th>주문 수량 입력</th>
								<td>
									<span id="goodsPrice">${goods.goodsPrice}</span>원
									x
									<input id="goodsAmount" type="number" value="1" min="1" style="width:50px;">다발
								</td>
							</tr>
							<tr>
								<th colspan="2">
									총계
									<span style="float: right;"><span id="allPrice"></span>원</span>								
								</th>
							</tr>
						</table>
						<div class="common-tbl-btn-group">
							<button class="btn-style1" type="button" onclick="reservation();">결제 진행</button>
						</div>
					</form>

					<br> <br> <br>
					<h2>후기 및 Q&A</h2>
					<hr>
				</div>
				<!-- 상세설명, 리뷰, 지도 끝 -->
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함된  position: static;-->
				<div
					style="position: static; background-color: pink; width: 28%; height: 500px; float: right;"></div>
				<!-- static 끝 -->
			</div>
		</div>
	</div>
</section>
<script>

	/* 페이지 로드 시 이벤트 */
	$(document).ready(function(){
		/* 페이지 로드 시 총계 변경 */
		var allPrice = parseInt($('#goodsPrice').text()) * $('#goodsAmount').val();
		$('#allPrice').text(allPrice);
		/* 페애지 로드 시 총계 변경 끝 */
	});
	/* 페이지 로드 시 이벤트 끝 */
		
	/* amount 변경 시 이벤트 */
	$('#goodsAmount').on("change",function(){
		if($('#goodsAmount').val() == '' || $('#goodsAmount').val() == 0){
			$('#goodsAmount').val('1');
		}
		var allPrice = parseInt($('#goodsPrice').text()) * $('#goodsAmount').val();
		$('#allPrice').text(allPrice);		
	});
	$('#goodsAmount').on("keyup",function(){
		if($('#goodsAmount').val() == '' || $('#goodsAmount').val() == 0){
			$('#goodsAmount').val('1');
		}
		var allPrice = parseInt($('#goodsPrice').text()) * $('#goodsAmount').val();
		$('#allPrice').text(allPrice);				
	});
	/* amount 변경 시 이벤트 끝 */
	
	/* 버튼 클릭 시 결제정보 페이지로 이동 */
	function reservation(){
		if($('#weddingTime option:selected').val() == 'default'){
			alert("예식 시작 시간을 선택해주세요.");
		}else{
			if($('#goodsAmount').val() == '' || $('#goodsAmount').val() == 0){
				alert("수량을 하나 이상 입력해주세요.");
			}else{
				submitReservation();											
			}
		}
	}
	
	function submitReservation(){
		var code = "G";
		var prdNo = ${goods.goodsNo};
		var prdName = '${goods.goodsName}';
		var weddingDate = $('#weddingDate').val().replace(/-/gi,'/');
		var weddingTime = $('#weddingTime option:selected').val();
		var totalPrice = $('#allPrice').text();
		var amount = $('#goodsAmount').val();
		$.ajax({
			url : "/perInfo.do",
			data : {code:code,prdNo:prdNo,prdName:prdName,weddingDate:weddingDate,weddingTime:weddingTime,totalPrice:totalPrice,amount:amount},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("예약을 완료했습니다. 주문장으로 이동합니다.");
					location.href="/reservationView.do?reservationNo="+data;
				}else if(data == -1){
					alert("로그인 후 다시 시도해주세요.");
					location.href="/loginPage.do";
				}else{
					alert("지금은 예약할 수 없습니다.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});		
	}
	/* 버튼 클릭 시 결제정보 페이지로 이동 끝 */
	
	
	/* 옵션 select 박스 change 시 가격 변경 */
	$('.studioSelectOption').on("change",function(){
		var allPrice = 0;
		if($('#option1 option:selected').val() != 'default'){
			allPrice += parseInt($('#option1 option:selected').val());
		}
		if($('#option2 option:selected').val() != 'default'){
			allPrice += parseInt($('#option2 option:selected').val());			
		}
		if($('#option3 option:selected').val() != 'default'){
			allPrice += parseInt($('#option3 option:selected').val());
		}
		console.log($('#option1 option:selected').text().substring(0,$('#option1 option:selected').text().indexOf("(")));
		$('#allPrice').text(allPrice);
	});
	/* 옵션 select 박스 change 시 가격 변경 끝 */	
	
	/* 스크랩북 on/off */
	$(document).on("click",".defaultStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOn.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){					
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">');
					select.addClass('scrapStar');
					select.removeClass('defaultStar');
					alert("스크랩북에 추가되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	$(document).on("click",".scrapStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOff.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">');
					select.removeClass('scrapStar');
					select.addClass('defaultStar');
					alert("스크랩북에서 삭제되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");					
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	/* 스크랩북 on/off 끝 */	
	
	</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
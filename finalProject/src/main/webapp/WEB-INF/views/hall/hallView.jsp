<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp" />

<link href="dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css">
<script src="dist/js/datepicker.min.js"></script>

<!-- Include English language -->
<script src="dist/js/i18n/datepicker.en.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/hallView.css">
<!-- font awesome -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
	<%-- 네이버 지도 API --%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<section class="hallView">
			<div>
			<!-- 상호명 table -->
			<table style="width: 100%;">
				<tr>
					<!-- 이전페이지 -->
					<td rowspan="2" style="width: 80px; height: 80px;">
						<button style="width: 60px; height: 60px; background-color: lightgray; border-radius: 2px;">이전</button>
					</td>
					<!-- 상호명 -->
					<td><span style="font-size: 28px;">${hall.hallName}</span></td>
					<!-- 스크랩북 -->
					<td style="float: right;">
						<c:choose>
							<c:when test="${not empty scrapbook}">
								<button class="scrapStar" id="${hall.hallNo}" name="${hall.code}">
									<img src="/resources/img/star_b2.png" style="width: 30px; height: 30px;">
								</button>
							</c:when>
							<c:otherwise>
								<button class="defaultStar" id="${hall.hallNo}" name="${hall.code}">
									<img src="/resources/img/star_b1.png" style="width: 30px; height: 30px;">
								</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<!-- 상세주소 -->
					<td>
						<a style="font-size: 15px;" href="#map">${hall.hallAddr}</a>
					</td>
				</tr>
			</table>
			<!-- 상호명 테이블 끝 -->
			<br>
			<!-- 사진 carousel -->
			<div class="view-gallery-slide">
			<!-- 큰 이미지 영역 -->
			<ul class="view-big-gallery-list slider-for">
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
			</ul>
			<!-- 작은 이미지 영역 -->
			<ul class="view-small-gallery-list slider-nav">
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
				<li><img src="/resources/img/test_img2.jpg"></li>
			</ul>
		</div>
			<!-- 사진 carousel 끝 -->
			<br> <br> <br>
			<!-- 상세설명, 리뷰, 지도가 포함된 content 시작 -->
			<div style="position: relative;">
				<!-- 왼쪽 상세설명, 리뷰, 지도 -->
				<div style="width: 70%; display: inline-block;">
					<h2>상세설명</h2>
					<hr>
					${hall.hallContent} <br> <br> <br>
					<c:if
						test="${not empty hall.hallTime || not empty hall.hallServiceFood || not empty hall.hallServiceAudio || not empty hall.hallServiceDrink || not empty hall.hallServicePark}">
						<h2>운영정책</h2>
						<br>
						<table class="comm-tbl">
							<colgroup>
								<col width="30%">
								<col width="/">
							</colgroup>
							<c:if test="${not empty hall.hallTime}">
								<tr>
									<th>운영시간</th>
									<td>${hall.hallTime}</td>
								</tr>
							</c:if>
							<c:if test="${not empty hall.hallServiceFood}">
								<tr>
									<th>음식</th>
									<td>${hall.hallServiceFood}</td>
								</tr>
							</c:if>
							<c:if test="${not empty hall.hallServiceAudio}">
								<tr>
									<th>음향</th>
									<td>${hall.hallServiceAudio}</td>
								</tr>
							</c:if>
							<c:if test="${not empty hall.hallServiceDrink}">
								<tr>
									<th>주류</th>
									<td>${hall.hallServiceDrink}</td>
								</tr>
							</c:if>
							<c:if test="${not empty hall.hallServicePark}">
								<tr>
									<th>주차</th>
									<td>${hall.hallServicePark}</td>
								</tr>
							</c:if>
						</table>
					</c:if>
					<br> <br> <br>
					
					<h2>가격확인 및 예약문의</h2>
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
									<div class="input-group w-40">
											<input type="text" name="hallTime" id="hallTime"
												class="form-control time_element" /> <span
												class="input-group-btn ui-datepicker-trigger">

											</span>
										</div>
								</td>
							</tr>
							<tr>
								<th colspan="3" style="text-align: center;">예약 옵션</th>
							</tr>
							<tr>
									<th rowspan="4">기본 옵션</th>
									<th>예식장
									<td>
									<select id="hallOption">
										<option value="default">옵션</option>
										<c:forEach items="${hallSelect}" var="hs">
											<option value="${hs.hallSelectNo }" id="hoption">${hs.hallType }</option>
										</c:forEach>
									</select>
									
									</td>
									</th>
								</tr>
								<tr>
									<th>대관료</th>
									<td><span id="price"></span>원</td>
								</tr>
								<tr>
									<th>비고</th>
									<td id="etc"></td>
								</tr>
							<tr>
								<th>하객수</th>
								<td><input type="text" id="hallPerson" name="hallPerson" placeholder="하객수를 입력하세요."> <span id="personSpan"></span></td>
							</tr>
							<tr>
									<th id="makeupOption-th" rowspan="1">부가 옵션</th>
									<th>식사</th>
									<td colspan="2">
										<c:if test="${not empty hall.hallFoodtype }">
											<c:if test="${hall.hallFoodtype == 0 }">
												메뉴 : x
											</c:if>
											<c:if test="${hall.hallFoodtype == 1 }">
												메뉴 : 한식
											</c:if>
											<c:if test="${hall.hallFoodtype == 2 }">
												메뉴 : 일식
											</c:if>
											<c:if test="${hall.hallFoodtype == 3 }">
												메뉴 : 중식
											</c:if>
											<c:if test="${hall.hallFoodtype == 4 }">
												메뉴 : 양식
											</c:if>
											<c:if test="${hall.hallFoodtype == 5 }">
												메뉴 : 뷔페
											</c:if>
										</c:if>
										<span style="float: right;">식권 가격 (인당) : <span id="option2Price">${hall.hallFoodprice }</span>원</span>
										<br>
										<span style="float: right;">식권 수량 : <input type="number" min="${hall.hallMinPerson }" max="${hall.hallMaxPerson }" value="0" id="option2Amount" onchange="checkAmount();"></span>
									</td>
								</tr>
								<tr>
								<th colspan="3">
									총계
									<span style="float: right;"><span id="allPrice"></span>원</span>								
								</th>
							</tr>
						</table>
						<div class="common-tbl-btn-group">
							<button class="btn-style1" type="button" onclick="reservation();">예약하기</button>
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


		<!-- 지도 위치 -->
		<div id="map" style="float: left; margin-left: 20px; width: 800px; height: 300px; margin-bottom: 50px;"></div>
		</section>
	</div>
</section>

<script>
	$(document)
			.ready(
					function() {
						//로드 시 대관료 초기화
						$('#price').text(0);

						// 갤러리 슬라이드
						$('.slider-for')
								.slick(
										{
											slidesToShow : 1,
											slidesToScroll : 1,
											arrows : true,
											fade : false,
											prevArrow : '<button type="button" data-role="none" class="slick-prev" aria-label="Prev" tabindex="0" role="button"><img src="/resources/img/left_arrow.png"></button>',
											nextArrow : '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><img src="/resources/img/right_arrow.png"></button>',
											asNavFor : '.slider-nav'
										});
						$('.slider-nav').slick({
							slidesToShow : 4,
							slidesToScroll : 1,
							asNavFor : '.slider-for',
							dots : false,
							centerMode : false,
							focusOnSelect : true
						});
					});
	
	/* 예약 클릭시 조건 확인 시작*/
	
	function reservation(){
		if($('#hallTime').val() == ''){
			alert("예식 시간을 선택해주세요.");
		}else if($("#hallOption option:selected").val() == 'default'){
			alert("기본옵션을 선택해주세요.");
		}else if($("#hallPerson").val() == ''){
			alert("하객수를 입력해주세요.")
		}else if($("#option2Amount").val() == 0){
			alert("식권 수량을 입력하세요.");
		}else if(${hall.hallMinPerson} > $("#hallPerson").val() && $("#hallPerson").val() < ${hall.hallMaxPerson}){
			$('#personSpan').text(${hall.hallMinPerson}+"명 이상 ~"+${hall.hallMaxPerson}+"명 이하로 입력하세요.");
			$('#personSpan').css('color','red');
		}else {
			$('#personSpan').text('');
			submitReservation();
			
		};	// if close;	
	}; // function close;
	
	/* 예약 클릭시 조건 확인 종료*/
	
	/* 예약 데이터 등록하기 시작*/
	
	function submitReservation(){
		var code = "H";		//고유코드
		var prdNo = ${hall.hallNo};		//고유번호
/* 		var prdId = '${hall.memberId}';	//아이디 */
		var prdId = 'test1';
		var prdName = '${hall.hallName}';//아이디 이름
		var weddingDate = $('#weddingDate').val().replace(/-/gi,'/'); // 예약 날짜
		var weddingTime = $('#hallTime').val();	//예약 시간
		var totalPrice = parseInt($('#allPrice').text().replace(/,/gi,''));	// 에약 총액
		var price = parseInt($("#price").text().replace(/,/gi,''));
		var person = $("#hallPerson").val();
		var foodType = ${hall.hallFoodtype};
		var foodCount = $("#option2Amount").val();
		var option = $("#hoption").text();
		alert("가보자!");
		$.ajax({
			url : "/reservationHall.do",
			data : {code:code,prdNo:prdNo,prdId:prdId,prdName:prdName,weddingDate:weddingDate,weddingTime:weddingTime,totalPrice:totalPrice,price:price,person:person,foodType:foodType,foodCount:foodCount,option:option},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("예약을 완료했습니다. 주문장으로 이동합니다.");
					location.href="/hall.do";
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
		});		//ajax close;
	};	//function close;
	
	/* 에약 데이터 등록하기 종료*/
	
	/* 식권 수량 변경 시 총계 변경 시작 */
	
	function checkAmount(){
		var food = ${hall.hallFoodprice };
		var price = parseInt($('#price').text());
		var num = parseInt($("#option2Amount").val());
		var total = food * num;
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		var result = (price+total).toString().replace(regexp,',');	// 음식의 값 + 수량 = 총계 , 나누기
		if($('#option2Amount').prop('checked') == false){
			$('#allPrice').text(result);	
		}
			
	}
	
	/* 식권 수량 변경 시 총계 변경 끝 */
	
	
	/*옵션 선택시 대관료 비고 바꾸기 시작*/
	
	$("#hallOption").change(function(){
		var result = $(this).val();
		var amount = parseInt($("#option2Amount").val());
		var food = parseInt($('#option2Price').text());
		var total = food * amount;
		if($("#hallOption option:selected").val() != 'default'){
			$.ajax({
				url : "/hallOption.do",
				type : "get",
				data : {result:result},
				dataType : "json",
				async: false,
				success : function(data){
					var price = data.hallSelectPrice;
					$("#price").text(price);
					$("#etc").text(data.hallSelectEtc);	
					$('#allPrice').text((price+total).toString().replace(/\B(?=(\d{3})+(?!\d))/g,','));
				},
				error : function(){
					alert("다시!!!")
				}
			});
		}else{
			var price = 0;
			$("#price").text(price);
			$('#allPrice').text((price+total).toString().replace(/\B(?=(\d{3})+(?!\d))/g,','));			
		}	// #hallOptionn 이프문
	});
	
	/*옵션 선택시 대관료 비고 바꾸기 끝*/
	
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

<script src="/resources/js/timepicki/timepicki.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/timepicki/timepicki.css">
<script>
	$(document).ready(function() {
		$(".time_element").timepicki();
	});
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />
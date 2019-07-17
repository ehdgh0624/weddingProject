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
	href="/resources/css/myHall.css">
<!-- font awesome -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
	<%-- 네이버 지도 API --%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<section class="hallView area">
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
					<!-- 리뷰 출력 -->
					<h2>후기 및 Q&A</h2>
					<hr>
					<div style="text-align: center;">
						<span style="color:orange;font-size: 80px;vertical-align: middle;margin-right:30px;">${hall.scope/2}</span>
						<img src="/resources/img/scope-star/scope-star${hall.scope}.png" style="vertical-align: middle;">
					</div>
					<hr>
					<c:if test="${not empty reviewList}">
						<c:forEach items="${reviewList}" var="r">
							<div>
								<div style="width:10%;float: left;">
									<div style="width:80px;height:80px;border-radius: 80px;background-color: orange;display: inline-block;"></div>																
								</div>
								<div style="width:90%;display: inline-block;">
									<span style="font-size: 16px;font-weight: bolder;">${r.reviewWriter}</span>
									<span>[작성일 : ${r.reviewDate}]</span>
									<span style="float: right;">
										<span style="font-size: 15px;vertical-align: middle;">평점 | </span><img src="/resources/img/scope-star/scope-star${r.reviewScope}.png" style="height:15px;vertical-align: middle;">
									</span>
									<br>
									<br>
									<div style="width:100%;height:120px;overflow: hidden;display: inline-block;">
										<img src="/resources/img/test_img4.jpg">
									</div>
									<br>
									<br>
									<span style="font-weight: bolder;">[이용후기]</span>
									<span>${r.reviewContent}</span>
								</div>
							</div>
							<br>
							<hr>
						</c:forEach>
					</c:if>
					<!-- 리뷰 출력 끝 -->
					
					<!-- 리뷰 입력 -->
					<form id="fileUploadForm" action="/fileUpload.do" method="post" enctype="multipart/form-data">
						<div style="visibility: hidden;position: absolute;top:0;">
							<input type="text" id="code" name="code" value="H" style="cursor: inherit;width:10px;" readonly>
							<input type="text" id="reviewRef" name="reviewRef" style="cursor: inherit;width:10px;" readonly>
							<input type="text" id="reviewScope" name="reviewScope" style="cursor: inherit;width:10px;" readonly>
						</div>
						<div id="reviewWrite" style="display: none;">
							<!-- 별점(위치 개별이동 금지) -->
							<div>
								<div style="font-size: 16px;line-height: 25px;">총평</div>
								<img id="reviewScopeStar" src="/resources/img/scope-star/scope-star10.png" usemap="#imgmap20197162448" style="vertical-align: middle;height:30px;">
								<map id="imgmap20197162448" name="imgmap20197162448">
									<area shape="rect" coords="161,1,176,42" id="scope-star10" onmouseover="reviewScopeStar(10);" />
									<area shape="rect" coords="145,1,160,42" id="scope-star9" onmouseover="reviewScopeStar(9);" />
									<area shape="rect" coords="125,1,140,42" id="scope-star8" onmouseover="reviewScopeStar(8);" />
									<area shape="rect" coords="109,1,124,42" id="scope-star7" onmouseover="reviewScopeStar(7);" />
									<area shape="rect" coords="89,1,104,42" id="scope-star6" onmouseover="reviewScopeStar(6);" />
									<area shape="rect" coords="73,1,88,42" id="scope-star5" onmouseover="reviewScopeStar(5);" />
									<area shape="rect" coords="53,1,68,42" id="scope-star4" onmouseover="reviewScopeStar(4);" />
									<area shape="rect" coords="37,1,52,42" id="scope-star3" onmouseover="reviewScopeStar(3);" />
									<area shape="rect" coords="17,1,32,42" id="scope-star2" onmouseover="reviewScopeStar(2);" />
									<area shape="rect" coords="1,1,16,42" id="scope-star1" onmouseover="reviewScopeStar(1);" />
								</map>
								<span style="vertical-align: middle;font-size:16px;"><span id="starScore">5</span>점</span>
							</div>
							<!-- 별점 끝 -->
							
							<br>
							<br>
							<br>
							<div>
								<div>후기 이미지를 등록해보세요(최대 5장)</div>
								<br>
								<div style="width:100%;border-radius: 5px;border:2px solid aliceblue;box-sizing: border-box;">
									<label id="uploadLabel" for="reviewImageUpload">
										<div style="width:100%;background-color: aliceblue;padding:15px;box-sizing: border-box;float: left;font-size: 16px;cursor: pointer;">
											사진업로드 (여기를 클릭하세요★)<input multiple="multiple" type="file" class="reviewImageUpload" id="reviewImageUpload" name="uploadFile" style="width:400px;cursor: pointer;visibility: hidden;">
										</div>
									</label>
									<br>
									<br>
									<br>
									<div style="padding:20px;box-sizing: border-box;">
										<img alt="" src="" id="img1" style="max-width:150px;max-height:100px;margin:3px;">
										<img alt="" src="" id="img2" style="max-width:150px;max-height:100px;margin:3px;">
										<img alt="" src="" id="img3" style="max-width:150px;max-height:100px;margin:3px;">
										<img alt="" src="" id="img4" style="max-width:150px;max-height:100px;margin:3px;">
										<img alt="" src="" id="img5" style="max-width:150px;max-height:100px;margin:3px;">
										<span id="notImg">업로드 된 사진이 없어요 :)</span>
									</div>
								</div>
							</div>
							
							<br>
							<br>
							<br>
							<div>
								<div style="font-size:16px;">여러분이 남겨주신 리뷰는 큰 도움이 됩니다.</div>
								<br>
								<textarea id="reviewContent" name="reviewContent" style="width:100%;height:150px;box-sizing: border-box;padding:20px;border-radius: 5px;border:2px solid aliceblue;" placeholder="이곳에 후기를 남겨주세요."></textarea>
							</div>
						</div>
						
						<br><br><br>
						<div style="background-color:aliceblue;width:100%;border-radius: 5px;padding:20px;line-height: 30px;box-sizing: border-box;">
							<div style="font-size: 25px;font-weight: bolder;">#후기 남기면 혜택 팡팡!</div>
							<div style="font-size: 15px;line-height: 20px;">
								- 방문/예약문의 후기 건당 1,000원
								<br>
								- 사진없는 실제 웨딩후기 건당 1,000원						
								<br>
								- 사진있는 실제웨딩후기 건당 2,000원
								<br>
								#5,000원 이상 적립하고 현금으로 환급해보세요!
							</div>
						</div>
						<div class="common-tbl-btn-group">
							<button id="reviewWriteBtn" class="btn-style1" type="button" style="width:80%;" onclick="reviewShow();">♥ 후기 쓰고 혜택받자!</button>
						</div>
					</form>
					<!-- 리뷰 입력 끝 -->
					<br> <br> <br>
					<h2>위치</h2>
					<hr>
					<!-- 지도 위치 -->
					<div id="map" style="float: left; margin-left: 20px; width: 800px; height: 300px; margin-bottom: 50px;"></div>
					<!-- 상세설명, 리뷰, 지도 끝 -->
				</div>
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함된  position: static;-->
				<div style="position: static; background-color: pink; width: 28%; height: 500px; float: right;"></div>
				<!-- static 끝 -->
				</div>
			</div>
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
	
	/* 이미지 업로드 시 미리보기 */
	$(document).ready(function(){
		if($("#img1").attr("src") == "" && $("#img2").attr("src") == "" && $("#img3").attr("src") == "" && $("#img4").attr("src") == "" && $("#img5").attr("src") == ""){
			$('#notImg').show();
			$('#img1').hide();
			$('#img2').hide();
			$('#img3').hide();
			$('#img4').hide();
			$('#img5').hide();
		}
		$(document).on("change",".reviewImageUpload", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		$('#notImg').show();
		$('#img1').attr('src', '');
		$('#img2').attr('src', '');
		$('#img3').attr('src', '');
		$('#img4').attr('src', '');
		$('#img5').attr('src', '');
		if($('#reviewImageUpload')[0].files.length > 5){
			alert("파일 수가 너무 많습니다.");
			$('#reviewImageUpload')[0].remove();
			$('#fileUploadForm').append('<input multiple="multiple" type="file" class="reviewImageUpload" id="reviewImageUpload" name="uploadFile" style="width:400px;cursor: pointer;visibility: hidden;">');
		}else{
			$('#notImg').hide();
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e){
	
					if($('#img1').attr('src') == ""){
						$('#img1').attr('src', e.target.result);
						$('#img1').show();
					}else if($('#img2').attr('src') == ""){
						$('#img2').attr('src', e.target.result);
						$('#img2').show();
					}else if($('#img3').attr('src') == ""){
						$('#img3').attr('src', e.target.result);
						$('#img3').show();
					}else if($('#img4').attr('src') == ""){
						$('#img4').attr('src', e.target.result);
						$('#img4').show();
					}else if($('#img5').attr('src') == ""){
						$('#img5').attr('src', e.target.result);
						$('#img5').show();
					}
				}
				reader.readAsDataURL(f);
			})
		}
	}
	/* 이미지 업로드 시 미리보기 끝 */
	/* 총평 별점 위에 마우스 over 시 별점 바뀜 */
	function reviewScopeStar(scopeStar){
		$('#reviewScopeStar').prop("src","/resources/img/scope-star/scope-star"+scopeStar+".png");
		$('#starScore').text(scopeStar/2);
	}
	/* 총평 별점 위에 마우스 over 시 별점 바뀜 */

	/* 리뷰쓰기 버튼 클릭 시 리뷰 input창 열리거나 submit */
	function reviewShow(){
		if(${sessionScope.member != null}){
			if($('#reviewWrite').css('display') == 'none'){
				$('#reviewWrite').show();
				$('#reviewWriteBtn').text("♥ 후기 저장");				
			}else{
				if($('#reviewContent').val() == ''){
					alert("리뷰 내용을 작성해주세요.");
				}else{
					var reviewRef = ${hall.hallNo};
					var reviewScope = $('#starScore').text() * 2;
					$('#reviewRef').val(reviewRef);
					$('#reviewScope').val(reviewScope);
					$('#fileUploadForm').submit();					
				}
			}
		}else{
			alert("로그인 후 다시 시도해주세요.");
			location.href="/loginPage.do";
		}
	}
	/* 리뷰쓰기 버튼 클릭 시 리뷰 input창 열리거나 submit 끝 */
	
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
		$.ajax({
			url : "/reservationHall.do",
			data : {code:code,prdNo:prdNo,prdId:prdId,prdName:prdName,weddingDate:weddingDate,weddingTime:weddingTime,totalPrice:totalPrice,price:price,person:person,foodType:foodType,foodCount:foodCount,option:option},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("예약을 완료했습니다. 주문장으로 이동합니다.");
					location.href="/myHall.do";
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
			url : "/hscrapOn.do",
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
			url : "/hscrapOff.do",
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
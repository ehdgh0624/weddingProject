<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<%-- 우편번호 찾기 API --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	/* 페이지 로드 시 input number 화살표 버튼 제거 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
    }
	/* 페이지 로드 시 input number 화살표 버튼 제거 끝 */
</style>
<script>
	$(document).ready(function(){
		// 갤러리 슬라이드
	    $('.slider-for').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  arrows: true,
		  fade: false,
		  prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Prev" tabindex="0" role="button"><img src="/resources/img/left_arrow.png"></button>',
		  nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><img src="/resources/img/right_arrow.png"></button>',
		  asNavFor: '.slider-nav'
		});
	    
		$('.slider-nav').slick({
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  asNavFor: '.slider-for',
		  dots: false,
		  centerMode: false,
		  focusOnSelect: true
		});
		
		/* *********************** 우측 퀵메뉴 ************************ */
		$(window).scroll(function(){
			var w_top = $(window).scrollTop();
			var right_top = $(".collectionDetailBox").offset().top;

			if (w_top > right_top) {
				$(".collectionView-quickBar").addClass("fixed");
			}else {
				$(".collectionView-quickBar").removeClass("fixed");
			}
		});
	});
</script>


<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<div class="collectionViewBox">
			<!-- 상품명 table -->
			<table style="width: 100%;">
				<tr>
					<!-- 이전페이지 -->
					<td rowspan="2" style="width: 80px; height: 80px;">
						<button style="width: 60px; height: 60px; background:#faaca8 url(/resources/img/icon_prev_white.png) no-repeat center center; border-radius: 2px;" onclick="window.history.back();"></button>
					</td>
					<!-- 상품명 -->
					<td>
						<div class="clearfix">
							<span class="fl" style="font-size: 28px;">${goods.goodsName}</span>
							<!-- 스크랩북 -->
							<span class="fr">
								<c:choose>
									<c:when test="${not empty scrapbook}">
										<button class="scrapStar" id="${goods.goodsNo}" name="${goods.code}">
											<img src="/resources/img/${goods.goodsFilePath }" style="width: 30px; height: 30px;">
										</button>
									</c:when>
									<c:otherwise>
										<button class="defaultStar" id="${goods.goodsNo}" name="${goods.code}">
											<img src="/resources/img/star_b1.png" style="width: 30px; height: 30px;">
										</button>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<!-- 별점 -->
						<p style="padding-top:10px;"><span style="vertical-align: middle;font-size: 16px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${goods.goodsScope}.png" style="height:18px;vertical-align: middle;"></p>				
					</td>
				</tr>
			</table>
			<!-- 상호명 테이블 끝 -->
			<br>
			<!-- 사진 carousel -->
			<!-- 큰 이미지 li 갯수, 순서와 작은 이미지 li 갯수, 순서가 일치해야함!! -->
			<div class="view-gallery-slide">
				<!-- 큰 이미지 영역 -->
				<ul class="view-big-gallery-list slider-for">
				<c:forEach items="${galleryList }" var="g">
					<li><img src="/resources/goods/${g.filepath }"></li>
				</c:forEach>
				</ul>
				<!-- 작은 이미지 영역 -->
				<ul class="view-small-gallery-list slider-nav">
				<c:forEach items="${galleryList }" var="g">
					<li><img src="/resources/goods/${g.filepath }"></li>
				</c:forEach>
				</ul>
			</div>
			<!-- 사진 carousel 끝 -->
			<br> <br> <br>
			<!-- 상세설명, 리뷰가 포함된 content 시작 -->
			<div class="collectionDetailBox" style="position: relative;">
				<!-- 왼쪽 상세설명, 리뷰, 지도 -->
				<div style="width: 70%; display: inline-block;">
					<h2>상세설명</h2>
					<hr>
					${goods.goodsContent}
					<br> <br> <br>
					<h2>가격확인 및 주문 진행</h2>
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
									<input type="text" id="weddingDate" class="datepicker wedding-date middle" placeholder="예식일을 선택해주세요" required>
								</td>
							</tr>
							<tr>
								<th>예식시간</th>
								<td colspan="2">
									<select id="weddingTime">
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
								<th colspan="2" style="text-align: center;">청첩장 주문제작</th>
							</tr>
							<tr>
								<td colspan="2">
									<span style="font-size:13px;">※예식일 기준으로 6주 전까지 컨펌을 마쳐야 배송 가능합니다.</span>
								</td>
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
									<input id="goodsAmount" type="number" value="1" min="1" style="width:50px;" class="num">장
								</td>
							</tr>
							<tr>
								<th colspan="2">
									총계
									<span style="float: right;"><span id="allPrice"></span>원</span>								
								</th>
							</tr>
						</table>						
						<br>
						<br>
						<div id="orderPage" style="display: none;">
							<h2>주문 정보 입력</h2>
							<br>
							<table class="comm-tbl">
								<colgroup>
									<col width="30%">
									<col width="/">
								</colgroup>
								<tr>
									<th>배송지 선택</th>
									<td>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="orderAddrSelect" id="memberAddrSelect" checked> 회원정보와 동일
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="orderAddrSelect" id="newAddrSelect"> 새로운 주소
										</div>
									</td>
								</tr>
								<tr>
									<th>수령인</th>
									<td>
										<div>
											<input type="text" id="receiveName" style="width:300px;">
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="receiveNameSelect" id="memberNameSelect" checked> 회원정보와 동일
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="receiveNameSelect" id="receiveNameSelect"> 수령인 선택
										</div>
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										<div>
											<input type="number" id="receivePhone1" style="width:100px;" maxlength="3" oninput="checkMax(this)">
											-
											<input type="number" id="receivePhone2" style="width:100px;" maxlength="4" oninput="checkMax(this)">
											-
											<input type="number" id="receivePhone3" style="width:100px;" maxlength="4" oninput="checkMax(this)">
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="receivePhoneSelect" id="memberPhoneSelect" checked> 회원정보와 동일
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="receivePhoneSelect" id="receivePhoneSelect"> 수령인 연락처 입력
										</div>
									</td>
								</tr>
								<tr>
									<th>배송지</th>
									<td>
										<input type="text" id="receiveAddr1" style="width:100px;" readonly>
										<button type="button" id="addrSearchBtn" onclick="sample4_execDaumPostcode()" style="display: none;">우편번호 찾기</button>
										<br>
										<input type="text" id="receiveAddr2" readonly>
										<input type="text" id="receiveAddr3" placeholder="상세주소를 입력해주세요.">
									</td>
								</tr>
								<tr>
									<th>주문메모 및 요청사항</th>
									<td>
										<input id="orderMemo" type="text" maxlength="80" oninput="checkMaxMemo(this)">
									</td>
								</tr>
								<tr>
									<th>결제수단</th>
									<td>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="paymentSelect" id="paymentCardSelect" class="payMethod" value="신용카드">
											신용카드 결제
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="paymentSelect" id="paymentBankSelect" class="payMethod" value="무통장">
											무통장 입금
										</div>
										<div style="width:150px;display: inline-block;">
											<input type="radio" name="paymentSelect" id="paymentPhoneSelect" class="payMethod" value="휴대폰">
											휴대폰 결제
										</div>
									</td>
								</tr>
							</table>					
						</div>
						<div class="common-tbl-btn-group">
							<button class="btn-style1" type="button" onclick="reservation();">주문 진행</button>
						</div>
					</form>

					<br> <br> <br>
					<!-- 리뷰 출력 -->
					<h2>후기 및 Q&A</h2>
					<hr>
					<div style="text-align: center;">
						<span style="color:orange;font-size: 80px;vertical-align: middle;margin-right:30px;">${goods.goodsScope/2}</span>
						<img src="/resources/img/scope-star/scope-star${goods.goodsScope}.png" style="vertical-align: middle;">
					</div>
					<hr>
					<c:if test="${not empty reviewList}">
						<c:forEach items="${reviewList}" var="r">
							<div class="reviewGroup" id="${r.reviewNo}">
								<div style="width:10%;float: left; margin-top:30px; margin-bottom:30px;">
									<div style="width:80px;height:80px;border-radius: 80px;background-color: orange;display: inline-block;"></div>
								</div>
								<div style="width:90%;display: inline-block;">
									<span style="font-size: 16px;font-weight: bolder;">${r.reviewWriter}</span>
									<span>[작성일 : ${r.reviewDate}]</span>
									<c:if test="${sessionScope.member.memberName == r.reviewWriter}">
										<span style="margin-left:10px;" class="reviewUpdateGroup"><a>수정</a> | <a class="deleteReview" style="cursor: pointer;">삭제</a><span class="goodsScopeSpan" style="cursor: inherit;width:10px;visibility: hidden;">${r.reviewScope}</span></span>
									</c:if>
									<span style="float: right;">
										<span style="font-size: 15px;vertical-align: middle;">평점 | </span><img src="/resources/img/scope-star/scope-star${r.reviewScope}.png" style="height:15px;vertical-align: middle;">
									</span>
									<br>
									<br>
									<c:if test="${not empty r.reviewFilepath}">
										<div style="width:100%;height:120px;overflow: hidden;display: inline-block;">
											<c:set var="doneLoop" value="false"/> 									<!-- 반복문 break -->
											<c:forEach items="${fn:split(r.reviewFilepath,',')}" var="item" varStatus="j">		<!-- 저장된 주소를 꺼내와 공백 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
												<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
													<img src="/resources/upload/review/${item}" style="width:100%;height:120px;">
													<c:if test="${j.count == 1}">									<!-- 반복문이 두번 돌았을 때 -->
														<c:set var="doneLoop" value="true"/> 						<!-- 반복문 break 활성화 -->
													</c:if>
												</c:if>
											</c:forEach>
										</div>
										<div class="reviewFilepathAll" style="cursor: inherit;width:10px;visibility: hidden;">${r.reviewFilepath}</div>
										<br>									
									</c:if>
									<span style="font-weight: bolder;">[이용후기]</span>
									<span>${r.reviewContent}</span>
								</div>
								<br>
								<hr style="width:100%;">
							</div>
						</c:forEach>
					</c:if>
					<!-- 리뷰 출력 끝 -->
					
					<!-- 리뷰 입력 -->
					<form id="fileUploadForm" action="/fileUpload.do" method="post" enctype="multipart/form-data">
						<div style="visibility: hidden;position: absolute;top:0;">
							<input type="text" id="code" name="code" value="I" style="cursor: inherit;width:10px;" readonly>
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
				</div>
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함-->
				<div style="width: 28%; height: 400px; float: right;">
					<div class="collectionView-quickBar">
						<!-- 태그 -->
						<div class="quickBar-con">
							<div class="quickBar-inner">
								<c:forEach items="${fn:split(goods.goodsTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<c:set var="keyword" value="${fn:split(item,'#')}" />
										<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="quickBar-con">
							<div class="quickBar-inner2">
								<div>
									<!-- 스크랩북 -->
									<div>
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
									</div>						
									<!-- 스크랩북 끝 -->
									<p style="padding-top:10px;">
										<c:choose>
											<c:when test="${empty scrapbookCount}">
												<span id="scrapbookCount" style="color:orangered;">0</span>
											</c:when>
											<c:otherwise>							
												<span id="scrapbookCount" style="color:orangered;">${scrapbookCount}</span>
											</c:otherwise>
										</c:choose> 명이 스크랩했습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 태그 끝 -->
				</div>
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함 끝-->
			</div>
		</div>
		<form id="paymentPage" action="/paymentPage.do" method="post" target="popup_window" style="visibility: hidden;position: absolute;top: 0;">
			<input id="submitCode" name="code" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitPrdNo" name="prdNo" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitPrdName" name="prdName" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitWeddingDate" name="weddingDate" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitWeddingTime" name="weddingTime" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitTotalPrice" name="totalPrice" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitPayMethod" name="payMethod" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitAmount" name="amount" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitOrderMemo" name="orderMemo" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitOrderAddr" name="orderAddr" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitReceiveName" name="receiveName" type="text" style="cursor: inherit;width:10px;" readonly>
			<input id="submitReceivePhone" name="receivePhone" type="text" style="cursor: inherit;width:10px;" readonly>
		</form>
	</div>
</section>
<script>
	/* 리뷰 삭제 */
	$(document).on("click",".deleteReview",function(){
		var selectParents = $(this).parents('.reviewGroup');
		var objectNo = ${goods.goodsNo};
		var code = "G";
		var reviewScope = $(this).siblings('.goodsScopeSpan').text();
		var reviewNo = selectParents.attr('id');
		var reviewFilepath = $(this).parents('.reviewUpdateGroup').siblings('.reviewFilepathAll').text();
		$.ajax({
			url : "/deleteReview.do",
			type : "post",
			data : {reviewNo:reviewNo, reviewFilepath:reviewFilepath,objectNo:objectNo,code:code,reviewScope:reviewScope},
			success : function(data){
				if(data > 0){
					alert("리뷰를 삭제했습니다.");
					location.reload();
				}else{
					alert("리뷰를 삭제할 수 없습니다.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.")
			}
		});
	});
	/* 리뷰 삭제 끝 */

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
			alert("이미지 수가 너무 많습니다.");
			$('#img1').hide();
			$('#img2').hide();
			$('#img3').hide();		
			$('#img4').hide();		
			$('#img5').hide();		
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
		var reviewOn = ${reviewOn};
		if(${sessionScope.member != null}){
			if($('#reviewWrite').css('display') == 'none'){
				if(reviewOn == 1){
					$('#reviewWrite').show();
					$('#reviewWriteBtn').text("♥ 후기 저장");					
				}else{
					alert("예약자만 리뷰를 작성할 수 있습니다.");
				}
			}else{
				if($('#reviewContent').val() == ''){
					alert("리뷰 내용을 작성해주세요.");
				}else{
					var reviewRef = ${goods.goodsNo};
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

	/* 주문메모 길이 체크 */
	function checkMaxMemo(checkMemo){
		if(checkMemo.value.length > checkMemo.maxLength){
			checkMemo.value = checkMemo.value.slice(0, checkMemo.maxLength);
		}
	}
	/* 주문메모 길이 체크 끝 */

	/* 연락처 길이 체크 */
	function checkMax(checkPhone){
		if(checkPhone.value.length > checkPhone.maxLength){
			checkPhone.value = checkPhone.value.slice(0, checkPhone.maxLength);
		}
	}		
	/* 연락처 길이 체크 끝 */
	
	/* 수령인 연락처 checked를 변경했을 때 */
	$('input[name=receivePhoneSelect]').click(function(){
		if($('#memberPhoneSelect').prop("checked") == true){			
			var memberPhone = '${sessionScope.member.phone}';				//세션으로부터 회원 연락처를 받아 변수에 저장
			$('#receivePhone1').val(memberPhone.substring(0,3));			//연락처 input에 회원 연락처 앞번호가 세팅됨
			$('#receivePhone2').val(memberPhone.substring(3,7));			//연락처 input에 회원 연락처 가운데 번호가 세팅됨
			$('#receivePhone3').val(memberPhone.substring(7,11));			//연락처 input에 회원 연락처 마지막 번호가 세팅됨
			$('#receivePhone1').prop('readonly',true);						//수령인 input 수정 불가 설정
			$('#receivePhone2').prop('readonly',true);						//수령인 input 수정 불가 설정
			$('#receivePhone3').prop('readonly',true);						//수령인 input 수정 불가 설정
		}
		if($('#receivePhoneSelect').prop("checked") == true){
			var memberPhone = '${sessionScope.member.phone}';				//세션으로부터 회원 연락처를 받아 변수에 저장
			$('#receivePhone1').val('');									//연락처 input에 회원 연락처 앞번호가 세팅됨
			$('#receivePhone2').val('');									//연락처 input에 회원 연락처 가운데 번호가 세팅됨
			$('#receivePhone3').val('');									//연락처 input에 회원 연락처 마지막 번호가 세팅됨
			$('#receivePhone1').prop('readonly',false);						//수령인 input 수정 불가 설정
			$('#receivePhone2').prop('readonly',false);						//수령인 input 수정 불가 설정
			$('#receivePhone3').prop('readonly',false);						//수령인 input 수정 불가 설정			
		}
	});
	/* 수령인 연락처 checked를 변경했을 때 끝 */
	
	/* 수령인 선택 checked를 변경했을 때 */
	$('input[name=receiveNameSelect]').click(function(){
		if($('#memberNameSelect').prop("checked") == true){
			$('#receiveName').val('${sessionScope.member.memberName}');		//수령인 input에 자동으로 회원 이름이 세팅됨
			$('#receiveName').prop('readonly',true);						//수령인 input 수정 불가 설정				
		}
		if($('#receiveNameSelect').prop("checked") == true){
			$('#receiveName').val('');										//수령인 input에 자동으로 회원 이름이 세팅됨
			$('#receiveName').prop('readonly',false);						//수령인 input 수정 불가 설정
		}
	});
	/* 수령인 선택 checked를 변경했을 때 끝 */
	
	/* 배송지 선택 checked를 변경했을 때 */
	$('input[name=orderAddrSelect]').click(function(){
		if($('#memberAddrSelect').prop("checked") == true){
			var addr = '${sessionScope.member.addr}';		//세션으로부터 회원 주소를 받아 변수에 저장
			var addrArr = addr.split('/');					//회원 주소를 슬라이드(/) 기준으로 잘라 배열에 저장함
			$('#receiveAddr1').val(addrArr[3]);				//배열의 4번쨰 공간에 저장된  우편번호를 출력함
			$('#receiveAddr2').val(addrArr[4]);				//배열의 5번째 공간에 저장된 지역주소를 출력함
			$('#receiveAddr3').val(addrArr[2]);				//배열의 3번째 공간에 저장된 상세주소를 출력함
			$('#addrSearchBtn').hide();						//우편번호 찾기 버튼 숨김
		}
		if($('#newAddrSelect').prop("checked") == true){
			$('#receiveAddr1').val('');
			$('#receiveAddr1').prop('readonly',false);
			$('#receiveAddr2').val('');
			$('#receiveAddr2').prop('readonly',false);
			$('#receiveAddr3').val('');
			$('#addrSearchBtn').show();
		}
	});
	/* 배송지 선택 checked를 변경했을 때 끝 */

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
	
	/* 버튼 클릭 시 결제 페이지로 이동 */
	function reservation(){
		if($('#weddingTime option:selected').val() == 'default'){
			alert("예식 시작 시간을 선택해주세요.");
		}else{
			if($('#goodsAmount').val() == '' || $('#goodsAmount').val() == 0){
				alert("수량을 하나 이상 입력해주세요.");
			}else{
				if('${sessionScope.member.memberId}' != ''){
					if($('#orderPage').css('display') == 'none'){
						$('#orderPage').show();											//주문 정보 입력 페이지가 나타남
						$('#receiveName').val('${sessionScope.member.memberName}');		//수령인 input에 자동으로 회원 이름이 세팅됨
						$('#receiveName').prop('readonly',true);						//수령인 input 수정 불가 설정
						var memberPhone = '${sessionScope.member.phone}';				//세션으로부터 회원 연락처를 받아 변수에 저장
						$('#receivePhone1').val(memberPhone.substring(0,3));			//연락처 input에 회원 연락처 앞번호가 세팅됨
						$('#receivePhone2').val(memberPhone.substring(3,7));			//연락처 input에 회원 연락처 가운데 번호가 세팅됨
						$('#receivePhone3').val(memberPhone.substring(7,11));			//연락처 input에 회원 연락처 마지막 번호가 세팅됨
						$('#receivePhone1').prop('readonly',true);						//수령인 input 수정 불가 설정
						$('#receivePhone2').prop('readonly',true);						//수령인 input 수정 불가 설정
						$('#receivePhone3').prop('readonly',true);						//수령인 input 수정 불가 설정
						var addr = '${sessionScope.member.addr}';						//세션으로부터 회원 주소를 받아 변수에 저장
						var addrArr = addr.split('/');									//회원 주소를 슬라이드(/) 기준으로 잘라 배열에 저장함
						$('#receiveAddr1').val(addrArr[3]);								//배열의 4번쨰 공간에 저장된  우편번호를 출력함
						$('#receiveAddr2').val(addrArr[4]);								//배열의 5번째 공간에 저장된 지역주소를 출력함
						$('#receiveAddr3').val(addrArr[2]);								//배열의 3번째 공간에 저장된 상세주소를 출력함
					}else{
						if('${sessionScope.member.memberId}' != ''){
							if($('#receiveName').val() == ''){
								alert("수령인을 확인해주세요.");
							}else{
								if($('#receivePhone1').val() == '' || $('#receivePhone2').val() == '' || $('#receivePhone3').val() == ''){
									alert("연락처를 확인해주세요.");
								}else{
									if($('#receiveAddr1').val() == '' || $('#receiveAddr2').val() == '' || $('#receiveAddr3').val() == ''){
										alert("배송지를 확인해주세요.");
									}else{
										if($('#paymentCardSelect').prop("checked") == false && $('#paymentBankSelect').prop("checked") == false && $('#paymentPhoneSelect').prop("checked") == false){
											alert("결제수단을 선택해주세요.");
										}else{
											window.open("","popup_window","width=950, height=650, scrollbars=no");
											submitPayment();
										}
									}
								}
							}							
						}else{
							alert("로그인 후 진행해주세요.");
							location.href="/loginPage.do";
						}
					}
				}else{
					alert("로그인 후 진행해주세요.");
					location.href="/loginPage.do";
				}				
			}
		}
	}
	
	function submitPayment(){
		var code = "G";
		var prdNo = ${goods.goodsNo};
		var prdName = '${goods.goodsName}';
		var weddingDate = $('#weddingDate').val().replace(/-/gi,'/');
		var weddingTime = $('#weddingTime option:selected').val();
		var totalPrice = $('#allPrice').text();
		var payMethod = $('.payMethod:checked').val();
		var amount = $('#goodsAmount').val();
		var orderMemo = $('#orderMemo').val();
		var orderAddr = '('+$('#receiveAddr1').val()+') '+$('#receiveAddr2').val()+' '+$('#receiveAddr3').val();
		var receiveName = $('#receiveName').val();
		var receivePhone = $('#receivePhone1').val()+$('#receivePhone2').val()+$('#receivePhone3').val()
		$('#submitCode').val(code);
		$('#submitPrdNo').val(prdNo);
		$('#submitPrdName').val(prdName);
		$('#submitWeddingDate').val(weddingDate);
		$('#submitWeddingTime').val(weddingTime);
		$('#submitTotalPrice').val(totalPrice);
		$('#submitPayMethod').val(payMethod);
		$('#submitAmount').val(amount);
		$('#submitOrderMemo').val(orderMemo);
		$('#submitOrderAddr').val(orderAddr);
		$('#submitReceiveName').val(receiveName);
		$('#submitReceivePhone').val(receivePhone);
 		$('#paymentPage').submit();
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
		var select = $('.defaultStar');
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		var scrapbook = $('#scrapbookCount');
		var scrapbookCount = parseInt($('#scrapbookCount').text());		/* 스크랩한 인원 수 */
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
					if(scrapbookCount == 0){
						scrapbook.text(1);						
					}else{
						scrapbook.text(scrapbookCount + 1);						
					}
					alert("스크랩북에 추가되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");
					location.href="/loginPage.do";
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	$(document).on("click",".scrapStar",function(){
		var select = $('.scrapStar');
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		var scrapbook = $('#scrapbookCount');
		var scrapbookCount = parseInt($('#scrapbookCount').text());		/* 스크랩한 인원 수 */
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
					if(scrapbookCount == 1){
						scrapbook.text(0);						
					}else if(scrapbookCount == 0){
						scrapbook.text(0);						
					}else{
						scrapbook.text(scrapbookCount - 1);
					}
					alert("스크랩북에서 삭제되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");					
					location.href="/loginPage.do";
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	/* 스크랩북 on/off 끝 */	
	
	/* 우편번호 찾기 */
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('receiveAddr1').value = data.zonecode;	//우편번호
	            document.getElementById("receiveAddr2").value = roadAddr;		//도로명주소
	        }
	    }).open();
	}
	/* 우편번호 찾기 끝 */
	
	</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp" />
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp" />

<link href="dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css">
<script src="dist/js/datepicker.min.js"></script>

<!-- Include English language -->
<script src="dist/js/i18n/datepicker.en.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/myHall.css">
<!-- font awesome -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
	<%-- 네이버 지도 API --%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

<script>
$(document).ready(function(){
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
	<div class="">
		<section class="hallView area">
			<div class="collectionViewBox">
			<!-- 상호명 table -->
			<table style="width: 100%;">
				<tr>
					<!-- 이전페이지 -->
					<td rowspan="2" style="width: 80px; height: 80px;">
						<button style="width: 60px; height: 60px; background:#faaca8 url(/resources/img/icon_prev_white.png) no-repeat center center; border-radius: 2px;" onclick="window.history.back();"></button>
					</td>
					<!-- 상호명 -->
					<td>
						<div class="clearfix">
							<span class="fl" style="font-size:28px;font-weight:500;">${hall.hallName}</span>
							<!-- 스크랩북 -->
							<span class="fr">
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
							</span>
						</div>
						<!-- 상세주소 -->			
						<p style="padding-top:10px;"><a style="font-size: 15px;" href="#map">${hall.hallAddr}</a></p>
					</td>
				</tr>
			</table>
			<!-- 상호명 테이블 끝 -->
			<br>
			<!-- 사진 carousel -->
			<div class="view-gallery-slide">
			<!-- 큰 이미지 영역 -->
			<ul class="view-big-gallery-list slider-for">
                <c:forEach items="${galleryList }" var="g">
                    <li><img src="/resources/hall/${g.filepath }"></li>
                </c:forEach>
			</ul>
			<!-- 작은 이미지 영역 -->
			<ul class="view-small-gallery-list slider-nav">
				<c:forEach items="${galleryList }" var="g">
                    <li><img src="/resources/hall/${g.filepath }"></li>
                </c:forEach>
			</ul>
		</div>
			<!-- 사진 carousel 끝 -->
			<br> <br> <br>
			<!-- 상세설명, 리뷰, 지도가 포함된 content 시작 -->
			<div class="collectionDetailBox" style="position: relative;">
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
										<span style="float: right;">식권 수량 : <input type="number" value="0" id="option2Amount" onchange="checkAmount();"></span>
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
					<h2>후기 및 Q&A ${hall.memberId }</h2>
					<hr>
					<div style="text-align: center;">
						<span style="color:orange;font-size: 80px;vertical-align: middle;margin-right:30px;">${hall.scope/2}</span>
						<img src="/resources/img/scope-star/scope-star${hall.scope}.png" style="vertical-align: middle;">
					</div>
					<hr>
					<c:if test="${not empty reviewList}">
						<c:forEach items="${reviewList}" var="r">
							<div class="reviewGroup" id="${r.reviewNo}">
								<div style="width:10%;float: left; margin-top:30px; margin-bottom:30px;">
									<div style="width:80px;height:80px;border-radius: 80px;background-color: orange;display: inline-block;"></div>	
								</div>
								<div class="printReviewGroup" style="width:90%;display: inline-block;">
									<span style="font-size: 16px;font-weight: bolder;">${r.reviewWriter}</span>
									<span>[작성일 : ${r.reviewDate}]</span>
									<c:if test="${sessionScope.member.memberName == r.reviewWriter}">
										<span style="margin-left:10px;" class="reviewUpdateGroup"><a class="updateReview" style="cursor: pointer;">수정</a> | <a class="deleteReview" style="cursor: pointer;">삭제</a><span class="dressScopeSpan" style="cursor: inherit;width:10px;visibility: hidden;">${r.reviewScope}</span></span>
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
									<span class="reviewTitle" style="font-weight: bolder;">[이용후기]</span>
									<!-- 수정할 별점 위치 -->
									<div class="updateScope" style="display: none;">
										<img class="updateReviewScopeStar" src="/resources/img/scope-star/scope-star10.png" usemap="#imgmap2019716244823" style="vertical-align: middle;height:20px;">
										<map id="imgmap2019716244823" name="imgmap2019716244823">
											<area shape="rect" coords="107,1,116,42" class="updateScope-star10" onmouseover="updateReviewScopeStar(10);" />
											<area shape="rect" coords="97,1,106,42" class="updateScope-star9" onmouseover="updateReviewScopeStar(9);" />
											<area shape="rect" coords="83,1,92,42" class="updateScope-star8" onmouseover="updateReviewScopeStar(8);" />
											<area shape="rect" coords="73,1,82,42" class="updateScope-star7" onmouseover="updateReviewScopeStar(7);" />
											<area shape="rect" coords="59,1,68,42" class="updateScope-star6" onmouseover="updateReviewScopeStar(6);" />
											<area shape="rect" coords="49,1,58,42" class="updateScope-star5" onmouseover="updateReviewScopeStar(5);" />
											<area shape="rect" coords="35,1,44,42" class="updateScope-star4" onmouseover="updateReviewScopeStar(4);" />
											<area shape="rect" coords="25,1,34,42" class="updateScope-star3" onmouseover="updateReviewScopeStar(3);" />
											<area shape="rect" coords="11,1,20,42" class="updateScope-star2" onmouseover="updateReviewScopeStar(2);" />
											<area shape="rect" coords="1,1,10,42" class="updateScope-star1" onmouseover="updateReviewScopeStar(1);" />
										</map>
										<span style="vertical-align: middle;font-size:16px;"><span class="updateStarScore">5</span>점</span>
									</div>
									<!-- 수정할 별점 위치 끝 -->
									<span class="printReviewContent">${r.reviewContent}</span>
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
				<div style="width: 28%; height: 400px; float: right;">
					<div class="collectionView-quickBar">
						<!-- 태그 -->
						<div class="quickBar-con">
							<div class="quickBar-inner">
								<div>						
									<c:forEach items="${fn:split(hall.hallTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
										<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
											<c:set var="msg" value="${fn:split(item,'#')}" />
											<a href="/hallPc.do?msg=${msg[0]}">${item}</a>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 태그 끝 -->
						<!-- 스크랩 -->
						<div class="quickBar-con">
							<div class="quickBar-inner2">
								<div>
									<!-- 스크랩북 -->
									<div>
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
										</c:choose>명이 스크랩했습니다.
									</p>
								</div>
							</div>
						</div>
						<!-- 스크랩 끝 -->
					</div>
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
							arrows : false,
							dots : false,
							centerMode : false,
							focusOnSelect : true
						});
					});
	
	/* 리뷰 수정 */
	$(document).on("click",".updateReview",function(){
		if($(this).parents('.printReviewGroup').find('.updateScope').css('display') == 'none'){
			$('.printReviewGroup').find('textarea').contents().unwrap();
			$('.printReviewGroup').find('.updateScope').hide();
			$('.printReviewGroup').find('.updateScope').css('display','none');
			$('.updateSubmit').remove();
			
			$(this).parents('.printReviewGroup').find('.printReviewContent').wrap('<textarea class="printReviewContentArea" style="width:100%;height:150px;">'+$(this).parents('.printReviewGroup').find('.printReviewContent').html().replace(/<br>/gi, "\n")+'</textarea>');
			$(this).parents('.printReviewGroup').find('.updateScope').show();
			$(this).parents('.printReviewGroup').find('.updateScope').css('display','inline-block');
			$(this).parents('.printReviewGroup').find('.updateScope').after('<a class="updateSubmit" style="float:right;cursor:pointer;">수정완료</a>');
		}
	});
	$(document).on("click",".updateSubmit",function(){
		var selectParents = $(this).parents('.reviewGroup');
		var reviewNo = parseInt(selectParents.attr('id'));
		var objectNo = ${hall.hallNo};
		var code = "H";
		var reviewScope = parseInt($(this).siblings(".reviewUpdateGroup").find('.dressScopeSpan').text());
		var newReviewScope = $(this).siblings('.updateScope').find('.updateStarScore').text() * 2;
		var reviewContent = $(this).siblings('.printReviewContentArea').val();
		if(reviewContent == ""){
			alert("리뷰를 입력해주세요.");
		}else{
			$.ajax({
				url : "/deleteInsertReview.do",
				type : "post",
				data : {reviewNo:reviewNo, objectNo:objectNo, code:code, reviewScope:reviewScope, newReviewScope:newReviewScope,reviewContent:reviewContent},
				success : function(data){
					if(data > 0){
						alert("후기를 수정했습니다.");
						location.reload();
					}else{
						alert("후기를 수정할 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				},
				error : function(){
					alert("잠시 후 다시 시도해주세요.");
				}
			});					
		}
	});
	/* 리뷰 수정 끝 */
	
	
	/* 리뷰 삭제 */
	$(document).on("click",".deleteReview",function(){
		var selectParents = $(this).parents('.reviewGroup');
		var objectNo = ${hall.hallNo};
		var code = "H";
		var reviewScope = $(this).siblings('.dressScopeSpan').text();
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

	/* 수정 별점 위에 마우스 over 시 별점 바뀜 */
	function updateReviewScopeStar(scopeStar){
		$('.updateReviewScopeStar').prop("src","/resources/img/scope-star/scope-star"+scopeStar+".png");
		$('.updateStarScore').text(scopeStar/2);
	}
	/* 수정 별점 위에 마우스 over 시 별점 바뀜 */
	
	
	/* 리뷰쓰기 버튼 클릭 시 리뷰 input창 열리거나 submit */
	function reviewShow(){
		if(${sessionScope.member != null}){
			if(${reservation.memberId == null}){
				alert("서비스를 이용하신 고객님만 작성 가능합니다.");
			}else{
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
		}else if($("#hallOption option:selected").val() == null){
			alert("기본옵션을 선택해주세요.");
		}else if($("#hallPerson").val() == ''){
			alert("하객수를 입력해주세요.")
		}else if($("#option2Amount").val() == 0){
			alert("식권 수량을 입력하세요.");
		}else if(${hall.hallMinPerson} > $("#hallPerson").val()){
			$('#personSpan').text(${hall.hallMinPerson}+"명 이상 ~"+${hall.hallMaxPerson}+"명 이하로 입력하세요.");
			$('#personSpan').css('color','red');
			console.log(${hall.hallMinPerson});
			console.log(${hall.hallMaxPerson});
		}else if(${hall.hallMaxPerson} < $("#hallPerson").val()){
			$('#personSpan').text(${hall.hallMinPerson}+"명 이상 ~"+${hall.hallMaxPerson}+"명 이하로 입력하세요.");
			$('#personSpan').css('color','red');
			console.log(${hall.hallMinPerson});
			console.log(${hall.hallMaxPerson});
		}else{
			$('#personSpan').text('');
			submitReservation();
			
		};	// if close;	
	}; // function close;
	
	/* 예약 클릭시 조건 확인 종료*/
	
	/* 예약 데이터 등록하기 시작*/
	
	function submitReservation(){
		var code = "H";		//고유코드
		var prdNo = ${hall.hallNo};		//고유번호
		var prdId = '${hall.memberId}';
// 		var prdId = 'test1';
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
				var memberId = '${sessionScope.member.memberId}';
				if(data > 0){
					alert("예약을 완료했습니다. 주문장으로 이동합니다.");
					location.href="/reservationView.do?memberId="+memberId+"&reservationNo="+data;
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
		var select = $('.defaultStar');
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		var scrapbook = $('#scrapbookCount');
		var scrapbookCount = $('#scrapbookCount').text();		/* 스크랩한 인원 수 */
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
		var scrapbookCount = $('#scrapbookCount').text();		/* 스크랩한 인원 수 */
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
	
	//네이버 지도 API
	window.onload = function(){
	//	var map = new naver.maps.Map('map');		//시청 기준 map
		var map = new naver.maps.Map('map',{		//위도,경도 기준 map
			center : new naver.maps.LatLng(${hall.hallLatitude},${hall.hallLongtitude}),
			zoom:10,
			zoomControl : true,						//zoom 콘트롤러
			zoomControlOptions : {					//zoom 콘트롤러 설정
				position : naver.maps.Position.TOP_RIGHT,		//위치:상단 오른쪽
				style : naver.maps.ZoomControlStyle.SMALL		//사이즈:최소
			}
		});
		var marker = new naver.maps.Marker({		//조건에 맞는 위치를 지도에 찍어주는 핀(마커)
			position : new naver.maps.LatLng(${hall.hallLatitude},${hall.hallLongtitude}),
			map : map
		});
		naver.maps.Event.addListener(map, 'click', function(e){
			if(infoWindow.getMap()){
				infoWindow.close();
			}
			//위도 경도는 바로 구할 수 있음
			//geocode 서브모듈을 이용한 위경도 -> 주소변환
			//geocede : 주소 -> 위경도 / reverseGeocode : 위경도 -> 주소
			naver.maps.Service.reverseGeocode({
				location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),		//위도,경도를 클릭한 곳으로 바꿔줌(마커 위치)
				},function(status,response){
					if(status !== naver.maps.Service.Status.OK){					//위도,경도를 못 얻어온 경우
						return alert("못찾음");
					}
					var result = response.result,
					items = result.items;
					address = items[0].address;
			});
		});
		var contentString = [						//마커 클릭 시 출력할 주소 배열
	        '   <h3 style="display:inline-block;padding:10px;">${hall.hallName}</h3>',
	        '   	<p style="font-size:13px;padding:10px;">${hall.hallAddr}<br />',
	        '       TEL : ${hall.hallTel}<br />',
	        '       <a href="http://www.kssports.go.kr" target="_blank" style="text-decoration:none;">http://www.kssports.go.kr/</a>',
	        '   </p>',
	        '</div>'
		].join('');									//배열 값을 String으로 합침
		var infoWindow = new naver.maps.InfoWindow();		//마커 클릭 시 띄우는 창
		naver.maps.Event.addListener(marker,'click',function(){
			if(infoWindow.getMap()){				//infoWindow가 열려있는지 판단
				infoWindow.close();					//열려있을 때 닫음
			}else{
				infoWindow.setContent(contentString);		//정보창에 글시 세팅
				infoWindow.open(map,marker);
			}
		});
	};
	

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
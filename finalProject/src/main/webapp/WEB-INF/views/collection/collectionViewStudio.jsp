<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp" />
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp" />
<%-- 네이버 지도 API --%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

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
							<span class="fl" style="font-size: 28px;">${studio.studioName}</span>
							<!-- 스크랩북 -->
							<span class="fr">
								<c:choose>
									<c:when test="${not empty scrapbook}">
										<button class="scrapStar" id="${studio.studioNo}"
											name="${studio.code}">
											<img src="/resources/img/star_b2.png"
												style="width: 30px; height: 30px;">
										</button>
									</c:when>
									<c:otherwise>
										<button class="defaultStar" id="${studio.studioNo}"
											name="${studio.code}">
											<img src="/resources/img/star_b1.png"
												style="width: 30px; height: 30px;">
										</button>
									</c:otherwise>
								</c:choose>						
							</span>
						</div>
						<!-- 상세주소 -->
						<p style="padding-top:10px;"><a style="font-size: 15px;" href="#map">${studio.studioAddr}</a></p>
						<!-- 상세주소 끝 -->
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
			<div class="collectionDetailBox" style="position: relative;">
				<!-- 왼쪽 상세설명, 리뷰, 지도 -->
				<div style="width: 70%; display: inline-block;">
					<h2>상세설명</h2>
					<hr>
					${studio.studioContent} <br> <br> <br>
					<c:if
						test="${not empty studio.studioTime || not empty studio.studioCamera}">
						<h2>운영정책</h2>
						<br>
						<table class="comm-tbl">
							<colgroup>
								<col width="30%">
								<col width="/">
							</colgroup>
							<c:if test="${not empty studio.studioTime}">
								<tr>
									<th>평균촬영시간</th>
									<td>${studio.studioTime}</td>
								</tr>
							</c:if>
							<c:if test="${not empty studio.studioCamera}">
								<tr>
									<th>평균촬영시간</th>
									<td>${studio.studioCamera}</td>
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
								<th colspan="3" style="text-align: center;">예약 옵션</th>
							</tr>
							<c:if test="${not empty studioSelectList0}">
								<tr>
									<th>본식 스냅</th>
									<td colspan="2">
										<select name="option1" id="option1" class="studioSelectOption">
											<option value="default">::: 본식 옵션 선택 :::</option>
											<c:forEach items="${studioSelectList0}" var="ss0">
												<option value="${ss0.studioOptionPrice}"><span style="margin-right: 20px;">${ss0.studioOption}</span>(<span class="studioOptionPrice">${ss0.studioOptionPrice}</span>원)
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty studioSelectList1}">
								<tr>
									<th id="studioSnap-th">스튜디오 스냅</th>
									<td colspan="2">
										<select name="option2" id="option2" class="studioSelectOption">
											<option value="default">::: 스튜디오 옵션 선택 :::</option>
											<c:forEach items="${studioSelectList1}" var="ss1">
												<option value="${ss1.studioOptionPrice}"><span style="margin-right: 20px;">${ss1.studioOption}</span>(<span class="studioOptionPrice">${ss1.studioOptionPrice}</span>원)
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr id="option2Tr" style="display:none;">
									<td>방문일정</td>
									<td>
										<input type="text" name="option2Date" id="option2Date" class="datepicker wedding-date middle" placeholder="예약 날짜를 선택해주세요" required>
										<br>
										<select name="option2Time" id="option2Time">
											<option value="default">::: 예약 시간 선택 :::</option>
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
							</c:if>
							<c:if test="${not empty studioSelectList2}">
								<tr>
									<th>본식 영상 촬영</th>
									<td colspan="2">
										<select name="option3" id="option3" class="studioSelectOption">
											<option value="default">::: 영상 촬영 옵션 선택 :::</option>
											<c:forEach items="${studioSelectList2}" var="ss2">
												<option value="${ss2.studioOptionPrice}"><span style="margin-right: 20px;">${ss2.studioOption}</span>(<span class="studioOptionPrice">${ss2.studioOptionPrice}</span>원)
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</c:if>
							<tr>
								<th colspan="3">총계<span style="float: right;"><span id="allPrice"></span>원</span></th>
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
						<span style="color:orange;font-size: 80px;vertical-align: middle;margin-right:30px;">${studio.studioScope/2}</span>
						<img src="/resources/img/scope-star/scope-star${studio.studioScope}.png" style="vertical-align: middle;">
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
										<span style="margin-left:10px;" class="reviewUpdateGroup"><a class="updateReview" style="cursor: pointer;">수정</a> | <a class="deleteReview" style="cursor: pointer;">삭제</a><span class="studioScopeSpan" style="cursor: inherit;width:10px;visibility: hidden;">${r.reviewScope}</span></span>
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
							<input type="text" id="code" name="code" value="S" style="cursor: inherit;width:10px;" readonly>
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
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함-->
				<div style="width: 28%; height: 400px; float: right;">
					<div class="collectionView-quickBar">
						<!-- 태그 -->
						<div class="quickBar-con">
							<div class="quickBar-inner">
								<div>
									<c:forEach items="${fn:split(studio.studioTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
										<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
											<c:set var="keyword" value="${fn:split(item,'#')}" />
											<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
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
												<button class="scrapStar" id="${studio.studioNo}" name="${studio.code}">
													<img src="/resources/img/star_b2.png" style="width: 30px; height: 30px;">
												</button>
											</c:when>
											<c:otherwise>
												<button class="defaultStar" id="${studio.studioNo}" name="${studio.code}">
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
				<!-- 오른쪽 실제사례, 인터뷰, 스크랩북, 전화번호 등이 포함 끝-->
			</div>
		</div>
	</div>
</section>
<script>
	/* 리뷰 수정 */
	$(document).on("click",".updateReview",function(){
		if($(this).parents('.printReviewGroup').find('.printReviewContent').val() == ''){
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
		var objectNo = ${studio.studioNo};
		var code = "S";
		var reviewScope = parseInt($(this).siblings(".reviewUpdateGroup").find('.studioScopeSpan').text());
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
		var objectNo = ${studio.studioNo};
		var code = "S";
		var reviewScope = $(this).siblings('.studioScopeSpan').text();
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

	/* 수정 별점 위에 마우스 over 시 별점 바뀜 */
	function updateReviewScopeStar(scopeStar){
		$('.updateReviewScopeStar').prop("src","/resources/img/scope-star/scope-star"+scopeStar+".png");
		$('.updateStarScore').text(scopeStar/2);
	}
	/* 수정 별점 위에 마우스 over 시 별점 바뀜 */
	
	
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
					var reviewRef = ${studio.studioNo};
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
	
	/* 페이지 로드 시 이벤트 */
	$(document).ready(function(){
		/* 페이지 로드 시 총계 변경 */
		var allPrice = 0;
		$('#allPrice').text(allPrice);
		/* 페애지 로드 시 총계 변경 끝 */
	});
	/* 페에지 로드 시 이벤트 끝 */
	
	/* 버튼 클릭 시 예약 */
	function reservation(){
		if($('#weddingTime option:selected').val() == 'default'){
			alert("예식 시작 시간을 선택해주세요.");
		}else{
			if($('#option1 option:selected').val() == 'default' && $('#option2 option:selected').val() == 'default' && $('#option3 option:selected').val() == 'default'){
				alert("옵션을 한 가지 이상 선택해주세요.");
			}else{
				if($('#option2 option:selected').val() == 'default'){
					submitReservation();
				}else{
					if($('#option2Time option:selected').val() == 'default'){
						alert("예약 시간을 선택해주세요.");
					}else{
						submitReservation();
					}
				}
			}
		}
	}
	
	function submitReservation(){
		var code = "S";
		var prdNo = ${studio.studioNo};
		var prdId = '${studio.memberId}';
		var prdName = '${studio.studioName}';
		var weddingDate = $('#weddingDate').val().replace(/-/gi,'/');
		var weddingTime = $('#weddingTime option:selected').val();
		var totalPrice = $('#allPrice').text();
		var option1 = $('#option1 option:selected').text().substring(0,$('#option1 option:selected').text().indexOf("("));
		var option2 = $('#option2 option:selected').text().substring(0,$('#option2 option:selected').text().indexOf("("));
		var option2Date = null;
		var option2Time = null;
		if($('#option2Time option:selected').val() != 'default'){
			option2Date = $('#option2Date').val();
			option2Time = $('#option2Time option:selected').text();			
		}
		var option3 = $('#option3 option:selected').text().substring(0,$('#option3 option:selected').text().indexOf("("));
		$.ajax({
			url : "/reservationStudio.do",
			data : {code:code,prdNo:prdNo,prdId:prdId,prdName:prdName,weddingDate:weddingDate,weddingTime:weddingTime,totalPrice:totalPrice,option1:option1,option2:option2,option2Date:option2Date,option2Time:option2Time,option3:option3},
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
		});	
	}
	/* 버튼 클릭 시 예약 끝 */
	
	/* 스튜디오 스냅 select change 시 날짜,시간 드러남 */
	$('#option2').on("change",function(){
		if($('#option2 option:selected').val() == 'default'){
			$('#option2Time option:eq(0)').prop('selected',true);
			$('#studioSnap-th').prop('rowspan',1);
			$('#option2Tr').hide();
		}else{
			$('#studioSnap-th').prop('rowspan',2);
			$('#option2Tr').show();
		}
	});
	/* 스튜디오 스냅 select change 시 날짜,시간 드러남 끝 */
	
	/* 옵션 select 박스 change 시 가격 변경 */
	$('.studioSelectOption').on("change",function(){
		var allPrice = 0;
		if($('#option1 option:selected').val() != 'default'){
			if($('#option1 option:selected').val() != null){
				allPrice += parseInt($('#option1 option:selected').val());				
			}
		}
		if($('#option2 option:selected').val() != 'default'){
			if($('#option2 option:selected').val() != null){
				allPrice += parseInt($('#option2 option:selected').val());							
			}
		}
		if($('#option3 option:selected').val() != 'default'){
			if($('#option3 option:selected').val() != null){
				allPrice += parseInt($('#option3 option:selected').val());				
			}
		}
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
	
	//네이버 지도 API
	window.onload = function(){
	//	var map = new naver.maps.Map('map');		//시청 기준 map
		var map = new naver.maps.Map('map',{		//위도,경도 기준 map
			center : new naver.maps.LatLng(${studio.studioLatitude},${studio.studioLongitud}),
			zoom:10,
			zoomControl : true,						//zoom 콘트롤러
			zoomControlOptions : {					//zoom 콘트롤러 설정
				position : naver.maps.Position.TOP_RIGHT,		//위치:상단 오른쪽
				style : naver.maps.ZoomControlStyle.SMALL		//사이즈:최소
			}
		});
		var marker = new naver.maps.Marker({		//조건에 맞는 위치를 지도에 찍어주는 핀(마커)
			position : new naver.maps.LatLng(${studio.studioLatitude},${studio.studioLongitud}),
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
	        '   <h3 style="display:inline-block;padding:10px;">${studio.studioName}</h3>',
	        '       <img src="/img/header_logo.png" width="100" height="100" alt="KS" style="float:right;" class="thumb" />',
	        '   	<p style="font-size:13px;padding:10px;">${studio.studioAddr}<br />',
	        '       TEL : ${studio.studioTel}<br />',
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
	}
	</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />
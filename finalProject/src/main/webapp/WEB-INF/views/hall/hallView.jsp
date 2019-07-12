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

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<section class="hallView">
<!-- 			<div class="hallName "> -->
<!-- 				<div class="subName area"> -->
<!-- 					<div class="backBtn">&lt;</div> -->
<!-- 					<div class="text"> -->
<!-- 						<h5> -->
<!-- 							홀 제목 <a href="#"><img alt="" src="/resources/img/star_m1.png"></a> -->
<!-- 						</h5> -->
<!-- 						<p>홀 주소</p> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div id="titlebar" class="property-titlebar margin-bottom-0 area">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<a href="javascript:;" class="back-to-listings"></a>
							<div class="property-title">
								<h2>메이다이닝</h2>
								<span> <a href="#location" class="listing-address"> <i
										class="fa fa-map-marker"></i> 서울 도봉구 도봉로169길 208 (도봉동)
								</a>
								</span>
								<div class="ctnr4_like">
									 <a href="#"><img alt="" src="/resources/img/star_m1.png"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>

			<div class="view-gallery-slide area">
				<!-- 큰 이미지 영역 -->
				<ul class="view-big-gallery-list slider-for">
					<li><img src="/resources/img/test_img2.jpg"></li>
					<li><img src="/resources/img/test_img2.jpg"></li>
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
					<li><img src="/resources/img/test_img2.jpg"></li>
					<li><img src="/resources/img/test_img2.jpg"></li>
				</ul>
			</div>
			<br>
			<div class="content area">
				<div class="contentsub">
					<h3 class="desc-headline">상세설명</h3>
					<div>
						<h2>스타 쉐프가 선사하는 음식</h2>
						<p>내가 그린 기린 그림은 목이 긴 그린 기린 그림이고 니가 그린 기린 그림은 목인 짧은 그린 기린 그림이다.</p>
					</div>

					<h3 class="desc-headline">운영정책</h3>
					<div>
						<ul class="property-features ptnr_policy margin-top-0">
							<li><i class="far fa-clock"></i> <span class="policy_title">이용시간</span>
								<p>
									메이다이닝 시크릿가든 - 11:00 ~ 15:00
								</p></li>
							<li><i class="fas fa-utensils"></i> <span
								class="policy_title">식사</span>
								<p>
									<span class="policy_o">제공</span>
								</p></li>
							<li><i class="fa fa-volume-up"></i> <span
								class="policy_title">음향</span>
								<p>
									<span class="policy_o">제공</span>
								</p></li>
							<li><i class="fas fa-glass-martini-alt"></i> <span
								class="policy_title">주류</span>
								<p>
									<span class="policy_o">제공</span>
								</p></li>
							<li><i class="fas fa-parking"></i> <span
								class="policy_title">주차</span>
								<p>
									<span class="policy_o">가능</span>
								</p></li>
						</ul>
					</div>

					<h3 class="desc-headline" style="font-size: 20px; color: #f46629;">
						<i class="fa fa-calculator"></i> 가격확인 및 예약문의
					</h3>
					<div class="ptnr_estimate">
						<div class="panel panel-default" style="background-color: #f9f3f3">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="javascript:;"> 1단계 예식정보입력 및 대관선택 </a>
								</h4>
							</div>
							<div class="panel-body" id="ctnr1_estimate">
								<div class="form-group margin-bottom-45">
									<label class="control-label">결혼 예정일</label>
									<div class="input-group-wrap">
										<div class="input-group w-60">
											<input type="text" name="weddingDate" id="weddingDate"
												class="datepicker wedding-date form-control"
												placeholder="예식일을 선택해주세요" required> <span
												class="input-group-btn ui-datepicker-trigger">
												<button class="btn default" type="button">
													<i class="far fa-calendar-alt"></i>
												</button>
											</span>
										</div>
										<div class="input-group w-40">
											<input type="text" name="timepicker"
												class="form-control time_element" /> <span
												class="input-group-btn ui-datepicker-trigger">
												<button class="btn default" type="button">
													<i class="far fa-clock"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>언제 대관하고 싶으신가요?</label>
									<div class="input-group-wrap">
										<select
											class="form-control form_input input_necessary attr_select_time toggle_box"
											id="select_venue_service">
											<option>메이다이닝 시크릿가든 / 80명 ~ 200명 /
												11:00 ~ 15:00</option>
										</select>
									</div>
								</div>
								<div class="table-scrollable">
									<table class="table table-bordered table-hover" border="1">
										<thead>
											<tr>
												<th></th>
												<th>상세정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>대관정책/요금</td>
												<td id="tb_desc2">장소가 정한 시간동안만 이용가능해요<br>대관료:
													2,500,000원
												</td>
											</tr>
											<tr id="ctnr_people_policy" style="display: none;">
												<td>인원정책</td>
												<td id="tb_desc3"></td>
											</tr>
											<tr>
												<td>비고</td>
												<td id="tb_desc4" style="white-space: pre-wrap;">메이다이닝</td>
											</tr>
										</tbody>
									</table>
								</div><br>
								<div class="form-group form-md-touchspin margin-bottom-30">
									<label class="control-label">예상하객수<span
										class="required">*</span></label>
									<div class="input-group-wrap">
										<div class="input-group w-60">
											<input type="text" name="" id="" class="form-control"
												placeholder="몇명이나오니?" required> <span
												class="input-group-btn ui-datepicker-trigger">
												<button class="btn default" type="button">명</button>
											</span>
										</div>
									</div>
									<span class="msg-error">80명이상 200명이하로 입력가능합니다<br></span>
								</div>
							</div>
						<ul class="btn-group">
							<li><a href="javascript:;" class="btn yellow-gold estm_next"
								valid-target="#ctnr1_estimate" next-target="#ctnr2_estimate">
									다음으로 </a></li>
						</ul>
						</div>
						<div style="clear: both;"></div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="javascript:;"> 2단계 <strong>가격확인하기</strong>
									</a>
								</h4>
							</div>
							<div class="panel-body default-hide" id="ctnr2_estimate"
								style="background-color: rgb(249, 243, 243); display: none;">
								<div class="col-md-12">
									<ul class="service_lst">
										<div
											class="form-group form-md-line-input form-md-floating-label">
											<div class="form-control form-control-static margin-top-10">
												제공하는 서비스가 없습니다.</div>
											<label for="form_control_1">제공 서비스</label>
										</div>
									</ul>
									<ul class="btn-group">
										<li><a href="javascript:;" class="btn default estm_prev"
											current-target="#ctnr2_estimate"
											prev-target="#ctnr1_estimate"> 이전으로 </a></li>
										<li><a href="javascript:;"
											class="btn yellow-gold estm_submit" ptnr-code="106912520760"
											available="1"> 전체 가격 확인 </a></li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>


<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		
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
			});
		</script>
		
		<!-- 형준 :: 갤러리 슬라이드 테스트 -->
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
		
		
		
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>

 <link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="dist/js/datepicker.min.js"></script>

        <!-- Include English language -->
        <script src="dist/js/i18n/datepicker.en.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/hallView.css"> 

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<section class="hallView">
			<div class="hallName ">
				<div class="subName area">
				<div class="backBtn">
					<
				</div>
				<div class="text">
					<h5>홀 제목  <a href="#"><img alt="" src="/resources/img/star_m1.png"></a></h5>
					<p>홀 주소</p>
					
				</div>
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
		</div><br>
		<div class="content area">
			<div class="contentsub">
			 <h2>상세살명</h2>
			 <hr>
				내가 그린 기린 그림은 목이 긴 그린 기린 그림이고 니가 그린 기린 그림은 목인 짧은 그린 기린 그림이다.
				<br><br><br>
				<h2>운영정책</h2>
				<hr>
				이용시간:
				식사:
				음향:
				주류:
				주차:
				<br><br><br>
				<h3>가격확인 및 예약문의</h3>
				<hr>
				<div class="reservation1">
				<h1>1단계 예식정보입력 및 대관선택</h1>
				<hr><br>
				<h1>결혼 예정일</h1>
				<input type="text" name="weddingDate" id="weddingDate" class="datepicker wedding-date" placeholder="예식일을 선택해주세요" required>
				<input type="text" name="timepicker" class="time_element"/>
				<br><br><br>
				<h1>언제 대관하고 싶은신가요?</h1>
				<select>
					<option>옵션</option>
				</select>
				<table border="1">
					<tr >
						<td></td>
						<td>상세정보</td>
					</tr>
					<tr>
						<td>대관</td>
						<td>대관료</td>
					</tr>
					<tr>
						<td>비고</td>
						<td>내용</td>
					</tr>
				</table><br><br>
				<h3>에쌍하객수</h3>
				<input type="text" name="" id="" placeholder="인원을 입력하세요.">
				<button>다음으로</button>
				</div>
				<div class="reservation2">
					<h3>2단계 가격확인하기</h3>
					<hr>
					<h3>제공 서비스</h3>
					<hr>
					<br>
					[식사]
					<h1>메뉴이름 가격</h1>
					<h1>수량</h1>
					<hr>
					<button>이전으로</button>
					<button>전체 가격 확인</button>
				</div><br>
				<h3>진짜후기 </h3>
				<hr><br>
				<h3>위치</h3>
				<hr>
			</div>
		</div>
			
		</section>
	</div>
</section>

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

<!-- <script src="/resources/js/jquery.js"></script> -->
<script src="/resources/js/timepicki.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/timepicki.css">
<script>
  $(document).ready(function(){
    $(".time_element").timepicki();
  });
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Sub --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<input type="hidden" id="weddingLoc" name="weddingLoc" value="${simulator.weddingLoc }">
		<input type="hidden" id="weddingDate" name="weddingDate" value="${simulator.weddingDate }">
		<input type="hidden" id="weddingPerson" name="weddingPerson" value="${simulator.weddingPerson }">
		<!-- 웨딩홀 -->
		<h2 class="simulator-select-tit">웨딩홀</h2>
		<div class="simulator-select-box">
			<div class="simulator-select-con">
				<c:choose>
					<c:when test="${empty hList }">
						<p class="none">검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty hList }">
						<div class="simulator-select-group">
							<!-- 선택 안할때 버튼 -->
							<button class="none-btn hall-none">고르지 않기</button>
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="${hTotal }" value="" class="more-btn" id="hall-more"></button> 
							<ul class="simulator-select-group-list hall-group-list clearfix">
								<c:forEach items="${hList }" var="h">
									<!-- <li class="simulator-select-list-con">
										<div class="simulator-select-list">
											<div class="simulator-select-img-thum">
												<span style="background:url('/resources/upload/hall/${h.hallPath}') no-repeat center center; background-size:cover;"></span>
											</div>
											<h3 class="simulator-select-list-tit">${h.hallName }</h3>
											<p class="simulator-select-list-addr">${h.hallAddr }</p>
											<p class="simulator-select-list-price">평균 <b>${h.hallPrice }</b> 원</p>
											<c:if test="${not empty h.hallTag }">
												<p class="simulator-select-list-tag">${h.hallTag }</p>
											</c:if>
											<c:if test="${empty h.hallTag }">
												<p class="simulator-select-list-tag">관련 태그 없음</p>
											</c:if>
										</div>
										<div class="simulator-select-btn-group">
											<button class="btn-1">상세 보기</button>
											<button type="submit" class="btn-2">맘에 들어!</button>
										</div>
									</li> -->
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<!-- 웨딩 드레스 -->
		<h2 class="simulator-select-tit">드레스</h2>
		<div class="simulator-select-box">
			<div class="simulator-select-con">
				<c:choose>
					<c:when test="${empty dList }">
						<p class="none">검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty dList }">
						<div class="simulator-select-group">
							<!-- 선택 안할때 버튼 -->
							<button class="none-btn dress-none">고르지 않기</button>
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="${dTotal }" value="" class="more-btn" id="dress-more"></button> 
							<ul class="simulator-select-group-list dress-group-list clearfix">
								<c:forEach items="${dList }" var="d">
									<!-- <li class="simulator-select-list-con">
										<div class="simulator-select-list">
											<div class="simulator-select-img-thum">
												<span style="background:url('/resources/upload/dress/${d.dressFilepath}') no-repeat center center; background-size:cover;"></span>
											</div>
											<h3 class="simulator-select-list-tit">${d.dressName }</h3>
											<p class="simulator-select-list-addr">${d.dressAddr }</p>
											<p class="simulator-select-list-price">평균 <b>${d.dressRentPrice }</b> 원</p>
											<c:if test="${not empty d.dressTag }">
												<p class="simulator-select-list-tag">${d.dressTag }</p>
											</c:if>
											<c:if test="${empty d.dressTag }">
												<p class="simulator-select-list-tag">관련 태그 없음</p>
											</c:if>
										</div>
										<div class="simulator-select-btn-group">
											<button class="btn-1">상세 보기</button>
											<button type="submit" class="btn-2">맘에 들어!</button>
										</div>
									</li> -->
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<!-- 웨딩 메이크업 -->
		<h2 class="simulator-select-tit">메이크업&헤어</h2>
		<div class="simulator-select-box">
			<div class="simulator-select-con">
				<c:choose>
					<c:when test="${empty mList }">
						<p class="none">검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty mList }">
						<div class="simulator-select-group">
							<!-- 선택 안할때 버튼 -->
							<button class="none-btn makeup-none">고르지 않기</button>
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="${mTotal }" value="" class="more-btn" id="makeup-more"></button> 
							<ul class="simulator-select-group-list makeup-group-list clearfix">
								<c:forEach items="${mList }" var="make">
									<!-- <li class="simulator-select-list-con">
										<div class="simulator-select-list">
											<div class="simulator-select-img-thum">
												<span style="background:url('/resources/upload/makeup/${m.makeupFilepath}') no-repeat center center; background-size:cover;"></span>
											</div>
											<h3 class="simulator-select-list-tit">${m.dressName }</h3>
											<p class="simulator-select-list-addr">${m.dressAddr }</p>
											<p class="simulator-select-list-price">평균 <b>${m.dressRentPrice }</b> 원</p>
											<c:if test="${not empty m.dressTag }">
												<p class="simulator-select-list-tag">${m.dressTag }</p>
											</c:if>
											<c:if test="${empty m.dressTag }">
												<p class="simulator-select-list-tag">관련 태그 없음</p>
											</c:if>
										</div>
										<div class="simulator-select-btn-group">
											<button class="btn-1">상세 보기</button>
											<button type="submit" class="btn-2">맘에 들어!</button>
										</div>
									</li> -->
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<!-- 웨딩 스튜디오 -->
		<h2 class="simulator-select-tit">스튜디오</h2>
		<div class="simulator-select-box">
			<div class="simulator-select-con">
				<c:choose>
					<c:when test="${empty stList }">
						<p class="none">검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty stList }">
						<div class="simulator-select-group">
							<!-- 선택 안할때 버튼 -->
							<button class="none-btn studio-none">고르지 않기</button>
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="${stTotal }" value="" class="more-btn" id="studio-more"></button> 
							<ul class="simulator-select-group-list studio-group-list clearfix">
								<c:forEach items="${stList }" var="st">
									<!-- <li class="simulator-select-list-con">
										<div class="simulator-select-list">
											<div class="simulator-select-img-thum">
												<span style="background:url('/resources/upload/studio/${st.studioFilepath}') no-repeat center center; background-size:cover;"></span>
											</div>
											<h3 class="simulator-select-list-tit">${st.studioName }</h3>
											<p class="simulator-select-list-addr">${st.studioAddr }</p>
											<p class="simulator-select-list-price">평균 <b>${st.studioPrice }</b> 원</p>
											<c:if test="${not empty st.studioTag }">
												<p class="simulator-select-list-tag">${st.studioTag }</p>
											</c:if>
											<c:if test="${empty st.studioTag }">
												<p class="simulator-select-list-tag">관련 태그 없음</p>
											</c:if>
										</div>
										<div class="simulator-select-btn-group">
											<button class="btn-1">상세 보기</button>
											<button type="submit" class="btn-2">맘에 들어!</button>
										</div>
									</li> -->
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<!-- 안내 문구 -->
		<div class="simulator-select-comment">
			<p class="simulator-select-txt">너무 신중하게 고르지 마시고 한 눈에 반한 곳을 찍어보세요.</p>
			<p class="simulator-select-txt">지금은 내게 필요한 것이 무엇인지, 전체 가격이 얼마가 들지를 계산해보는 단계니까요</p>
			<p class="simulator-select-txt" style="color:red; font-weight:500;">각 카테고리 선택 후 우측 하단의 버튼을 눌러 나오는 보관함을 통해 상세 계산 내역을 산출할 수 있습니다.</p>
		</div>
		
		<!-- 보관함 SideBar -->
		<aside class="cart-sideBar">
			<button class="cart-sideBar-btn"></button>
			<div class="cart-sideBar-container">
				<div class="cart-sideBar-inner">
					<h2>보관함</h2>
					<ul class="selected-list">
						<!-- 선택된 옵션이 들어가는 자리 -->
					</ul>
					<button class="go-simulation">나의 웨딩 계산결과 보기</button>
				</div>
			</div>
		</aside>
	</div>
</section>


<script>
// 로드완료 되면 사진 게시물 3개 바로 가져와서 보여주게
$(document).ready(function(){
	//슬라이드
	$('.simulator-select-group-list').slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		arrows: true,
		fade: false,
		dots:false,
		autoplay: false,
		speed:800,
		infinite:false,
		autoplaySpeed: 3000,
		easing: 'easeInOutQuint',
		pauseOnHover:false,
		prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Prev" tabindex="0" role="button"><img src="/resources/img/left_arrow.png"></button>',
		nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button"><img src="/resources/img/right_arrow.png"></button>',
	});
	
	//장바구니
	var $menuOpenBtn = $(".cart-sideBar .cart-sideBar-btn");
	var $cartSideBar = $(".cart-sideBar-container");
	var menuState = false;
	
	$menuOpenBtn.click(function () {
		if ( menuState ) {
			menuClose();
			menuState = false;
			$(this).removeClass("active");
		}else {
			menuOpen();
			menuState = true;
			$(this).addClass("active");
		}
		return false;
	});

	//장바구니 :: 열기
	function menuOpen () {
		$cartSideBar.addClass("open");
	}
	//장바구니 :: 닫기
	function menuClose () {
		$cartSideBar.removeClass("open");
	}
	
	//고르지 않기
	$(".none-btn").each(function(){
		$(this).on('click',function(){
			$(this).addClass('selected');
			$(this).siblings(".simulator-select-group-list").addClass('selected');
		})
	});
	
	//웨딩홀 더보기
	hall_more(1);
	$("#hall-more").on('click',function(){
		hall_more($(this).val());
	});
	
	//드레스 더보기
	dress_more(1);
	$("#dress-more").on('click',function(){
		dress_more($(this).val()); //$(this).val() : 다음 시작값 
	});
	
	//메이크업 더보기
	makeup_more(1);
	$("#makeup-more").on('click',function(){
		makeup_more($(this).val()); //$(this).val() : 다음 시작값 
	});
	
	//스튜디오 더보기
	studio_more(1);
	$("#studio-more").on('click',function(){
		studio_more($(this).val()); //$(this).val() : 다음 시작값 
	});
	
});

// 맘에 들어 선택 시/*function cart_select(){
	//$(this).removeAttr('tabindex');
	//$(this).parent().parent().addClass('selected');
	//if($(this).parent().parent().has("selected")){
		//$(this).parents(".simulator-select-group-list").find(".simulator-select-btn-group").css('display','none');
		//var $cart = $(this).parent().parent(".selected").removeClass('slick-current slick-slide slick-active').clone().appendTo('.selected-list');
		//$(".selected-list").append($cart.removeAttr('data-slick-index').removeAttr('aria-hidden').removeAttr('tabindex').removeAttr('role').removeAttr('style'));
	//}
}*/


//웨딩홀 더보기
function hall_more(start){
	var param = {start : start, weddingPerson : $("#weddingPerson").val(), weddingLoc : $("#weddingLoc").val(), weddingDate : $("#weddingDate").val()}; //start라는 키값 넘겨줌
	$.ajax({
		url : "/hallMore.do",
		data : param,
		type : "post",
		dataType : "json",
		success : function(data){
			var html="";
			var h;
			for(var i in data){
				h = data[i];
				for(var j=0;j<h.length;j++){
					html += "<li class='simulator-select-list-con'><div class='simulator-select-list'><div class='simulator-select-img-thum'>";
					html += "<span style='background:#f5f5f5 url('/resources/upload/hall/"+h[j].hallPath+"') no-repeat center center; background-size:cover;'></span></div>";
					html += "<em class='simulator-select-list-no'>"+h[j].hallNo+"</em><em class='simulator-select-list-code'>"+h[j].code+"</em>";
					html += "<h3 class='simulator-select-list-tit'>"+h[j].hallName+"</h3>";
					html += "<p class='simulator-select-list-addr'>"+h[j].hallAddr+"</p>";
					html += "<p class='simulator-select-list-price'>평균 <b>"+h[j].hallPrice+"</b> 원</p>";
					html += "<p class='simulator-select-list-tag'>"+h[j].hallTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='' class='btn-1'>상세 보기</a><button class='btn-2 hall-select'>맘에 들어!</button></div>";
					console.log(h.length);
				}
			}
			//웨딩홀 더보기 출력
			//slideIndex++;
			$('.hall-group-list').slick('slickAdd',html);
			
			//$(".hall-group-list").append(html);
			
			//value, currentCount 세팅
			$("#hall-more").val(Number(start)+3); //start값 형변환 반드시! <- val는 다음 시작값
			$("#hall-more").attr("currentCount",Number($("#hall-more").attr("currentCount"))+h.length); //현재 currentCount + 넘어온 데이터의 길이
			
			//마지막까지 가져온 경우 더보기 버튼 비활성화
			var totalCount = $("#hall-more").attr("totalCount");
			var currentCount = $("#hall-more").attr("currentCount");
			if(totalCount == currentCount){ //마지막까지 다 가져왔을 때
				$("#hall-more").attr("disabled",true);
				$("#hall-more").attr("cursor","not-allowed");
				$("#hall-more").css('display','none');
			}
			
			// 홀 맘에 들어 클릭 시
			$(".hall-select").on('click',function(){
				$(this).parent().parent().addClass('selected');
				$(this).parents(".simulator-select-group-list").addClass('selected');
				if($(this).parent().parent().hasClass("selected")){
					var $cart = $(this).parent().parent(".selected").clone();
					$(".selected-list").append($cart.removeClass('slick-current slick-slide slick-active selected').removeAttr('data-slick-index aria-hidden tabindex role style'));
				}
			});
						
		},
		error : function(data){
			console.log("웨딩홀 ajax 처리 실패");
		}
	});
}

//드레스 더보기
function dress_more(start){
	var param = {start : start, weddingPerson : $("#weddingPerson").val(), weddingLoc : $("#weddingLoc").val(), weddingDate : $("#weddingDate").val()}; //start라는 키값 넘겨줌
	$.ajax({
		url : "/dressMore.do",
		data : param,
		type : "post",
		dataType : "json",
		success : function(data){ //dress 객체를 받아오기 때문에 리턴 값 있음 -> data 매개변수 필요 / data 타입은 list
			var html = "";
			var d;
			for(var i in data){ //for in문
				d = data[i]; //dress 객체
				for(var j=0;j<d.length;j++){
					html += "<li class='simulator-select-list-con'><div class='simulator-select-list'><div class='simulator-select-img-thum'>";
					html += "<span style='background:#f5f5f5 url('/resources/upload/dress/"+d[j].dressFilepath+"') no-repeat center center; background-size:cover;'></span></div>";
					html += "<em class='simulator-select-list-no'>"+d[j].dressNo+"</em><em class='simulator-select-list-code'>"+d[j].code+"</em>";
					html += "<h3 class='simulator-select-list-tit'>"+d[j].dressName+"</h3>";
					html += "<p class='simulator-select-list-addr'>"+d[j].dressAddr+"</p>";
					html += "<p class='simulator-select-list-price'>평균 <b>"+d[j].dressRentPrice+"</b> 원</p>";
					html += "<p class='simulator-select-list-tag'>"+d[j].dressTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewDress.do?dressNo="+d[j].dressNo+"' class='btn-1'>상세 보기</a><button class='btn-2 dress-select'>맘에 들어!</button></div>";
					console.log(d.length);
				}
			}
			
			//드레스 더보기 출력
			//slideIndex++;
			$('.dress-group-list').slick('slickAdd',html);
			
			//드레스 더보기 출력
			//$(".dress-group-list").append(html);
			
			//value, currentCount 세팅
			$("#dress-more").val(Number(start)+3); //start값 형변환 반드시! <- val는 다음 시작값
			$("#dress-more").attr("currentCount",Number($("#dress-more").attr("currentCount"))+d.length); //현재 currentCount + 넘어온 데이터의 길이
			
			//마지막까지 가져온 경우 더보기 버튼 비활성화
			var totalCount = $("#dress-more").attr("totalCount");
			var currentCount = $("#dress-more").attr("currentCount");
			if(totalCount == currentCount){ //마지막까지 다 가져왔을 때
				$("#dress-more").attr("disabled",true);
				$("#dress-more").attr("cursor","not-allowed");
				$("#dress-more").css('display','none');
			}
			
			// 드레스 맘에 들어 선택 시
			$(".dress-select").on('click',function(){
				$(this).parent().parent().addClass('selected');
				$(this).parents(".simulator-select-group-list").addClass('selected');
				if($(this).parent().parent().hasClass("selected")){
					var $cart = $(this).parent().parent(".selected").clone();
					$(".selected-list").append($cart.removeClass('slick-current slick-slide slick-active selected').removeAttr('data-slick-index aria-hidden tabindex role style'));
				}
			});
		},
		error : function(data){
			console.log("드레스 ajax 처리 실패");
		}
	});
}

//메이크업 더보기
function makeup_more(start){
	var param = {start : start, weddingPerson : $("#weddingPerson").val(), weddingLoc : $("#weddingLoc").val(), weddingDate : $("#weddingDate").val()}; //start라는 키값 넘겨줌
	$.ajax({
		url : "/makeupMore.do",
		data : param,
		type : "post",
		dataType : "json",
		success : function(data){ //makeup 객체를 받아오기 때문에 리턴 값 있음 -> data 매개변수 필요 / data 타입은 list
			var html = "";
			var make;
			for(var i in data){ //for in문
				make = data[i]; //makeup 객체
				for(var j=0;j<make.length;j++){
					html += "<li class='simulator-select-list-con'><div class='simulator-select-list'><div class='simulator-select-img-thum'>";
					html += "<span style='background:#f5f5f5 url('/resources/upload/makeup/"+make[j].makeupFilepath+"') no-repeat center center; background-size:cover;'></span></div>";
					html += "<em class='simulator-select-list-no'>"+make[j].makeupNo+"</em><em class='simulator-select-list-code'>"+make[j].code+"</em>";
					html += "<h3 class='simulator-select-list-tit'>"+make[j].makeupName+"</h3>";
					html += "<p class='simulator-select-list-addr'>"+make[j].makeupAddr+"</p>";
					html += "<p class='simulator-select-list-price'>평균 <b>"+make[j].makeupBasicPrice+"</b> 원</p>";
					html += "<p class='simulator-select-list-tag'>"+make[j].makeupTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewMakeup.do?makeupNo="+make[j].makeupNo+"' class='btn-1'>상세 보기</a><button class='btn-2 makeup-select'>맘에 들어!</button></div>";
					console.log(make.length);
				}
			}
			
			//메이크업 더보기 출력
			//slideIndex++;
			$('.makeup-group-list').slick('slickAdd',html);
			
			//메이크업 더보기 출력
			//$(".makeup-group-list").append(html);
			
			//value, currentCount 세팅
			$("#makeup-more").val(Number(start)+3); //start값 형변환 반드시! <- val는 다음 시작값
			$("#makeup-more").attr("currentCount",Number($("#makeup-more").attr("currentCount"))+make.length); //현재 currentCount + 넘어온 데이터의 길이
			
			//마지막까지 가져온 경우 더보기 버튼 비활성화
			var totalCount = $("#makeup-more").attr("totalCount");
			var currentCount = $("#makeup-more").attr("currentCount");
			if(totalCount == currentCount){ //마지막까지 다 가져왔을 때
				$("#makeup-more").attr("disabled",true);
				$("#makeup-more").attr("cursor","not-allowed");
				$("#makeup-more").css('display','none');
			}
			
			// 메이크업 맘에 들어 선택 시
			$(".makeup-select").on('click',function(){
				$(this).parent().parent().addClass('selected');
				$(this).parents(".simulator-select-group-list").addClass('selected');
				if($(this).parent().parent().hasClass("selected")){
					var $cart = $(this).parent().parent(".selected").clone();
					$(".selected-list").append($cart.removeClass('slick-current slick-slide slick-active selected').removeAttr('data-slick-index aria-hidden tabindex role style'));
				}
			});
		},
		error : function(data){
			console.log("메이크업 ajax 처리 실패");
		}
	});
}

//스튜디오 더보기
function studio_more(start){
	var param = {start : start, weddingPerson : $("#weddingPerson").val(), weddingLoc : $("#weddingLoc").val(), weddingDate : $("#weddingDate").val()}; //start라는 키값 넘겨줌
	$.ajax({
		url : "/studioMore.do",
		data : param,
		type : "post",
		dataType : "json",
		success : function(data){ //makeup 객체를 받아오기 때문에 리턴 값 있음 -> data 매개변수 필요 / data 타입은 list
			var html = "";
			var st;
			for(var i in data){ //for in문
				st = data[i]; //makeup 객체
				for(var j=0;j<st.length;j++){
					html += "<li class='simulator-select-list-con'><div class='simulator-select-list'><div class='simulator-select-img-thum'>";
					html += "<span style='background:#f5f5f5 url('/resources/upload/studio/"+st[j].studioFilepath+"') no-repeat center center; background-size:cover;'></span></div>";
					html += "<em class='simulator-select-list-no'>"+st[j].studioNo+"</em><em class='simulator-select-list-code'>"+st[j].code+"</em>";
					html += "<h3 class='simulator-select-list-tit'>"+st[j].studioName+"</h3>";
					html += "<p class='simulator-select-list-addr'>"+st[j].studioAddr+"</p>";
					html += "<p class='simulator-select-list-price'>평균 <b>"+st[j].studioPrice+"</b> 원</p>";
					html += "<p class='simulator-select-list-tag'>"+st[j].studioTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewStudio.do?studioNo="+st[j].studioNo+"' class='btn-1'>상세 보기</a><button class='btn-2 studio-select'>맘에 들어!</button></div>";
					console.log(st.length);
				}
			}
			
			//스튜디오 더보기 출력
			//slideIndex++;
			$('.studio-group-list').slick('slickAdd',html);
			
			//스튜디오 더보기 출력
			//$(".studio-group-list").append(html);
			
			//value, currentCount 세팅
			$("#studio-more").val(Number(start)+3); //start값 형변환 반드시! <- val는 다음 시작값
			$("#studio-more").attr("currentCount",Number($("#studio-more").attr("currentCount"))+st.length); //현재 currentCount + 넘어온 데이터의 길이
			
			//마지막까지 가져온 경우 더보기 버튼 비활성화
			var totalCount = $("#studio-more").attr("totalCount");
			var currentCount = $("#studio-more").attr("currentCount");
			if(totalCount == currentCount){ //마지막까지 다 가져왔을 때
				$("#studio-more").attr("disabled",true);
				$("#studio-more").attr("cursor","not-allowed");
				$("#studio-more").css('display','none');
			}
			
			// 스튜디오 맘에 들어 선택 시
			$(".studio-select").on('click',function(){
				$(this).parent().parent().addClass('selected');
				$(this).parents(".simulator-select-group-list").addClass('selected');
				if($(this).parent().parent().hasClass("selected")){
					var $cart = $(this).parent().parent(".selected").clone();
					//var $list = $cart.toArray();
					console.log($cart);
					$(".selected-list").append($list.removeClass('slick-current slick-slide slick-active selected').removeAttr('data-slick-index aria-hidden tabindex role style'));
				}
			});
		},
		error : function(data){
			console.log("스튜디오 ajax 처리 실패");
		}
	});
}
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
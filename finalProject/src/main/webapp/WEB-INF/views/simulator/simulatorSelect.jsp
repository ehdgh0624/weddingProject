<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Sub --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<script type="text/javascript" src="/resources/js/content.js"></script><!-- common.js -->

<%-- wrap --%>
<section id="wrap">
	<div class="area" style="padding-top:50px;">
		<input type="hidden" id="weddingLoc" name="weddingLoc" value="${simulator.weddingLoc }">
		<input type="hidden" id="weddingDate" name="weddingDate" value="${simulator.weddingDate }">
		<input type="hidden" id="weddingPerson" name="weddingPerson" value="${simulator.weddingPerson }">
		<!-- 웨딩홀 -->
		<h2 class="simulator-select-tit">웨딩홀</h2>
		<div class="simulator-select-box">
			<div class="simulator-select-con">
				<c:choose>
					<c:when test="${empty hList }">
						<p class="none">${msg }</p>
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
						<p class="none">${msg }</p>
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
						<p class="none">${msg }</p>
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
						<p class="none">${msg }</p>
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
			<button class="cart-sideBar-btn"><img src="/resources/img/cart.png"></button>
			<div class="cart-sideBar-container">
				<div class="cart-sideBar-inner">
					<h2>보관함</h2>
					<ul class="selected-list">
						<!-- 선택된 옵션이 들어가는 자리 -->
						<form id="cartSideBar" action="/simulatorCheck.do" method="post">
							<input type="hidden" name="weddingLoc" value="${simulator.weddingLoc }">
							<input type="hidden" name="weddingDate" value="${simulator.weddingDate }">
							<input type="hidden" name="weddingPerson" value="${simulator.weddingPerson }">
							<input type="hidden" name="option">	
							<button type="submit" class="go-simulation">나의 웨딩 계산결과 보기</button>
						</form>
					</ul>
				</div>
			</div>
		</aside>
	</div>
</section>


<script>
//맘에 들어 클릭 시
function cart_click(cart){
	$(cart).parent().parent().parent().parent().parent(".simulator-select-group-list").siblings('.none-btn').hide();
	$(cart).parent().parent().addClass('selected');
	$(cart).parent().parent().parent().parent().parent(".simulator-select-group-list").addClass('selected');
	if($(cart).parent().parent().hasClass("selected")){
		var $cart = $(cart).parent().parent(".selected").clone();
		$(".selected-list").children("#cartSideBar").append($cart.removeClass('slick-current slick-slide slick-active selected').removeAttr('data-slick-index aria-hidden tabindex role style'));
		$(".selected-list").find('.simulator-select-btn-group').remove();
	}
}

//콤마찍기
function addComma(num) {
  return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

$(document).ready(function(){
	//나의 웨딩 계산결과 보기
	$(".go-simulation").click(function(e){
		e.preventDefault();
		
		var cartArr = [];
		$('#cartSideBar').children('.simulator-select-list-con').each(function(){
			var cartOneArr = {};
			cartOneArr[0] = $(this).find('.simulator-select-img-thum').children('span').html();
			cartOneArr[1] = $(this).find('.simulator-select-list-no').html();
			cartOneArr[2] = $(this).find('.simulator-select-list-code').html();
			cartOneArr[3] = $(this).find('.simulator-select-list-tel').html();
			cartOneArr[4] = $(this).find('.simulator-select-list-tit').html();
			cartOneArr[5] = $(this).find('.simulator-select-list-addr').html();
			cartOneArr[6] = $(this).find('.simulator-select-list-price').children('em').html();
			//cartOneArr[6] = $(this).find('.simulator-select-list-price').val();
			cartOneArr[7] = $(this).find('.simulator-select-list-tag').html();
			
			cartArr.push(cartOneArr);
			
			console.log(cartOneArr);
			console.log(cartArr);
		});
		
		//자바스크립트 배열을 json String 형식으로 변환
		var option = JSON.stringify(cartArr);
		console.log(option);
		
		$("input[name=option]").val(option);
		$("#cartSideBar")[0].submit();
	});
	
	//고르지 않기
	$(".none-btn").each(function(){
		$(this).on('click',function(){
			$(this).addClass('selected');
			$(this).siblings(".simulator-select-group-list").addClass('selected');
		})
	});
	
	// 로드완료 되면 사진 게시물 3개 바로 가져와서 보여주게
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
					html += "<span style='background:#f5f5f5 url("+h[j].hallPath+") no-repeat center center; background-size:cover;' value="+h[j].hallPath+">"+h[j].hallPath+"</span></div>";
					html += "<em class='simulator-select-list-no' value="+h[j].hallNo+">"+h[j].hallNo+"</em><em class='simulator-select-list-code' value="+h[j].code+">"+h[j].code+"</em><em class='simulator-select-list-tel' value="+h[j].hallTel+">"+h[j].hallTel+"</em>";
					html += "<h3 class='simulator-select-list-tit' value="+h[j].hallName+">"+h[j].hallName+"</h3>";
					html += "<p class='simulator-select-list-addr' value="+h[j].hallAddr+">"+h[j].hallAddr+"</p>";
					html += "<p class='simulator-select-list-price' value="+h[j].hallPrice+">평균 <b>"+h[j].hallPrice+"</b><em>"+h[j].hallPrice+"</em> 원</p>";
					html += "<p class='simulator-select-list-tag' value="+h[j].hallTag+">"+h[j].hallTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/hallView.do?hallNo="+h[j].hallNo+"' class='btn-1'>상세 보기</a><button class='btn-2 hall-select' onclick='cart_click(this)'>맘에 들어!</button></div>";
					console.log(h.length);
				}
			}
			
			//웨딩홀 더보기 출력
			$('.hall-group-list').slick('slickAdd',html);
			
			$(".simulator-select-list-price").each(function(){
				$(this).children("b").text(addComma($(this).children("b").html()));
			});
			
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
					html += "<span style='background:#f5f5f5 url("+d[j].dressFilepath+") no-repeat center center; background-size:cover;' value="+d[j].dressFilepath+">"+d[j].dressFilepath+"</span></div>";
					html += "<em class='simulator-select-list-no' value="+d[j].dressNo+">"+d[j].dressNo+"</em><em class='simulator-select-list-code' value="+d[j].code+">"+d[j].code+"</em><em class='simulator-select-list-tel' value="+d[j].dressTel+">"+d[j].dressTel+"</em>";
					html += "<h3 class='simulator-select-list-tit' value="+d[j].dressName+">"+d[j].dressName+"</h3>";
					html += "<p class='simulator-select-list-addr' value="+d[j].dressAddr+">"+d[j].dressAddr+"</p>";
					html += "<p class='simulator-select-list-price' value="+d[j].dressRentPrice+">평균 <b>"+d[j].dressRentPrice+"</b><em>"+d[j].dressRentPrice+"</em> 원</p>";
					html += "<p class='simulator-select-list-tag' value="+d[j].dressTag+">"+d[j].dressTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewDress.do?dressNo="+d[j].dressNo+"' class='btn-1'>상세 보기</a><button class='btn-2 dress-select' onclick='cart_click(this)'>맘에 들어!</button></div>";
					console.log(d.length);
				}
			}
			
			//드레스 더보기 출력
			$('.dress-group-list').slick('slickAdd',html);
			
			$(".simulator-select-list-price").each(function(){
				$(this).children("b").text(addComma($(this).children("b").html()));
			});
			
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
					html += "<span style='background:#f5f5f5 url("+make[j].makeupFilepath+") no-repeat center center; background-size:cover;' value="+make[j].makeupFilepath+">"+make[j].makeupFilepath+"</span></div>";
					html += "<em class='simulator-select-list-no' value="+make[j].makeupNo+">"+make[j].makeupNo+"</em><em class='simulator-select-list-code' value="+make[j].code+">"+make[j].code+"</em><em class='simulator-select-list-tel' value="+make[j].makeupTel+">"+make[j].makeupTel+"</em>";
					html += "<h3 class='simulator-select-list-tit' value="+make[j].makeupName+">"+make[j].makeupName+"</h3>";
					html += "<p class='simulator-select-list-addr' value="+make[j].makeupAddr+">"+make[j].makeupAddr+"</p>";
					html += "<p class='simulator-select-list-price' value="+make[j].makeupBasicPrice+">평균 <b>"+make[j].makeupBasicPrice+"</b><em>"+make[j].makeupBasicPrice+"</em> 원</p>";
					html += "<p class='simulator-select-list-tag' value="+make[j].makeupTag+">"+make[j].makeupTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewMakeup.do?makeupNo="+make[j].makeupNo+"' class='btn-1'>상세 보기</a><button class='btn-2 makeup-select' onclick='cart_click(this)'>맘에 들어!</button></div>";
					console.log(make.length);
				}
			}
			
			//메이크업 더보기 출력
			$('.makeup-group-list').slick('slickAdd',html);
			
			$(".simulator-select-list-price").each(function(){
				$(this).children("b").text(addComma($(this).children("b").html()));
			});
			
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
					html += "<span value="+st[j].studioFilepath+" style='background:#f5f5f5 url("+st[j].studioFilepath+") no-repeat center center; background-size:cover;'>"+st[j].studioFilepath+"</span></div>";
					html += "<em class='simulator-select-list-no' value="+st[j].studioNo+">"+st[j].studioNo+"</em><em class='simulator-select-list-code' value="+st[j].code+">"+st[j].code+"</em><em class='simulator-select-list-tel' value="+st[j].studioTel+">"+st[j].studioTel+"</em>";
					html += "<h3 class='simulator-select-list-tit' value="+st[j].studioName+">"+st[j].studioName+"</h3>";
					html += "<p class='simulator-select-list-addr' value="+st[j].studioAddr+">"+st[j].studioAddr+"</p>";
					html += "<p class='simulator-select-list-price' value="+st[j].studioPrice+">평균 <b>"+st[j].studioPrice+"</b><em>"+st[j].studioPrice+"</em> 원</p>";
					html += "<p class='simulator-select-list-tag' value="+st[j].studioTag+">"+st[j].studioTag+"</p></div>";
					html += "<div class='simulator-select-btn-group'><a href='/collectionViewStudio.do?studioNo="+st[j].studioNo+"' class='btn-1'>상세 보기</a><button class='btn-2 studio-select' onclick='cart_click(this)'>맘에 들어!</button></div>";
					console.log(st.length);
				}
			}
			
			//스튜디오 더보기 출력
			$('.studio-group-list').slick('slickAdd',html);
			
			$(".simulator-select-list-price").each(function(){
				$(this).children("b").text(addComma($(this).children("b").html()));
			});
			
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
		},
		error : function(data){
			console.log("스튜디오 ajax 처리 실패");
		}
	});
}
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
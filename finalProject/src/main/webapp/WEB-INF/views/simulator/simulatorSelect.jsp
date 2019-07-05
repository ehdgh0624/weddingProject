<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
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
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="" value="" class="more-btn" id="more-btn1"></button> 
							<ul class="simulator-select-group-list clearfix">
								<c:forEach items="${hList }" var="h">
									<li class="simulator-select-list-con">
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
									</li>
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
							<!-- currentCount : 지금 사진을 몇번까지 봤는지 확인할 변수 // totalCount : 사진이 총 몇개인지 // value : 다음에 가져올 사진 시작번호 수 지정(다음 시작값) -->
							<button currentCount="0" totalCount="${dTotal }" value="" class="more-btn" id="more-btn2"></button> 
							<ul class="simulator-select-group-list dress-group-list clearfix">
								<c:forEach items="${dList }" var="d">
									<li class="simulator-select-list-con">
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
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		
		<!-- 웨딩 메이크업 -->
		<h2 class="simulator-select-tit">메이크업&헤어</h2>
		
		<!-- 웨딩 스튜디오 -->
		<h2 class="simulator-select-tit">스튜디오</h2>
		
		<div class="simulator-select-comment">
			<p class="simulator-select-txt">너무 신중하게 고르지 마시고 한 눈에 반한 곳을 찍어보세요.</p>
			<p class="simulator-select-txt">지금은 내게 필요한 것이 무엇인지, 전체 가격이 얼마가 들지를 계산해보는 단계니까요</p>
		</div>
		
	</div>
</section>

<script>
//로드완료 되면 사진 게시물 3개 바로 가져와서 보여주게
$(document).ready(function(){
	fn_more(1);
	$("#more-btn2").click(function(){
		fn_more($(this).val()); //$(this).val() : 다음 시작값 
	});
});

// 더보기
function fn_more(start){
	var param = {start : start}; //start라는 키값 넘겨줌
	$.ajax({
		url : "/dressMore.do",
		data : param,
		type : "post",
		dataType : "json",
		success : function(data){ //photo 객체를 받아오기 때문에 리턴 값 있음 -> data 매개변수 필요 / data 타입은 list
			var html = "";
			for(var i in data){ //for in문
				var d = data[i]; //dress 객체
				html += "<li class='simulator-select-list-con'><div class='simulator-select-list'><div class='simulator-select-img-thum'>";
				html += "<span style='background:url('/resources/upload/dress/"+d.dressFilepath+"') no-repeat center center; background-size:cover;'></span>";
				html += "<h3 class='simulator-select-list-tit'>"+d.dressName+"</h3>";
				html += "<p class='simulator-select-list-addr'>"+d.dressAddr+"</p>";
				html += "<p class='simulator-select-list-price'>평균 <b>"+d.dressRentPrice+"</b> 원</p>";
				html += "<p class='simulator-select-list-tag'>"+d.dressTag+"</p></div>";
				html += "<div class='simulator-select-btn-group'><button class='btn-1'>상세 보기</button><button type='submit' class='btn-2'>맘에 들어!</button></div>";
			}
			//드레스 더보기 출력
			$(".dress-group-list").append(html);
			
			//value, currentCount 세팅
			$("#more-btn2").val(Number(start)+3); //start값 형변환 반드시! <- val는 다음 시작값
			$("#more-btn2").attr("currentCount",Number($("#more-btn2").attr("currentCount"))+data.length); //현재 currentCount + 넘어온 데이터의 길이
			
			//마지막까지 가져온 경우 더보기 버튼 비활성화
			var totalCount = $("#more-btn2").attr("totalCount");
			var currentCount = $("#more-btn2").attr("currentCount");
			if(totalCount == currentCount){ //마지막까지 다 가져왔을 때
				$("#more-btn2").attr("disabled",true);
				$("#more-btn2").attr("cursor","not-allowed");
			}
		},
		error : function(data){
			console.log("ajax 처리 실패");
		}
	});
}
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
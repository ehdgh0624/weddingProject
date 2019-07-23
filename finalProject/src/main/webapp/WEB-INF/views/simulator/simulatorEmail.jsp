<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Sub --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>


<script>
function addComma(num) {
	return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

$(document).ready(function(){//
	$(".simulator-info-price").each(function(){
		$(this).find("strong").text(addComma($(this).find("strong").html()));
	});
	
	$(".simulator-total-price").each(function(){
		$(this).find("p").children("b").text(addComma($(this).find("p").children("b").html()));
	});
});
</script>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<div class="simulator-box type2">
			<h2 class="simulator-tit">나의 뚝딱뚝딱 계산내역</h2>
			<p class="simulator-sub-tit">평균가격과 필요한 항목 확인하기</p>
			<dl class="simulator-topInfo clearfix">
				<dt><img src="/resources/img/icon_date.png" width="20"> &nbsp;예식일</dt>
				<dd>: <p>${simulator.weddingDate }</p></dd>
				<dt><img src="/resources/img/icon_loc.png" width="20"> &nbsp;지역</dt>
				<dd>: <p>${simulator.weddingLoc }</p></dd>
				<dt><img src="/resources/img/icon_person.png" width="20"> &nbsp;하객수</dt>
				<dd>: <p>${simulator.weddingPerson }명</p></dd>
			</dl>
			
			<div class="simulator-bottomInfo">
				<c:if test="${not empty simulatorList }">
					<c:forEach items="${simulatorList }" var="slist">
						<div class="simulator-info-con">
							<h3 class="simulator-info-tit">
								<c:choose>
									<c:when test="${slist.code eq 'H' }"><span>웨딩홀</span></c:when>
									<c:when test="${slist.code eq 'D' }"><span>드레스</span></c:when>
									<c:when test="${slist.code eq 'M' }"><span>메이크업&헤어</span></c:when>
									<c:when test="${slist.code eq 'S' }"><span>스튜디오</span></c:when>
								</c:choose>
								${slist.prdName }
							</h3>
							<dl class="simulator-info-detail clearfix"><!-- prdFilepath -->
								<dt>
									<div class="simulator-info-img">
								<c:choose>
									<c:when test="${slist.code eq 'H' }"><span style="background:#f5f5f5 url(/resources/hall/${slist.prdFilepath }) no-repeat center center; background-size:cover;"></span></c:when>
									<c:when test="${slist.code eq 'D' }"><span style="background:#f5f5f5 url(/resources/dress/${slist.prdFilepath }) no-repeat center center; background-size:cover;"></span></c:when>
									<c:when test="${slist.code eq 'M' }"><span style="background:#f5f5f5 url(/resources/makeup/${slist.prdFilepath }) no-repeat center center; background-size:cover;"></span></c:when>
									<c:when test="${slist.code eq 'S' }"><span style="background:#f5f5f5 url(/resources/studio/${slist.prdFilepath }) no-repeat center center; background-size:cover;"></span></c:when>
								</c:choose>
									</div>
								</dt>
								<dd>
									<p class="simulator-info-addr">${slist.prdLoc }</p>
									<p class="simulator-info-tel">${slist.prdTel }</p>
									<p class="simulator-info-price">평균 견적가<br/> <b><strong>${slist.prdPrice }</strong> 원</b></p>
								</dd>
							</dl>
							<dl class="simulator-info-detail clearfix">
								<dt>
									<p class="simulator-info-tag">
										<c:forTokens var="tag" items="${slist.prdTag }" delims=",">
										    <span><c:out value="${tag}"/></span>
										</c:forTokens>
									</p>
								</dt>
								<dd>
									<div class="common-tbl-btn-group right" style="padding-top:0;">
										<c:choose>
											<c:when test="${slist.code eq 'H' }"><button class="btn-style1" style="margin:0;" onclick="location.href='/hallView.do?hallNo=${slist.prdNo}'">상세정보 보기</button></c:when>
											<c:when test="${slist.code eq 'D' }"><button class="btn-style1" style="margin:0;" onclick="location.href='/collectionViewDress.do?dressNo=${slist.prdNo}'">상세정보 보기</button></c:when>
											<c:when test="${slist.code eq 'M' }"><button class="btn-style1" style="margin:0;" onclick="location.href='/collectionViewMakeup.do?makeupNo=${slist.prdNo}'">상세정보 보기</button></c:when>
											<c:when test="${slist.code eq 'S' }"><button class="btn-style1" style="margin:0;" onclick="location.href='/collectionViewStudio.do?studioNo=${slist.prdNo}'">상세정보 보기</button></c:when>
										</c:choose>
									</div>
								</dd>
							</dl>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty simulatorList }">
					<div class="simulator-info-con">
						<p class="none">${msg }</p>
					</div>
				</c:if>
				<div class="simulator-total-price">
					<h2>
						<strong>평균 전체견적가</strong>
						<p><b>${simulator.simulatorTotalPrice }</b> 원</p>
					</h2>
				</div>
			</div><br><br>
			<!-- 안내 문구 -->
			<div class="simulator-select-comment">
				<p class="simulator-select-txt">상기가격은 평균가이므로 내게 맞는 상세한 가격을 산출하시려면 각 업체 하단의 상세보기를 눌러 주세요.</p>
				<p class="simulator-select-txt" style="color:red; font-weight:500;">로그인을 하신 후 견적을 보셨다면, 나의 페이지에 자동으로 견적내용이 저장됩니다.</p>
			</div>
			<div class="common-tbl-btn-group">
				<button class="btn-style1 big" onclick="location.href='/simulator/simulator.jsp'"><img src="/resources/img/icon_again.png" width="30">&nbsp;다시해보기</button>
			</div>
		</div>
	</div>
</section>

<%--  Footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
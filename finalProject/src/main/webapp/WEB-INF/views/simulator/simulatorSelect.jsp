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
						<p>검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty hList }">
						<div class="simulator-select-group">
							<ul class="simulator-select-list">
								<c:forEach items="${hList }" var="h">
									<li>
										<div class="simulator-select-img-thum">
											<span><img src="/resources/upload/hall/${h.hallPath}"></span>
										</div>
										<h3>${h.hallName }</h3>
										<p>${h.hallAddr }</p>
										<p>평균 <b>${h.hallPrice }</b></p>
										<p>${h.hallTag }</p>
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
						<p>검색 결과 없음</p>
					</c:when>
					<c:when test="${not empty dList }">
						<div class="simulator-select-group">
							<ul class="simulator-select-list">
								<c:forEach items="${dList }" var="d">
									<li>
										<div class="simulator-select-img-thum">
											<span><img src="/resources/upload/dress/${d.dressFilepath}"></span>
										</div>
										<h3>${d.dressName }</h3>
										<p>${d.dressAddr }</p>
										<p>평균 <b>${d.dressRentPrice }</b></p>
										<p>${d.dressTag }</p>
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
	
		<!-- <c:choose>
			<c:when test="${empty dList }">
				<p>글 없음</p>
			</c:when>
			<c:when test="${not empty dList }">
				<c:forEach items="${dList }" var="d">
					<p>${d.dressName }</p>
				</c:forEach>
			</c:when>
		</c:choose> -->		
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
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
		
		<!-- 웨딩 드레스 -->
		<h2 class="simulator-select-tit">드레스</h2>
		
		
		<!-- 웨딩 메이크업 -->
		<h2 class="simulator-select-tit">메이크업&헤어</h2>
		
		<!-- 웨딩 스튜디오 -->
		<h2 class="simulator-select-tit">스튜디오</h2>
		
		<div class="simulator-select-comment">
			<p class="simulator-select-txt">너무 신중하게 고르지 마시고 한 눈에 반한 곳을 찍어보세요.</p>
			<p class="simulator-select-txt">지금은 내게 필요한 것이 무엇인지, 전체 가격이 얼마가 들지를 계산해보는 단계니까요</p>
		</div>
	
		<c:choose>
			<c:when test="${empty mhList }">
				<p>글 없음</p>
			</c:when>
			<c:when test="${not empty mhList }">
				<c:forEach items="${mhList }" var="mh">
					<p>${mh.hallName }</p>
				</c:forEach>
			</c:when>
		</c:choose>		
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
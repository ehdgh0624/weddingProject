<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="area">
			<div class="common-tbl-box">
				<table class="comm-tbl">		
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="/">
					</colgroup>
					<c:if test="${not empty memberAll.studio}">	
						<c:forEach items="${memberAll.studio }" var="s">		
						<tr onclick="location.href='/companyDetailView.do?prdNo=${s.studioNo }&code=${s.code }'">
							<th>스튜디오</th>
							
							<th><span>${s.studioName }</span></th>
							
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty memberAll.dress}">		
						<c:forEach items="${memberAll.dress }" var="d">
						<tr onclick="location.href='/companyDetailView.do?prdNo=${d.dressNo }&code=${d.code }'">
							<th>드레스</th>
							<th><span>${d.dressName }</span></th>
						</tr>
						</c:forEach>	
					</c:if>
					<c:if test="${not empty memberAll.makeup}">		
						<c:forEach items="${memberAll.makeup }" var="m">
						<tr onclick="location.href='/companyDetailView.do?prdNo=${m.makeupNo }&code=${m.code }'">
							<th>메이크업</th>
							<th><span>${m.makeupName }</span></th>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty memberAll.hall}">	
					<c:forEach items="${memberAll.hall }" var="h">		
						<tr onclick="location.href='/companyDetailView.do?prdNo=${h.hallNo }&code=${h.code }'">
							<th>홀</th>
							<th><span>${h.hallName }</span></th>
						</tr>
					</c:forEach>
					</c:if>
				</table>		
				<c:if test="${empty memberAll.studio }">
					<c:if test="${empty memberAll.dress }">
						<c:if test="${empty memberAll.makeup }">
							<c:if test="${empty memberAll.hall }">
								<h1 class="none">등록된 업체가 없습니다.</h1>
								<div class="common-tbl-btn-group">
									<button class="btn-style1 big" onclick="location.href='/goCompanyTerms.do'">업체등록 하러가기</button>
									<!-- <a href="/goCompanyTerms.do">업체등록 하러가기</a> -->
								</div>
							</c:if>	
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


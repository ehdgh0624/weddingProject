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
				<div class="common-tbl-box">
				<table class="comm-tbl">		
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="/">
					</colgroup>
					
					<c:if test="${not empty memberAll.studio}">			
						<tr>
							<th>스튜디오</th>
							<th><span>${memberAll.studio.studioName }</span></th>
						</tr>
					</c:if>
					<c:if test="${not empty memberAll.dress}">			
						<tr>
							<th>드레스</th>
							<th><span>${memberAll.dress.dressName }</span></th>
						</tr>
					</c:if>
					<c:if test="${not empty memberAll.makeup}">			
						<tr>
							<th>메이크업</th>
							<th><span>${memberAll.makeup.makeupName }</span></th>
						</tr>
					</c:if>
					<c:if test="${not empty memberAll.hall}">			
						<tr>
							<th>홀</th>
							<th><span>${memberAll.hall.hallName }</span></th>
						</tr>
					</c:if>
				
				</table>
				
			<c:if test="${empty memberAll.studio }">
				<c:if test="${empty memberAll.dress }">
					<c:if test="${empty memberAll.makeup }">
						<c:if test="${empty memberAll.hall }">
							<h1>등록된 업체가없습니다.</h1>
							<a href="/addCompany.do">업체등록 하러가기</a>
						</c:if>	
					</c:if>
				</c:if>
			</c:if>
		</div>
		
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


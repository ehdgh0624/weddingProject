<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<c:if test="${not empty studio}">
			${studio.studioNo}
			<br>
			${studio.code}
			<br>
			${studio.studioName}
			<br>
			${studio.studioTel}
			<br>
			${studio.studioAddr}
			<br>
			${studio.studioPrice}
			<br>
			${studio.studioTag}
			<br>
			${studio.studioLatitude}
			<br>
			${studio.studioLongitud}
			<br>
		</c:if>
		<c:if test="${not empty studioSelectList}">
		
		</c:if>
		<c:if test="${not empty galleryList}">
		
		</c:if>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
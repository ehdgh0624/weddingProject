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
		<c:if test="${not empty pd.mList}">
			<c:forEach items="${pd.mList}" var="m">
				<a href="/collectionView.do?code=${m.code}&makeupNo=${m.makeupNo}">${m.makeupName}</a>			
			</c:forEach>
		</c:if>
		<c:if test="${not empty pd.dList}">
			<c:forEach items="${pd.dList}" var="d">
				<a href="/collectionView.do?code=${d.code}&dressNo=${d.dressNo}">${d.dressName}</a>			
			</c:forEach>
		</c:if>
		<c:if test="${not empty pd.sList}">
			<c:forEach items="${pd.sList}" var="s">
				<a href="/collectionView.do?code=${s.code}&studioNo=${s.studioNo}">${s.studioName}</a>			
			</c:forEach>
		</c:if>
		<div id="pageNavi">
			${pd.pageNavi}
		</div>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
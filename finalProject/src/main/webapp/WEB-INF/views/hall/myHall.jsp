<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/myHall.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- wrap --%>
<section id="wrap">
	<div>
		<section id="myHall">
			<div class="allDiv area">
				<div class="subDiv">
					<h2>나의 견적</h2><h1>나의 견적내역입니다</h1>
				</div>
			</div>		
		</section>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
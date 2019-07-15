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
		<c:choose>
			<c:when test="${cause == 1}">
				<script>
					alert("로그인 후 다시 시도해주세요.");
					location.href = "/loginPage.do";
				</script>
			</c:when>
			<c:when test="${cause == 2}">
				<script>
					alert("잘못된 요청입니다.");
					location.href = "/index.jsp";
				</script>
			</c:when>
			<c:when test="${cause == 3}">
				<script>
					alert("결제 실패 : 메인 페이지로 이동합니다.");
					location.href = "/index.jsp";
				</script>
			</c:when>
		</c:choose>
	</div>
</section>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
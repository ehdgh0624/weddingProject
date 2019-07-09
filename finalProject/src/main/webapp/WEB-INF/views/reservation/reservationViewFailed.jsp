<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<script>
			alert("로그인 후 다시 시도해주세요.");
			location.href = "/loginPage.do";
		</script>
	</div>
</section>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
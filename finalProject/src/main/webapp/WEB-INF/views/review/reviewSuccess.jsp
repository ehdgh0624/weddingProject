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
			<c:when test="${code == 'S'}">
				<script>
					alert("리뷰를 성공적으로 등록했습니다.");
					location.href = "/collectionViewStudio.do?studioNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'D'}">
				<script>
					alert("리뷰를 성공적으로 등록했습니다.");
					location.href = "/collectionViewDress.do?dressNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'M'}">
				<script>
					alert("리뷰를 성공적으로 등록했습니다.");
					location.href = "/collectionViewMakeup.do?makeupNo="+${objectNo};
				</script>
			</c:when>
		</c:choose>
	</div>
</section>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
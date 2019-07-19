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
			<c:when test="${code == 'S'}">
				<script>
					alert("리뷰를 등록할 수 없습니다.");
					location.href = "/collectionViewStudio.do?studioNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'D'}">
				<script>
					alert("리뷰를 등록할 수 없습니다.");
					location.href = "/collectionViewDress.do?dressNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'M'}">
				<script>
					alert("리뷰를 등록할 수 없습니다.");
					location.href = "/collectionViewMakeup.do?makeupNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'H'}">
				<script>
					alert("리뷰를 등록할 수 없습니다.");
					location.href = "/hallView.do?hallNo="+${objectNo};
				</script>
			</c:when>
			<c:when test="${code == 'B' || code == 'I'}">
				<script>
					alert("리뷰를 등록할 수 없습니다.");
					location.href = "/collectionViewGoods.do?goodsType=${code}&goodsNo="+${objectNo};
				</script>
			</c:when>
		</c:choose>
	</div>
</section>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
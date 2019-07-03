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
		<div>
			<a href="/collectionList.do?code=all">전체</a>
		</div>
		<div>
			<a href="/collectionList.do?code=D">드레스</a>
		</div>
		<div>
		   	<a href="/collectionList.do?code=S">스튜디오</a>
		</div>
		<div>
		   	<a href="/collectionList.do?code=M">메이크업&헤어</a>
		</div>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
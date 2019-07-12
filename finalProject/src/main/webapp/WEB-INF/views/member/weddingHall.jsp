<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/hall.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/collectionList.css"> 
<script type="text/javascript" src="/resources/js/content.js"></script><!-- content.js -->

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
	
	<div class="area">
	<hr>
	<h1>홀</h1>
		<div class="clearfix myPageContainer">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
			<c:if test="${not empty hallList}">				<!-- 스튜디오 리스트가 있을 때 -->
				<c:forEach items="${hallList}" var="h" varStatus="i">
					<div class="photolist">
						<a href="/#.do?code=${h.code}&objectNo=${h.hallNo}">
							<img src="/resources/img/test_img.jpg"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/#.do?code=${h.code}&objectNo=${h.hallNo}" class="photolist-prdName">${h.hallName}</a>
							<br>
							<br>
							<br>
							<div>
								${h.hallAddr}
							</div>
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>
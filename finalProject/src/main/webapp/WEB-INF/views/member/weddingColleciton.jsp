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
	<h1>스튜디오</h1>

	<div  class="clearfix myPageContainer">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
			<c:if test="${not empty sdmList.sList}">	
				<c:forEach items="${sdmList.sList}" var="s" varStatus="i">
					<div class="photolist">
						<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}">
							<img src="/resources/img/test_img.jpg"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}" class="photolist-prdName">${s.studioName}</a>
							<br>
							<br>
							<br>
							<div>
								${s.studioAddr}
							</div>
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>
	</div>
	<hr>
	<h1>dress</h1>
	
	<div  class="clearfix myPageContainer">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
			<c:if test="${not empty sdmList.dList}">				<!-- 스튜디오 리스트가 있을 때 -->
				<c:forEach items="${sdmList.dList}" var="d" varStatus="i">
					<div class="photolist">
						<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}">
							<img src="/resources/img/test_img.jpg"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}" class="photolist-prdName">${d.dressName}</a>
							<br>
							<br>
							<br>
							<div>
								${d.dressAddr}
							</div>
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>
	</div>
	<hr>
	<h1>메이크업</h1>
		<div class="clearfix myPageContainer">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
			<c:if test="${not empty sdmList.mList}">				<!-- 스튜디오 리스트가 있을 때 -->
				<c:forEach items="${sdmList.mList}" var="m" varStatus="i">
					<div class="photolist">
						<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}">
							<img src="/resources/img/test_img.jpg"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}" class="photolist-prdName">${m.makeupName}</a>
							<br>
							<br>
							<br>
							<div>
								${m.makeupAddr}
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
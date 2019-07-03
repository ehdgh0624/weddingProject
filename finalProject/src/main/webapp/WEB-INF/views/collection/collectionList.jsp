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
	<!-- paging -->
         <div class="paging">
                <!-- 여기에 페이징 불러오세요~~ -->
				${pd.pageNavi}
          </div>
          <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="" method="get">
               <select name="type"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
                  <option value="title">제목</option>
                  <option value="name">보호소명</option>
               </select>
               <input placeholder="검색어를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
         
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<div style="text-align: center;">
			<c:if test="${not empty pd.sList}">
				<c:forEach items="${pd.sList}" var="s" varStatus="i">
					<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}">
						<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
							<img src="/resources/img/test_img.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
							<div style="padding:20px;">
								<span style="float:left;">${s.studioName}</span>
								<span style="float:right;">☆스크랩</span>
							</div>
						</div>
					</a>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty pd.dList}">
				<c:forEach items="${pd.dList}" var="d" varStatus="i">
					<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}">
						<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
							<img src="/resources/img/test_img2.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
							<div style="padding:20px;">
								<span style="float:left;">${d.dressName}</span>
								<span style="float:right;">☆스크랩</span>
							</div>
						</div>
					</a>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty pd.mList}">
				<c:forEach items="${pd.mList}" var="m" varStatus="i">
					<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}">
						<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
							<img src="/resources/img/test_img3.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
							<div style="padding:20px;">
								<span style="float:left;">${m.makeupName}</span>
								<span style="float:right;">☆스크랩</span>
							</div>
						</div>
					</a>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
		</div>

	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
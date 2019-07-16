<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

		<div id="goodsTypeBtn" class="area">
			<button onclick="location.href='/goodsCare.do'">모든상품</button> 
			<button onclick="location.href='/goodsCare.do?code=1'">부케</button> 
			<button onclick="location.href='/goodsCare.do?code=2'">청첩장</button> 
		</div>
	<div id="goodsCareContainer" class="clearfix area">
		<!-- 상품 선택창-->
		<!--상품 리스트 -->
			<c:if test="${not empty gList.list}">
				<c:forEach items="${gList.list}" var="g" varStatus="i">
					<div class="photolist">
						<a href="/goodsView.do?goodsNo=${g.goodsNo}">
							<img src="/resources/img/goods/${g.goodsFilePath }" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:10px;">
							<span style="float:left;">상품명 : ${g.goodsName}</span><br>
							<span style="float:left;">가격 : ${g.goodsPrice }원 </span><br>
							<c:choose>
								<c:when test="${g.goodsType eq 'B' }">
									<span style="float:left;">타입 : 부케 </span><br>
								</c:when>
								<c:when test="${g.goodsType eq 'I' }">
									<span style="float:left;">타입 : 청첩장 </span><br>
								</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${g.viewstatus == 0}">
								<span style="float:left;">상품 상태 : 보임</span>						
							</c:when>
							<c:when test="${g.viewstatus == 1 }">
								<span style="float:left;">상품 상태 : 안보임</span>						
							</c:when>
							</c:choose>
								
						</div>
					</div>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
				<div class="paging">${gList.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/searchGoods.do" method="get">
               <input placeholder="상품명을 입력해주세요." type="search" name="keyword" class="search-word" value="">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
			</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


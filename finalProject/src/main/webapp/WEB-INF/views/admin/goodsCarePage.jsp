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

		<div id="goodsTypeBtn" class="btn-wrap">
			<button class="btn-samll" onclick="location.href='/goodsCare.do'">모든상품</button> 
			<button class="btn-samll" onclick="location.href='/goodsCare.do?code=1'">부케</button> 
			<button class="btn-samll" onclick="location.href='/goodsCare.do?code=2'">청첩장</button> 
		</div>
	<div id="goodsCareContainer" class="clearfix area">
		<!-- 상품 선택창-->
		<!--상품 리스트 -->
			<c:if test="${not empty gList.list}">
				<c:forEach items="${gList.list}" var="g" varStatus="i">
					<div class="photolist">
						<a href="/collectionViewGoods.do?goodsType=${g.goodsType}&goodsNo=${g.goodsNo}"><!-- //goodsType="+code+"&goodsNo="+objectNo -->
							<img src="/resources/goods/${g.goodsFilePath }" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:10px;background-color: #fafafa">
						<div class="clearfix goodscare">
							<c:choose>
								<c:when test="${g.goodsType eq 'B' }">
									<span style="float:left; width: 70px;line-height:20px;  background-color: lightgray; text-align: center; border-radius: 5px; font-size: 20px;">부케 </span>
								</c:when>
								<c:when test="${g.goodsType eq 'I' }">
									<span style="float:left;width: 70px; line-height:20px;background-color: lightgray; text-align: center; border-radius: 5px;font-size: 20px;">청첩장 </span>
								</c:when>
							</c:choose>
							<span style="float:left;width:calc(100% - 100px); font-size: 22px;line-height: 20px;">${g.goodsName}</span>
							<c:choose>
							<c:when test="${g.viewstatus == 0}">
								<span style="float:right;display:inline-block;"><img width="24px" src="/resources/img/viewstatus_on.png"></span>						
							</c:when>
							<c:when test="${g.viewstatus == 1 }">
								<span style="float:right;"><img src="/resources/img/viewstatus_off.png"></span>						
							</c:when>
							</c:choose>
							<br><br>
							<p style="float:left;width:100%;font-size:22px;text-align: right;">${g.goodsPrice }원 </p>
							</div>
							<div class="goodsTypeBtn" >
								<button class="btn-samll1" onclick="location.href='/goodsUpdatePage.do?goodsNo=${g.goodsNo}&code=${g.goodsType }'">수정</button> 
								<button class="btn-samll2" onclick="location.href='/goodsdelete.do?goodsNo=${g.goodsNo}&code=${g.goodsType }'">삭제</button> 
							</div>
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
	
	<script>
	function addComma(num) {
		return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	$(document).ready(function(){//
		/*$(".listView").click(function() {
			var simulatorNo = $(this).children('.simNo').html();
			detailView(simulatorNo);
		});*/
		
		//가격 콤마 찍기
		$("p").each(function(){
			$(this).text(addComma($(this).html()));
		});
		
		
	});	
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


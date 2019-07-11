<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<!-- 상위 검색창 -->
		<div style="margin:0 auto;">
			<h1>★나에게 맞는 #Shop 찾기</h1>
			<div style="display:inline-block;">
				<h3>지역</h3>
				<select style="width:150px;" id="locationSelect" name="locationSelect">
					<option value="0" selected>전체</option>
					<option value="1">서울</option>
					<option value="2">광주</option>
					<option value="3">대구</option>
					<option value="4">대전</option>
					<option value="5">부산</option>
					<option value="6">울산</option>
					<option value="7">인천</option>
					<option value="8">세종</option>
					<option value="9">경기</option>
					<option value="10">강원</option>
					<option value="11">경남</option>
					<option value="12">경북</option>
					<option value="13">전남</option>
					<option value="14">전북</option>
					<option value="15">충남</option>
					<option value="16">충북</option>
					<option value="17">제주</option>
				</select>
			</div>
			<div style="display:inline-block;">
				<h3>분류</h3>
				<select style="width:150px;" id="categorySelect" name="categorySelect">
					<option value="default">전체</option>
					<option value="S">스튜디오</option>
					<option value="D">드레스</option>
					<option value="M">메이크업</option>
					<option value="B">부케</option>
					<option value="I">청첩장</option>
				</select>
			</div>
			<div>
				<input type="text" placeholder="업체명이나 키워드, #태그를 검색해보세요" style="width:250px;">
				<input type="submit" value="검색">
				<c:if test="${not empty sessionScope.member}">
					<c:if test="${sessionScope.member.memberId == 'admin'}">
						<c:if test="${not empty pd.sList}">
							<input type="button" value="글쓰기" onclick="location.href='/editor.do?code=S'">
						</c:if>
						<c:if test="${not empty pd.dList}">
							<input type="button" value="글쓰기" onclick="location.href='/editor.do?code=D'">
						</c:if>
						<c:if test="${not empty pd.mList}">
							<input type="button" value="글쓰기" onclick="location.href='/editor.do?code=M'">
						</c:if>
						<c:if test="${not empty pd.gList}">
							<input type="button" value="글쓰기" onclick="location.href='/editor.do?code=G'">
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
		
		<!-- collection 리스트 -->
		<div style="width:966px;margin:0 auto;">
			<c:if test="${not empty pd.sList}">				<!-- 스튜디오 리스트가 있을 때 -->
				<c:forEach items="${pd.sList}" var="s" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}">
							<img src="/resources/img/test_img.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;font-size: 20px;vertical-align: middle;">${s.studioName}</span>
							<span style="float:right;">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${s.studioNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${s.studioNo}" name="${s.code}">
															<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${s.studioNo}" name="${s.code}">
																<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${s.studioNo}" name="${s.code}">
											<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div style="float: left;">
								${s.studioAddr}
							</div>
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			
			<c:if test="${not empty pd.dList}">				<!-- 드레스 리스트가 있을 때 -->
				<c:forEach items="${pd.dList}" var="d" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}">
							<img src="/resources/img/test_img2.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;font-size: 20px;vertical-align: middle;">${d.dressName}</span>
							<span style="float:right;">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${d.dressNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${d.dressNo}" name="${d.code}">
															<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${d.dressNo}" name="${d.code}">
																<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${d.dressNo}" name="${d.code}">
											<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div style="float: left;">
								${d.dressAddr}
							</div>
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>

			<c:if test="${not empty pd.mList}">				<!-- 메이크업 리스트가 있을 때 -->
				<c:forEach items="${pd.mList}" var="m" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}">
							<img src="/resources/img/test_img3.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;font-size: 20px;vertical-align: middle;">${m.makeupName}</span>
							<span style="float:right;">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${m.makeupNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${m.makeupNo}" name="${m.code}">
															<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${m.makeupNo}" name="${m.code}">
																<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${m.makeupNo}" name="${m.code}">
											<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div style="float: left;">
								${m.makeupAddr}
							</div>	
						</div>
					</div>
					<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			
			<c:if test="${not empty pd.gList}">				<!-- 상품 리스트가 있을 때 -->
				<c:forEach items="${pd.gList}" var="g" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${g.goodsType}&objectNo=${g.goodsNo}">
							<img src="/resources/img/test_img4.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;font-size: 20px;vertical-align: middle;">${g.goodsName}</span>
							<span style="float:right;">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${g.goodsNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${g.goodsNo}" name="${g.code}">
															<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${g.goodsNo}" name="${g.code}">
																<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${g.goodsNo}" name="${g.code}">
											<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">		<!-- 빈 별 이미지만 띄움 -->
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div style="float: left;">
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
	</div>
</section>
<script>
	$(document).on("click",".defaultStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOn.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){					
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b2.png" style="width:30px;height:30px;">');
					select.addClass('scrapStar');
					select.removeClass('defaultStar');
					alert("스크랩북에 추가되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
	$(document).on("click",".scrapStar",function(){
		var select = $(this);
		var objectNo = select.attr('id');		/* 업체 또는 상품 번호 */
		var code = select.attr('name');			/* 업체 또는 상품 타입분류 */
		$.ajax({
			url : "/scrapOff.do",
			type : "get",
			data : {objectNo:objectNo,code:code},
			success : function(data){
				if(data == 1){
					select.find('img').remove();
					select.append('<img src="/resources/img/star_b1.png" style="width:30px;height:30px;">');
					select.removeClass('scrapStar');
					select.addClass('defaultStar');
					alert("스크랩북에서 삭제되었습니다.");
				}else{
					alert("로그인 후 실행해주세요.");					
				}
			},
			error : function(){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	});
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<%--  css --%>
<link rel="stylesheet" type="text/css" href="/resources/css/hall.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/collectionList.css"> 

<script>
	$(document).ready(function(){
		$('#searchHall').focusin(function(){
			if($('#searchHall').val() != ''){
				$('#searchHall').val($('#searchHall').val().replace(' ','')+',');
			}
		});
		
		$('#searchHall').focusout(function(){
			for(var i=0;i < 5000;i++){					//횟수는 keyword input태그 글자 수 제한만큼 돌릴 것
				if($('#searchHall').val().lastIndexOf(",") == $('#searchHall').val().length-1){
					$('#searchHall').val($('#searchHall').val().substring(0, $('#searchHall').val().length-1));
				}else{
					break;
				}				
			}
		});
	});
</script>


<%-- wrap --%>
<section id="wrap">
	<!-- 상위 검색창 -->
	<section class="hall">
		<div class="header"><!-- 검색div -->
			<div class="headersub area"><!-- 가운데 정렬 div -->
				<h3>★나에게 맞는 #Shop 찾기</h3>
				<form action="/collectionSearch.do" method="get">
					<select class="addr" name="searchAddr" id="searchAddr">   <!-- 지역 select -->
						<option value="전국">전국</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="제주">제주</option>
					</select>
					<select class="halltype" name="searchCode" id="searchCode">   <!-- 결혼식장 타입 -->
						<option value="전체">분류</option>
						<option value="S">스튜디오</option>
						<option value="D">드레스</option>
						<option value="M">메이크업</option>
						<option value="B">부케</option>
						<option value="I">청첩장</option>
					</select>
					<input type="text" id="searchHall" name="keyword" placeholder="키워드, #태그를 검색해보세요"> <!-- 결혼식장 이름 입력 -->
					<button type="submit" id="btnHall">검색하기</button>     <!-- 결혼식장 이름 검색 -->   
				</form>
			</div>
		</div>
	</section>
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		
		<!-- collection 리스트 -->
		<div>
			<c:if test="${not empty pd.sList}">				<!-- 스튜디오 리스트가 있을 때 -->
				<c:forEach items="${pd.sList}" var="s" varStatus="i">
					<div class="photolist">
						<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}">
							<img src="/resources/studio/${s.studioFilepath}"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}" class="photolist-prdName">${s.studioName}</a>
							<span class="photolist-scrapStar-location">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${s.studioNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${s.studioNo}" name="${s.code}">
															<img src="/resources/img/star_b2.png" class="photolist-scrapStar-size">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${s.studioNo}" name="${s.code}">
																<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${s.studioNo}" name="${s.code}">
											<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
								<c:forEach items="${fn:split(s.studioAddr,' ')}" var="item" varStatus="j">		<!-- 저장된 주소를 꺼내와 공백 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<span>${item}</span>
										<c:if test="${j.count == 2}">											<!-- 반복문이 두번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
								<span style="float: right;">분류 : <span>스튜디오</span></span>
							</div>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
								<c:forEach items="${fn:split(s.studioTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<c:set var="keyword" value="${fn:split(item,'#')}" />
										<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
										<c:if test="${j.count == 5}">											<!-- 반복문이 다섯 번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<br>
							<div>
								<span style="vertical-align: middle;font-size: 13px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${s.studioScope}.png" style="height:13px;vertical-align: middle;">	
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
					<div class="photolist">
						<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}">
							<img src="/resources/studio/${d.dressFilepath}"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}" class="photolist-prdName">${d.dressName}</a>
							<span class="photolist-scrapStar-location">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${d.dressNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${d.dressNo}" name="${d.code}">
															<img src="/resources/img/star_b2.png" class="photolist-scrapStar-size">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${d.dressNo}" name="${d.code}">
																<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${d.dressNo}" name="${d.code}">
											<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 									<!-- 반복문 break -->
								<c:forEach items="${fn:split(d.dressAddr,' ')}" var="item" varStatus="j">		<!-- 저장된 주소를 꺼내와 공백 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<span>${item}</span>
										<c:if test="${j.count == 2}">									<!-- 반복문이 두번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 						<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
								<span style="float: right;">분류 : <span>드레스</span></span>
							</div>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
								<c:forEach items="${fn:split(d.dressTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<c:set var="keyword" value="${fn:split(item,'#')}" />
										<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
										<c:if test="${j.count == 5}">											<!-- 반복문이 다섯 번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<br>
							<div>
								<span style="vertical-align: middle;font-size: 13px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${d.dressScope}.png" style="height:13px;vertical-align: middle;">	
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
					<div class="photolist">
						<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}">
							<img src="/resources/studio/${m.makeupFilepath}"class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}" class="photolist-prdName">${m.makeupName}</a>
							<span class="photolist-scrapStar-location">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${m.makeupNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${m.makeupNo}" name="${m.code}">
															<img src="/resources/img/star_b2.png" class="photolist-scrapStar-size">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${m.makeupNo}" name="${m.code}">
																<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${m.makeupNo}" name="${m.code}">
											<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지만 띄움 -->										
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 									<!-- 반복문 break -->
								<c:forEach items="${fn:split(m.makeupAddr,' ')}" var="item" varStatus="j">		<!-- 저장된 주소를 꺼내와 공백 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<span>${item}</span>
										<c:if test="${j.count == 2}">									<!-- 반복문이 두번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 						<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
								<span style="float: right;">분류 : <span>메이크업</span></span>
							</div>	
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
								<c:forEach items="${fn:split(m.makeupTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<c:set var="keyword" value="${fn:split(item,'#')}" />
										<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
										<c:if test="${j.count == 5}">											<!-- 반복문이 다섯 번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<br>
							<div>
								<span style="vertical-align: middle;font-size: 13px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${m.makeupScope}.png" style="height:13px;vertical-align: middle;">	
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
					<div class="photolist">
						<a href="/collectionView.do?code=${g.goodsType}&objectNo=${g.goodsNo}">
							<img src="/resources/goods/${g.goodsFilePath}" class="thumbnail-size">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div class="photo-padding">
							<a href="/collectionView.do?code=${g.goodsType}&objectNo=${g.goodsNo}" class="photolist-prdName">${g.goodsName}</a>
							<span class="photolist-scrapStar-location">
								<c:choose>
									<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
										<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
										<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
											<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
												<c:choose>
													<c:when test="${g.goodsNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
														<button class="scrapStar" id="${g.goodsNo}" name="${g.code}">
															<img src="/resources/goods/${g.goodsFilePath }" class="photolist-scrapStar-size">			<!-- 노란 별 이미지를 띄우고 -->
														</button>
														<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
													</c:when>
													<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
														<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
															<button class="defaultStar" id="${g.goodsNo}" name="${g.code}">
																<img src="/resources/goods/${g.goodsFilePath }" class="photolist-scrapStar-size">		<!-- 빈 별 이미지를 띄움 -->
															</button>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>									
									</c:when>
									<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
										<button class="defaultStar" id="${g.goodsNo}" name="${g.code}">
											<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지만 띄움 -->
										</button>
									</c:otherwise>
								</c:choose>
							</span>
							<br>
							<br>
							<br>
							<div>
								<c:if test="${g.goodsType.equals('B')}">
									타입 : <span>부케</span>
								</c:if>
								<c:if test="${g.goodsType.equals('I')}">
									타입 : <span>청첩장</span>
								</c:if>
							</div>
							<br>
							<div>
								<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
								<c:forEach items="${fn:split(g.goodsTag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
									<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
										<c:set var="keyword" value="${fn:split(item,'#')}" />
										<a href="/collectionListTagSearch.do?keyword=${keyword[0]}">${item}</a>
										<c:if test="${j.count == 5}">											<!-- 반복문이 다섯 번 돌았을 때 -->
											<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<br>
							<div>
								<span style="vertical-align: middle;font-size: 13px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${g.goodsScope}.png" style="height:13px;vertical-align: middle;">	
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
	</div>
</section>
<script>
	/* 로드 시 주소 앞자리만 가져오기 */
	/* 로드 시 주소 앞자리만 가져오기 끝*/

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
					select.append('<img src="/resources/img/star_b2.png" class="photolist-scrapStar-size">');
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
					select.append('<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">');
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
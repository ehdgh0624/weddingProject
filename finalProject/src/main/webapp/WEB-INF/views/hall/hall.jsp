<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  Header --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/common/header.jsp" />
<%-- Sub --%>
<jsp:include page="/WEB-INF/common/sub.jsp" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/hall.css">

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<section class="hall">
			<div class="header">
				<!-- 검색div -->
				<div class="headersub area">
					<!-- 가운데 정렬 div -->
					<h3>
						장소 검색하기
						<c:if test="${not empty param.hallLoc}">
							<span>'지역 : ${param.hallLoc }'</span>
						</c:if>
						<c:if test="${not empty param.hallType}">
							<span>'타입 : ${param.hallType }'</span>
						</c:if>
						<c:if test="${not empty param.menuType }">
							<c:if test="${param.menuType == 5 }">
								<span>'메뉴 : 전체'</span>
							</c:if>
							<c:if test="${param.menuType == 0 }">
								<span>'메뉴 : 한식'</span>
							</c:if>
							<c:if test="${param.menuType == 1 }">
								<span>'메뉴 : 일식'</span>
							</c:if>
							<c:if test="${param.menuType == 2 }">
								<span>'메뉴 : 중식'</span>
							</c:if>
							<c:if test="${param.menuType == 3 }">
								<span>'메뉴 : 양식'</span>
							</c:if>
							<c:if test="${param.menuType == 4 }">
								<span>'메뉴 : 뷔페'</span>
							</c:if>
						</c:if>
						<c:if test="${not empty param.hallPerson}">
							<span>'인원수 : ${param.hallPerson }명'</span>
						</c:if>
						<c:if test="${not empty param.searckHall}">
							<span>'검색어 : ${param.searckHall }'</span>
						</c:if>
						<span id="tagSearch"></span>
					</h3>

					<form action="/hallSc.do" method="get">
						<select class="addr" name="hallLoc">
							<!-- 지역 select -->
							<option value="전국">모든지역</option>
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
						</select> <select class="halltype" name="hallType">
							<!-- 결혼식장 타입 -->
							<option value="전체">모든타입</option>
							<option value="갤러리">갤러리</option>
							<option value="경기장">경기장</option>
							<option value="골프장">골프장</option>
							<option value="공공장소">공공장소</option>
							<option value="공연장">공연장</option>
							<option value="공원">공원</option>
							<option value="극장">극장</option>
							<option value="농장">농장</option>
							<option value="레스토랑">레스토랑</option>
							<option value="문화재">문화재</option>
							<option value="복합문화공간">복합문화공간</option>
							<option value="선박">선박</option>
							<option value="식물원">식물원</option>
							<option value="스튜디오">스튜디오</option>
							<option value="연습공간">연습공간</option>
							<option value="웨딩홀">웨딩홀</option>
							<option value="카페">카페</option>
							<option value="펜션">펜션</option>
							<option value="하우스웨딩홀">하우스웨딩홀</option>
							<option value="호텔">호텔</option>
						</select> <select class="menu" name="menuType">
							<!-- 식사 메뉴 -->
							<option value="5">메뉴 선택</option>
							<option value="0">한식</option>
							<option value="1">일식</option>
							<option value="2">중식</option>
							<option value="3">양식</option>
							<option value="4">뷔페</option>
						</select>
						<div class="hallPerson">
							<input type="text" id="hallPerson" class="num" name="hallPerson"
								placeholder="인원을 입력해주세요.">
						</div>
						<input type="text" id="searchHall" name="searckHall"
							placeholder="검색할 매장명을 입력해주세요.">
						<!-- 결혼식장 이름 입력 -->
						<button type="submit" id="btnHall">검색하기</button>
						<!-- 결혼식장 이름 검색 -->
					</form>
				</div>
			</div>

			<div class="contents">
				<!-- 결혼식장 리스트 출력 div -->
				<!-- 				<div class="filteoBtn area">	버튼 클릭시 조건에 맞게 정렬 -->
				<!-- 						<button id="pyeongieom" onclick="location.href='/hallPc.do?hCode=1'">평점순</button> -->
				<!-- 						<button id="choesinsun" onclick="location.href='/hallPc.do?hCode=2'">최신순</button> -->
				<!-- 				</div> -->
				<div class="photoZone area">
					<!-- 결혼식장 정보,선택  하는 곳 !-->
					<c:if test="${not empty pd.hList }">
						<div class="photoZone-box clearfix">
							<c:forEach items="${pd.hList }" var="h">
								<div class="card">
									<div class="thumbnail">
										<a href="/hallView.do?hallNo=${h.hallNo}" class="centered">
											<span
											style="background: url('/resources/hall/${h.hallPath}') no-repeat center center; background-size: cover;"></span>
										</a>
									</div>
									<div class="text">
										<h5 class="clearfix">
											<strong>${h.hallName }</strong> <span
												class="photolist-scrapStar-location"> <c:choose>
													<c:when test="${not empty pd.scrapList}">
														<!-- scrapList 조회 결과가 있을 때 -->
														<c:set var="doneLoop" value="false" />
														<!-- doneLoop : forEach문을 돌릴 조건 -->
														<c:forEach items="${pd.scrapList}" var="scrap"
															varStatus="j">
															<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
															<c:if test="${not doneLoop}">
																<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
																<c:choose>
																	<c:when test="${h.hallNo == scrap.prdNo}">
																		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
																		<button class="scrapStar" id="${h.hallNo}"
																			name="${h.code}">
																			<img src="/resources/img/star_m2.png"
																				class="photolist-scrapStar-size">
																			<!-- 노란 별 이미지를 띄우고 -->
																		</button>
																		<c:set var="doneLoop" value="true" />
																		<!-- 루프를 중단함 -->
																	</c:when>
																	<c:otherwise>
																		<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
																		<c:if test="${j.last}">
																			<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
																			<button class="defaultStar" id="${h.hallNo}"
																				name="${h.code}">
																				<img src="/resources/img/star_m1.png"
																					class="photolist-scrapStar-size">
																				<!-- 빈 별 이미지를 띄움 -->
																			</button>
																		</c:if>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<!-- scrapList 조회 결과가 없을 때 -->
														<button class="defaultStar" id="${h.hallNo}"
															name="${h.code}">
															<img src="/resources/img/star_m1.png"
																class="photolist-scrapStar-size">
															<!-- 빈 별 이미지만 띄움 -->
														</button>
													</c:otherwise>
												</c:choose>
											</span>
										</h5>
										<!-- 반복문 break -->
										<p class="addr-txt">
											<c:forEach items="${fn:split(h.hallAddr,' ')}" var="item" varStatus="j">
												<c:if test="${j.count <= 2}">
													<span>${item}</span>
												</c:if>
											</c:forEach>
										</p>
										<p class="tag-txt">
											<c:forEach items="${fn:split(h.hallTag,',')}" var="tag" varStatus="j">
												<c:if test="${j.count <= 5 }">
													<span id="tag" class="tag">${tag }</span>
												</c:if>
											</c:forEach>
										</p>
									</div>
									<div class="bottom">
										<p>
											<span>인원</span><b>${h.hallMinPerson } ~ ${h.hallMaxPerson }
											</b>
										</p>
										<p>
											<span>평점</span><b><img
												src="/resources/img/scope-star/scope-star${h.scope}.png"
												style="height: 13px; vertical-align: middle;"></b>
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="paging">
							<!-- 페이지 처리하는 곳 ! -->
							<div id="pageNavi area">${pd.pageNavi}</div>
						</div>
					</c:if>
					<c:if test="${empty pd.hList }">
						<div class="photoZone-none">
							<p>웨딩홀 검색 결과가 없습니다.</p>
						</div>
					</c:if>
				</div>
			</div>
		</section>
	</div>
</section>
<script>

	$(document).ready(function(){
	if(${param.msg != null}){
	$("#tagSearch").html('태그 : #${param.msg}');//태그 클릭시 검색 조건 띄우기
	};
		
	});
	
	$(".tag").click(function() { //태그 클릭시 해당 태그 리스트 가져오기
		var msgg = $(this).html();
		var msg = msgg.substring(1);
		location.href = "/hallPc.do?msg=" + msg;
	});

	$("#pyeongieom").click(function() { //평점 버튼 색상 변경
		$("#pyeongieom").css("color", "#f46629");
		$("#pyeongieom").css("border", "1px solid #f46629");
		$("#choesinsun").css("color", "#333");
		$("#choesinsun").css("border", "1px solid #333");
	});
	$("#choesinsun").click(function() { //최신 버튼 색상 변경
		$("#pyeongieom").css("color", "#333");
		$("#pyeongieom").css("border", "1px solid #333");
		$("#choesinsun").css("color", "#f46629");
		$("#choesinsun").css("border", "1px solid #f46629");
	});
</script>
<script>
	/* 로드 시 주소 앞자리만 가져오기 */
	/* 로드 시 주소 앞자리만 가져오기 끝*/

	$(document)
			.on(
					"click",
					".defaultStar",
					function() {
						var select = $(this);
						var objectNo = select.attr('id'); /* 업체 또는 상품 번호 */
						var code = select.attr('name'); /* 업체 또는 상품 타입분류 */
						$
								.ajax({
									url : "/hscrapOn.do",
									type : "get",
									data : {
										objectNo : objectNo,
										code : code
									},
									success : function(data) {
										if (data == 1) {
											select.find('img').remove();
											select
													.append('<img src="/resources/img/star_m2.png" class="photolist-scrapStar-size">');
											select.addClass('scrapStar');
											select.removeClass('defaultStar');
											alert("스크랩북에 추가되었습니다.");
										} else {
											alert("로그인 후 실행해주세요.");
										}
									},
									error : function() {
										alert("잠시 후 다시 시도해주세요.");
									}
								});
					});
	$(document)
			.on(
					"click",
					".scrapStar",
					function() {
						var select = $(this);
						var objectNo = select.attr('id'); /* 업체 또는 상품 번호 */
						var code = select.attr('name'); /* 업체 또는 상품 타입분류 */
						$
								.ajax({
									url : "/hscrapOff.do",
									type : "get",
									data : {
										objectNo : objectNo,
										code : code
									},
									success : function(data) {
										if (data == 1) {
											select.find('img').remove();
											select
													.append('<img src="/resources/img/star_m1.png" class="photolist-scrapStar-size">');
											select.removeClass('scrapStar');
											select.addClass('defaultStar');
											alert("스크랩북에서 삭제되었습니다.");
										} else {
											alert("로그인 후 실행해주세요.");
										}
									},
									error : function() {
										alert("잠시 후 다시 시도해주세요.");
									}
								});
					});
</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />
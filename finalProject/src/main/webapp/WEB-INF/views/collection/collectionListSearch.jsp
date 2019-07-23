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
				<h3>★나에게 맞는 #Shop 찾기
				<c:if test="${not empty keyword}">
					<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
					<c:forEach items="${fn:split(keyword,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
						<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
							<c:set var="key" value="${fn:split(item,'#')}" />
							<span>"${key[0]}"</span>
							<c:if test="${j.count == 5}">											<!-- 반복문이 다섯 번 돌았을 때 -->
								<c:set var="doneLoop" value="true"/> 								<!-- 반복문 break 활성화 -->
							</c:if>
						</c:if>
					</c:forEach>				
				</c:if>
				</h3>
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
					<c:choose>
						<c:when test="${not empty keyword}">
							<input type="text" id="searchHall" name="keyword" placeholder="키워드, #태그를 검색해보세요" value="${keyword}"> <!-- 결혼식장 이름 입력 -->
						</c:when>
						<c:otherwise>						
							<input type="text" id="searchHall" name="keyword" placeholder="키워드, #태그를 검색해보세요"> <!-- 결혼식장 이름 입력 -->
						</c:otherwise>
					</c:choose>
					<button type="submit" id="btnHall">검색하기</button>     <!-- 결혼식장 이름 검색 -->   
				</form>
			</div>
		</div>
	</section>
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		
		<!-- collection 리스트 -->
		<div>
			<c:choose>
				<c:when test="${not empty pd.cList}">				<!-- 뭐가 있을 때 -->
					<c:forEach items="${pd.cList}" var="c" varStatus="i">
						<div class="photolist">
							<c:choose>
								<c:when test="${c.code == 'G'}">
									<a href="/collectionView.do?code=${c.tel}&objectNo=${c.objectNo}">
								</c:when>
								<c:otherwise>
									<a href="/collectionView.do?code=${c.code}&objectNo=${c.objectNo}">
								</c:otherwise>
							</c:choose>			
								<c:choose>
									<c:when test="${c.code eq 'H' }"><img src="/resources/hall/${c.filePath}"class="thumbnail-size"></c:when>
									<c:when test="${c.code eq 'D' }"><img src="/resources/dress/${c.filePath}"class="thumbnail-size"></c:when>
									<c:when test="${c.code eq 'M' }"><img src="/resources/makeup/${c.filePath}"class="thumbnail-size"></c:when>
									<c:when test="${c.code eq 'S' }"><img src="/resources/studio/${c.filePath}"class="thumbnail-size"></c:when>
								</c:choose>
							</a>
							<div class="photo-padding">
								<c:choose>
									<c:when test="${c.code == 'G'}">
										<a href="/collectionView.do?code=${c.tel}&objectNo=${c.objectNo}" class="photolist-prdName">${c.prdName}</a>
									</c:when>
									<c:otherwise>
										<a href="/collectionView.do?code=${c.code}&objectNo=${c.objectNo}" class="photolist-prdName">${c.prdName}</a>								
									</c:otherwise>
								</c:choose>
								<span class="photolist-scrapStar-location">
									<c:choose>
										<c:when test="${not empty pd.scrapList}">							<!-- scrapList 조회 결과가 있을 때 -->
											<c:set var="doneLoop" value="false"/> 							<!-- doneLoop : forEach문을 돌릴 조건 -->
											<c:forEach items="${pd.scrapList}" var="scrap" varStatus="j">	<!-- 로그인한 id를 조건으로 현재 페이지에서 스크랩한 정보 배열을 불러옴 -->
												<c:if test="${not doneLoop}"> 								<!-- doneLoop이 false일 경우 이 태그 안의 구문이 수행됨 -->
													<c:choose>
														<c:when test="${c.objectNo == scrap.prdNo}">		<!-- 현재페이지에 불러온 업체번호와 스크랩한 업체번호가 동일할 시 -->
															<button class="scrapStar" id="${c.objectNo}" name="${c.code}">
																<img src="/resources/img/star_b2.png" class="photolist-scrapStar-size">			<!-- 노란 별 이미지를 띄우고 -->
															</button>
															<c:set var="doneLoop" value="true"/> 										<!-- 루프를 중단함 -->
														</c:when>
														<c:otherwise>										<!-- 현재 페이지에 불러온 업체번호와 스크랩한 업체번호가 일치하지 않을 시 -->
															<c:if test="${j.last}">							<!-- 마지막 루프까지 일치하는 번호가 없으면 -->
																<button class="defaultStar" id="${c.objectNo}" name="${c.code}">
																	<img src="/resources/img/star_b1.png" class="photolist-scrapStar-size">		<!-- 빈 별 이미지를 띄움 -->
																</button>
															</c:if>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>									
										</c:when>
										<c:otherwise>														<!-- scrapList 조회 결과가 없을 때 -->
											<button class="defaultStar" id="${c.objectNo}" name="${c.code}">
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
									<c:forEach items="${fn:split(c.prdAddr,' ')}" var="item" varStatus="j">		<!-- 저장된 주소를 꺼내와 공백 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
										<c:if test="${not doneLoop}">												<!-- 반복문 break가 없을 시 태그 안의 구문 실행 -->
											<span>${item}</span>
											<c:if test="${j.count == 2}">									<!-- 반복문이 두번 돌았을 때 -->
												<c:set var="doneLoop" value="true"/> 						<!-- 반복문 break 활성화 -->
											</c:if>
										</c:if>
									</c:forEach>
									<span style="float: right;">
									분류 :
									<c:choose>
										<c:when test="${c.code == 'S'}">
											<span>스튜디오</span>									
										</c:when>
										<c:when test="${c.code == 'D'}">
											<span>드레스</span>									
										</c:when>
										<c:when test="${c.code == 'M'}">
											<span>메이크업</span>									
										</c:when>
										<c:when test="${c.code == 'G'}">
											<c:if test="${c.tel == 'B'}">
												<span>부케</span>
											</c:if>
											<c:if test="${c.tel == 'I'}">
												<span>청첩장</span>
											</c:if>
										</c:when>
									</c:choose>
									</span>
								</div>	
								<br>
								<div>
									<c:set var="doneLoop" value="false"/> 											<!-- 반복문 break -->
									<c:forEach items="${fn:split(c.tag,',')}" var="item" varStatus="j">		<!-- 저장된 태크를 꺼내와 콤마(,) 기준으로 자르고, 해당 길이만큼 반복문을 돌림 -->
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
									<span style="vertical-align: middle;font-size: 13px;">평점&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><img src="/resources/img/scope-star/scope-star${c.scope}.png" style="height:13px;vertical-align: middle;">	
								</div>
							</div>
						</div>
						<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
							<br>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>			<!-- 검색 결과가 없을 떄 -->
					<br>
					<br>
					<br>
					<br>
					<br>
					<div style="text-align: center;"><h1>"검색 결과가 없습니다."</h1></div>
					<br>
					<br>
					<br>
					<br>
					<br>
				</c:otherwise>
			</c:choose>
			
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
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
			</div>
		</div>
		<!-- collection 리스트 -->
		<div style="text-align: center;">
			<c:if test="${not empty pd.sList}">
				<c:forEach items="${pd.sList}" var="s" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${s.code}&objectNo=${s.studioNo}">
							<img src="/resources/img/test_img.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;">${s.studioName}</span>
							<span style="float:right;">☆스크랩</span>
						</div>
						<div>
							${s.studioAddr}
						</div>
					</div>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty pd.dList}">
				<c:forEach items="${pd.dList}" var="d" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${d.code}&objectNo=${d.dressNo}">
							<img src="/resources/img/test_img2.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;">${d.dressName}</span>
							<span style="float:right;">☆스크랩</span>
						</div>
					</div>
					<c:if test="i%3==0">
						<br>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${not empty pd.mList}">
				<c:forEach items="${pd.mList}" var="m" varStatus="i">
					<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);">
						<a href="/collectionView.do?code=${m.code}&objectNo=${m.makeupNo}">
							<img src="/resources/img/test_img3.jpg" style="width:100%;height:60%;">		<!-- 이미지 경로에서 불러올 예정 -->
						</a>
						<div style="padding:20px;">
							<span style="float:left;">${m.makeupName}</span>
							<span style="float:right;">☆스크랩</span>
						</div>
					</div>
					<c:if test="i%3==0">
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

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
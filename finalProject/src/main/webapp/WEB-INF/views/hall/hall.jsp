<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--  Header --%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/common/header.jsp" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/hall.css"> 

<%-- wrap --%>
<section id="wrap">
	<div class="">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<section class="hall">
			<div class="header"><!-- 검색div -->
			
				<div class="headersub area"><!-- 가운데 정렬 div -->
				<h3>장소 검색하기</h3>
				<form action="/hallSc.do" method="get">
            <select class="addr" name="hallLoc">   <!-- 지역 select -->
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
            </select>
            <select class="halltype" name="hallType">   <!-- 결혼식장 타입 -->
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
            </select>
            <select class="menu" name="menuType">   <!-- 식사 메뉴 -->
               <option value="0">메뉴 선택</option>
               <option value="1">한식</option>
               <option value="2">일식</option>
               <option value="3">중식</option>
               <option value="4">양식</option>
               <option value="5">뷔페</option>
            </select>
            <div class="hallPerson">
            <input type="text" id="hallPerson" name="hallPerson" placeholder="인원을 입력해주세요.">
            </div>
            <input type="text" id="searchHall" name="searckHall" placeholder="검색할 매장명을 입력해주세요."> <!-- 결혼식장 이름 입력 -->
            <button type="submit" id="btnHall">검색하기</button>     <!-- 결혼식장 이름 검색 -->   
            </form>
				</div>
			</div>
			<div class="contents">	<!-- 결혼식장 리스트 출력 div -->
				<div class="filteoBtn area">	<!-- 버튼 클릭시 조건에 맞게 정렬 -->
						<button id="pyeongieom" onclick="location.href='/hallPc.do?hCode=1'">평점순</button>
						<button id="choesinsun" onclick="location.href='/hallPc.do?hCode=2'">최신순</button>
				</div>
				<div class="photoZone area"><!-- 결혼식장 정보,선택  하는 곳 !-->
					<c:forEach items="${pd.hList }" var="h">
					<div class="card">
						<div class="thumbnail">
							<div class="centered">
								<img src="https://i.pinimg.com/originals/d9/82/f4/d982f4ec7d06f6910539472634e1f9b1.png"
									alt="" />
			
							</div>
						</div>
						<div class="text">
							<h5>${h.hallName } <a href="#"><img alt="" src="/resources/img/star_m1.png"></a></h5>
							<p>${h.hallAddr }</p>
							<div class="bottom">
								<p>
									인원 <span>${h.hallMinPerson } ~ ${h.hallMaxPerson } </span>
								</p>
								<p>평점 아이콘  후기</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="paging">	<!-- 페이지 처리하는 곳 ! -->
					<div id="pageNavi area">
						${pd.pageNavi}
					</div>
				</div>
			</div>
		</section>
	</div>
</section>
<script>
	$("#pyeongieom").click(function(){	//평점 버튼 색상 변경
		$("#pyeongieom").css("color","#f46629");
		$("#pyeongieom").css("border","1px solid #f46629");
		$("#choesinsun").css("color","#333");
		$("#choesinsun").css("border","1px solid #333");
	});
	$("#choesinsun").click(function(){	//최신 버튼 색상 변경
		$("#pyeongieom").css("color","#333");
		$("#pyeongieom").css("border","1px solid #333");
		$("#choesinsun").css("color","#f46629");
		$("#choesinsun").css("border","1px solid #f46629");
	});
	
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />
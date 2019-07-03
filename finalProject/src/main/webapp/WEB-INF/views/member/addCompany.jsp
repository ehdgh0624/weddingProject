<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<form action="/companyEnroll.do" method="post">
		<div class="area">
			<div><!-- 기본정보 -->
				<span>파트너 기본정보 등록</span><br><br>
				<span>업체의 이름을 알려주세요</span><br>
				<input type="text" name="companyName" value=" ">
				<span>업체주소</span><br>
				<input type="text" name="companyAddr" value=" ">
				<span>업체전화번호</span><br>
				<input type="text" name="companyPhone" value=" ">
				<button value="">다음</button>
			</div>
			<hr>
			<div><!-- 분류선택 -->
				<span>파트너 분류선택</span><br><br>
				<span>어떤일을 하시나요?</span><br>
				<select name="code">
					<option value="0">스튜디오</option>
					<option value="1">드레스</option>
					<option value="2">메이크업</option>
					<option value="3">홀</option>
				</select>	
				<button value=" ">다음</button>
			</div>
				<hr>
			<div><!--스튜디오인경우  -->
				<span>스튜디오 평균가격</span><br>
				<input type="number" name="studioPrice" value="0"><br>
				<span>스튜디오 옵션명</span><br>
				<input type="text" name="studioOption" value=" "><br>
				<span>스튜디오 옵션가격</span><br>
				<input type="number" name="studioOptionPrice" value="0"><br>
				<select name="studioOptionType"><br>
					<option value="0">본식</option>
					<option value="1">스튜디오</option>
					<option value="2">영상</option>
				</select><br>
				<button>옵션추가</button><br>
				<button value=" ">다음</button>
			</div>
				<hr>
			<div><!--드레스인경우  -->
				<span>드레스피팅가격</span><br>
				<input type="number" name="dressFittingPrice" value="0"><br>
				<span>드레스피팅시간</span><br>
				<input type="number" name="dressFittingTime" value="0"><br>
				
				<span>드레스대여가능갯수</span><br>
				<input type="number" name="dressRentNum" value="0"><br>
				<span>드레스렌트가격</span><br>
				<input type="number" name="dressRentPrice" value="0"><br>
				<span>보석렌트가격</span><br>
				<input type="number" name="jewelryPrice" value="0"><br>
				
				
				가봉여부 <input type="checkbox" name="dressMending"><br>
				주차여부 <input type="checkbox" name="dressParking"><br>
				
				<span>추가설명</span><br>
				<input type="text" name="dressContent" value=" "><br>
				
				<button value=" ">다음</button>
			</div>
				<hr>
			<div><!--메이크업  -->
				<span>메이크업가격</span>  <br>
				<input type="text" name="makeupBasicPrice" value="0"><br>
				
				혼주메이크업 체크<input type="checkbox" name="makeupParent" value=" "><br>
				혼주메이크업 가격 <input type="number" name="makeupParentPrice" value="0"><br>
				하객메이크업 체크<input type="checkbox" name="makeupVisitor" value=" "><br>
				하객메이크업 <input type="number" name="makeupVisitorPrice" value="0"><br>
			
				<button value=" ">다음</button>
			</div>
				<hr>
			<div><!-- 홀 -->
				<span>홀수용가능인원</span><br>
				최초<input type="number" name="hallMinPerson" value=0>~최대<input type="number" name="hallMaxPerson" value=0>
				
				<span>홀타입</span>  <br>
				<select name="hallType">
					<option value="0">갤러리</option>
					<option value="1">골프장</option>
					<option value="2">공공장소</option>
					<option value="3">레스토랑</option>
					<option value="4">문화공간</option>
					<option value="5">선박</option>
					<option value="6">스튜디오</option>
					<option value="7">웨딩홀</option>
					<option value="8">펜션</option>
					<option value="9">하우스웨딩홀</option>			
				</select>
				
				<span>웨딩홀대여가격</span><br>
				<input type="number" name="hallPrice" value=0>
				
				<!-- 체크시 아래 음식관련 도출 -->
				웨딩홀 식사제공 <input type="checkbox" name="hallServiceFood" value=" "><br>
				<span>웨딩홀음식타입</span><br>
				<select name="hallFoodtype"><br>
					<option value="0">한식</option>
					<option value="1">중식</option>
					<option value="2">일식</option>
					<option value="3">양식</option>
					<option value="4">뷔폐</option>
				</select>
				<span>웨딩홀음식메뉴</span><br>
				<input type="text" name="hallFoodmenu" value=" ">
				<span>웨딩홀음식가격</span><br>
				<input type="number" name="hallFoodprice" value="0">
				웨딩홀 주류제공 <input type="checkbox" name="hallServiceDrink"><br>

				<span>웨딩홀운영시간</span><br>
				<input type="text" name="hallStartTime" value=" ">
				-<input type="text" name="hallEndTime" value=" "><br>
				<span>웨딩홀옵션</span><br>
				웨딩홀 음향제공 <input type="checkbox" name="hallServiceAudio"><br>
				웨딩홀 주차제공 <input type="checkbox" name="hallServiceParking"><br>
				
				<span>웨딩홀상세설명</span><br>
				<input type="text" name="hallContent" value=" ">
			</div>
				<hr>
			<div><!-- 최종등록-->
				<h1>사진등록</h1><br>
				<input type="file" name="fileName" value=" "><br>
				<h1>해쉬태그</h1><br>
				<input type="text" name="hashTag" value=" ">
			</div>
			<button type="submit">제출</button>
		</div>
	</form>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
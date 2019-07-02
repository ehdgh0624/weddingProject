<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<form action="/CompanyEnroll.do" method="post">
		<div class="area">
			<div><!-- 기본정보 -->
				<span>파트너 기본정보 등록</span><br><br>
				<span>업체의 이름을 알려주세요</span><br>
				<input type="text" name="companyName">
				<span>업체주소</span><br>
				<input type="text" name="companyAddr">
				<span>업체전화번호</span><br>
				<input type="text" name="companyPhone">
				<button value="">다음</button>
			</div>
			<div><!-- 분류선택 -->
				<span>파트너 분류선택</span><br><br>
				<span>어떤일을 하시나요?</span>
				<select name="companyKind">
					<option value="0">스튜디오</option>
					<option value="1">드레스</option>
					<option value="2">메이크업</option>
					<option value="3">홀</option>
				</select>	
				<button value="">다음</button>
			</div>
			<div><!--스튜디오인경우  -->
				<span>스튜디오 평균가격</span>
				<input type="text" name="studioAvPrice">
				<span>스튜디오 옵션명</span>
				<input type="text" name="studiOptionTitle">
				<span>스튜디오 옵션가격</span>
				<input type="text" name="studioOptionPrice">
				<select name="optionType">
					<option value="0">본식</option>
					<option value="1">스튜디오</option>
					<option value="2">영상</option>
				</select>
				<button>옵션추가</button>
				
				
				<button value="">다음</button>
			</div>
			<div><!--드레스인경우  -->
				<span>드레스피팅가격</span>
				<input type="text" name="fittingPrice">
				<span>드레스대여가능갯수</span>
				<input type="text" name="dressRentalNumber">
				<span>드레스대여가격</span>
				<input type="text" name="dressRentalPrice">
				
				가봉여부 <input type="checkbox"><br>
				주차여부 <input type="checkbox"><br>
				
				
				<button value="">다음</button>
			</div>
			<div><!--메이크업  -->
				<span>메이크업가격</span>  
				<input type="text" name="makeupPrice">
				
				혼주메이크업 <input type="checkbox"><br>
				하객메이크업 <input type="checkbox"><br>
			
			
				<button value="">다음</button>
			</div>
			<div><!-- 홀 -->
				<span>홀타입</span>  
				<select name="hallOptionType">
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
				<span>웨딩홀상세설명</span>  
				
				대충 이미지 업로드하는공간...
				대표사진
				사진
				
				해쉬태그입력<input type="text" name="hashtag">
				<span>여긴 해쉬태그가 들어갈공간-</span>
				<button type="submit">제출</button>
			</div>
		</div>
	</form>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
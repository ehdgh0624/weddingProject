<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
		<div class="area">
			<form action="/companyEnroll.do">
				<div class="comm-tbl-box" >				
					<div id="first" class="divbox" style="display:none;"><!-- 기본정보 -->
						<h1>파트너 기본정보 등록</h1>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>업체이름</th>	
								<th><input type="text" name="companyName" value=" "></th>
							</tr>
							<tr>
								<th>업체주소</th>
								<th><input type="text" name="companyAddr" value=" "></th>
							</tr>
							<tr>
								<th>업체전화번호</th>
								<th><input type="text" name="companyPhone" value=" "></th>
							</tr>				
						</table>
						<span id="firstStep">다음</span>
					</div>
					
					<div id="seventh" class="divbox" style="display:none;"><!-- 최종등록-->
							<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>스튜디오평균가격</th>
								<th><input type="number" name="studioPrice" value="0"></th>
							</tr>	
							</table>
							<span id="studioStep" class="studioBtn">다음</span>
					</div>				
					<div id="second" class="divbox" style="display:none;"><!-- 분류선택 -->
						<h1>분류선택</h1>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>선택</th>
								<th>
									<select name="code" id="choice">
										<option value="0">스튜디오</option>
										<option value="1">드레스</option>
										<option value="2">메이크업</option>
										<option value="3">홀</option>
									</select>	
								</th>
							</tr>
						</table>
						<span id="secondStep">다음</span>
					</div>	
					<div id="third" class="divbox" style="display:none;"><!--드레스인경우  -->
						<h1>드레스</h1>
						<table class="comm-tbl">
								<colgroup>
									<col width="18%">
									<col width="/">
								</colgroup>
								<tr>
									<th>드레스피팅가격</th>	
									<th><input type="number" name="dressFittingPrice" value="0"></th>
								</tr>
								<tr>
									<th>드레스피팅시간</th>
									<th><input type="number" name="dressFittingTime" value="0"><br></th>
								</tr>
								<tr>
									<th>드레스대여가능갯수</th>
									<th><input type="number" name="dressRentNum" value="0"></th>
								</tr>
								<tr>
									<th>드레스렌트가격</th>
									<th><input type="number" name="dressRentPrice" value="0"></th>
								</tr>
								<tr>
									<th>보석렌트가격</th>
									<th><input type="number" name="jewelryPrice" value="0"></th>
								</tr>
								<tr>
									<th>체크옵션</th>
									<th>가봉여부 <input type="checkbox" name="dressMending"><br>
										주차여부 <input type="checkbox" name="dressParking">
									</th>
								</tr>
								<tr>
									<th>추가상세설명</th>
									<th><input type="text" name="dressContent" value=" "></th>						
								</tr>
							</table>
						<span id="dressStep" class="lastBtn">다음</span>
					</div>		
					<div id="fourth"  class="divbox" style="display:none;"><!--메이크업  -->
						<h1>메이크업</h1>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>메이크업기본가격</th>
								<th><input type="text" name="makeupBasicPrice" value="0"></th>
							</tr>
							<tr>
								<th>혼주메이크업 가격</th>
								<th><input type="number" name="makeupParentPrice" value="0"></th>
							</tr>
							<tr>
								<th>하객메이크업 가격</th>
								<th><input type="number" name="makeupVisitorPrice" value="0"></th>
							</tr>
						</table>
						<span id="makeupStep" class="lastBtn">다음</span>
					</div>

					<div id="fiveth" class="divbox" style="display:none;"><!-- 홀 -->
						<!-- 체크시 아래 음식관련 도출 -->
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>웨딩홀 식사제공</th>
								<th><input type="checkbox" name="hallServiceFood" value=" "></th>
							</tr>
							<!-- 상단체크시 노출부분 -->
								<tr>
									<th>웨딩홀음식타입</th>
									<th>
									<select name="hallFoodtype">
										<option value="0">한식</option>
										<option value="1">중식</option>
										<option value="2">일식</option>
										<option value="3">양식</option>
										<option value="4">뷔폐</option>
									</select>
									</th>
								</tr>
								<tr>
									<th>웨딩홀 음식메뉴</th>
									<th><input type="text" name="hallFoodmenu" value=" "></th>
								</tr>
								<tr>
									<th>웨딩홀음식가격</th>
									<th><input type="text" name="hallFoodmenu" value=" "></th>
								</tr>
							<!--  -->
								<tr>
									<th>웨딩홀 주류제공</th>
									<th><input type="checkbox" name="hallServiceDrink"></th>
								</tr>
								<tr>
									<th>웨딩홀 음향제공</th>
									<th><input type="checkbox" name="hallServiceAudio"></th>
								</tr>
								<tr>
									<th>웨딩홀 음향제공</th>
									<th><input type="checkbox" name="hallServiceAudio"></th>
								</tr>
								<tr>
									<th>웨딩홀운영시간</th>
									<th><input type="number" name="hallStartTime" value="0">-<input type="number" name="hallEndTime" value="0"></th>
								</tr>
								
								<tr>
									<th>웨딩홀 주차제공</th>
									<th><input type="checkbox" name="hallServiceParking"></th>
								</tr>
						</table>					
						<span id="hallStep" class="lastBtn">다음</span>
					</div>
					<div id="sixth" class="divbox" style="display:none;"><!-- 최종등록-->
							<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>사진등록</th>
								<th><input type="file" name="fileName" value=" "></th>
							</tr>
							<tr>
								<th>해쉬태그</th>
								<th><input type="text" name="hashTag" value=" "></th>
							</tr>
							</table>		
							<button type="submit">제출</button>
					</div>		
				</div>
				
				<div id="studioOption" class="divbox" style="display:none;"><!--스튜디오 옵션  -->
					<h1>스튜디오 옵션</h1>
					<div id='studioOptionTableDiv'>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>스튜디오 옵션명</th>
								<th><input type="text" name="studioOption" value=" " id="studioOption"></th>
							</tr>
							<tr>
								<th>스튜디오 옵션가격</th>
								<th><input type="number" name="studioOptionPrice" value="0" id="studioOptionprice"></th>
							</tr>
							<tr>
								<th>스튜디오 옵션분류</th>
								<th>
									<select name="studioOptionType">
										<option value="0">본식</option>
										<option value="1">스튜디오</option>
										<option value="2">영상</option>
									</select>
								
								</th>
							</tr>					
						</table>
					</div>
						<span id="studioOptionAdd">옵션추가</span><br>
						<span id="studioOption" class="lastBtn">다음</span>
				</div>
				<div id="hallOption" class="divbox" style="display:none;"><!-- 예식장옵션 -->
					
					<h1>예식장등록</h1>
					<div id="hallOptionTableDiv">
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>홀타입</th>
								<th>
									<select name="hallSelectType">
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
								</th>
							</tr>
							<tr>
								<th>예식장이름(홀이름)</th>
								<th><input type="text" name="hallSelectName" value=" "></th>
							</tr>
							<tr>
								<th>홀대여가격</th>
								<th><input type="number" name="hallSelectPrice" value=0></th>
							</tr>
							<tr>
								<th>웨딩홀비고</th>
								<th><input type="text" name="hallSelectEtc" value=" "></th>
							</tr>
						</table>
					</div>
					<span id="hallOptionAdd">옵션추가</span><br>
					<span id="hallOption" class="hallOpt">다음</span>
				</div>			
			</form>	
		</div>	
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
	<%--  footer --%>
</section>

<script><!--페이지 처리 스크립트-->
	$(document).ready(function(){
		$('#first').css("display","block");	
	});
	
	$('#firstStep').click(function(){
		$('.divbox').css("display","none");
		$('#second').css("display","block");
	});
	
	$('#secondStep').click(function(){
		$('.divbox').css("display","none");
		if($('#choice').val()==0){
			$('#seventh').css("display","block");
		}
		if($('#choice').val()==1){
			$('#third').css("display","block");
		}
		if($('#choice').val()==2){
			$('#fourth').css("display","block");
		}
		if($('#choice').val()==3){
			$('#hallOption').css("display","block");
		}
	});
	
	$('.hallOpt').click(function(){
		$('.divbox').css("display","none");
		$('#fiveth').css("display","block");
	});
	
	$('#studioStep').click(function(){
		$('.divbox').css("display","none");
		$('#studioOption').css("display","block");
	});
	
	
	
	
	$('.lastBtn').click(function(){
		$('.divbox').css("display","none");
		$('#sixth').css("display","block");
	});
	
	$(document).on("click","#test1",function(){
		
	});
</script>
<script><!--옵션추가 스크립트-->
	$('#hallOptionAdd').click(function(){
		var addTable ="";
		addTable += '<table class="comm-tbl"><colgroup><col width="18%"><col width="/"></colgroup><tr><th>홀타입</th>';
		addTable += '<th><select name="hallSelectType"><option value="0">갤러리</option><option value="1">골프장</option>';
		addTable += '<option value="2">공공장소</option><option value="3">레스토랑</option><option value="4">문화공간</option>';
		addTable += '<option value="5">선박</option><option value="6">스튜디오</option><option value="7">웨딩홀</option>';
		addTable += '<option value="8">펜션</option><option value="9">하우스웨딩홀</option></select></th></tr>';
		addTable += '<tr><th>예식장이름(홀이름)</th><th><input type="text" name="hallSelectName"></th></tr>';
		addTable += '<tr><th>홀대여가격</th><th><input type="number" name="hallSelectPrice" value=0></th></tr>';
		addTable += '<tr><th>웨딩홀비고</th><th><input type="text" name="hallSelectEtc" value=" "></th></tr></table>';
		
		$('#hallOptionTableDiv').append(addTable);
	});
	
	$('#studioOptionAdd').click(function(){
		var addTable ="";			
		addTable += '<table class="comm-tbl"><colgroup><col width="18%"><col width="/">'
		addTable +='</colgroup><tr><th>스튜디오 옵션명</th><th><input type="text" name="studioOption" value=" " id="studioOption"></th>'
		addTable +='</tr><tr><th>스튜디오 옵션가격</th><th><input type="number" name="studioOptionPrice" value="0" id="studioOptionprice"></th>'
		addTable +='</tr><tr><th>스튜디오 옵션분류</th><th><select name="studioOptionType"><option value="0">본식</option>'
		addTable +='<option value="1">스튜디오</option><option value="2">영상</option></select></th></tr></table>'
		$('#studioOptionTableDiv').append(addTable);
	});
	

</script>




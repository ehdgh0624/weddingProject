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
				<div id="first" class="divbox" style="display: none;">
					<!-- 기본정보 -->
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
							<th>우편번호</th>
							<td><input type="text" id="sample4_postcode"
								placeholder="우편번호" name="postNum">
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
								</div>
						</td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="sample4_roadAddress"
								placeholder="도로명주소" name="roadAddr"> <span id="guide"
								style="color: #999; display: none"></span></td>
						</tr>

						<tr>
							<th>지번주소</th>
							<th><input type="text" id="sample4_jibunAddress"
								placeholder="지번주소" name="jibunAddr"> <input type="text"
								id="sample4_extraAddress" placeholder="참고항목" name="extraAddr"></th>
						</tr>

						<tr>
							<th>상세주소</th>
							<th><input type="text" id="sample4_detailAddress"
								placeholder="상세주소" name="detailAddr"></th>
						</tr>
						<tr>
							<th>업체전화번호</th>
							<th><input type="text" name="companyPhone" value=" "></th>
						</tr>
					</table>
					<span id="firstStep">다음</span>
				</div>

				<div id="seventh" class="divbox" style="display: none;">
					<!-- 최종등록-->
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
				<div id="second" class="divbox" style="display: none;">
					<!-- 분류선택 -->
					<h1>분류선택</h1>
					<table class="comm-tbl">
						<colgroup>
							<col width="18%">
							<col width="/">
						</colgroup>
						<tr>
							<th>선택</th>
							<th><select name="code" id="choice">
									<option value="0">스튜디오</option>
									<option value="1">드레스</option>
									<option value="2">메이크업</option>
									<option value="3">홀</option>
							</select></th>
						</tr>
					</table>
					<span id="secondStep">다음</span>
				</div>
				<div id="third" class="divbox" style="display: none;">
					<!--드레스인경우  -->
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
	
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }

	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';

	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
</script>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->


<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53cf14lzrh&submodules=geocoder"></script>
   
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

		<div class="area" style="min-height:644px;">
			<form action="/companyEnroll.do" method="post" enctype="multipart/form-data" id="formTag">
				<div class="comm-tbl-box" >
				<div id="first" class="divbox" style="display: none;">
					<!-- 기본정보 -->
					<h1 class="main-comm-tit type2">파트너 기본정보 등록</h1>
					<div class="tbl-check-box clearfix">
						<label for="getMemberInfo" class="fr"><input type="checkbox" id="getMemberInfo" value=" " name="getMemberInfo"> 내 회원정보가져오기 </label>
					</div>
					<table class="comm-tbl">
						<colgroup>
							<col width="18%">
							<col width="/">
						</colgroup>
						<tr>
							<th>업체이름</th>
							<th><input type="text" name="companyName"  id="companyName"></th>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" class="small" id="sample4_postcode" placeholder="우편번호" name="postNum" readonly="readonly">
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
								</div>
								<input type="hidden" name="companyLatitude" id="shopLatitude">
								<input type="hidden" name="companyLongtitude" id="shopLongitude">
							</td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="sample4_roadAddress"
								placeholder="도로명주소" name="roadAddr" readonly="readonly"> <span id="guide"
								style="color: #999; display: none"></span></td>
						</tr>

						<tr>
							<th>지번주소</th>
							<th><input type="text" id="sample4_jibunAddress"
								placeholder="지번주소" name="jibunAddr" readonly="readonly"> <input type="text"
								id="sample4_extraAddress" placeholder="참고항목" name="extraAddr" style="margin-top:3px;"></th>
						</tr>

						<tr>
							<th>상세주소</th>
							<th><input type="text" id="sample4_detailAddress"
								placeholder="상세주소" name="detailAddr" required="required"></th>
						</tr>
						<tr>
							<th>업체전화번호</th>
							<th><input type="text" name="fPhone" id="fPhone" value=" " class="small num"> - 
							<input type="text" id="sPhone" name="sPhone" class="small num"> - 
							<input type="text" id="tPhone" name="tPhone" class="small num">
							</th>
						</tr>
					</table>
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="firstStep" class="btn-style3 small fr" style="margin:0;">다음</button>
					</div>
				</div>

				<div id="seventh" class="divbox" style="display: none;">
					<h1 class="main-comm-tit type2">스튜디오 등록</h1>
					<!-- 스튜디오-->
					<table class="comm-tbl">
						<colgroup>
							<col width="18%">
							<col width="/">
						</colgroup>
						<tr>
							<th>스튜디오평균가격</th>
							<th><input type="text" name="studioPrice" value="" id="studioPrice" class="num middle"> 원</th>
						</tr>
						<tr>
							<th>스튜디오평균시간</th>
							<th><input type="text" name="studioTime" value="" placeholder="ex)평균적으로 3시간, 3시간, 등등" id="studioTime"></th>
						</tr>
						<tr>
							<th>촬영장비</th>
							<th><input type="text" name="studioCamera" value="" id="studioCamera"></th>
						</tr>
					</table>
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="studioBackStep" class="backBtn btn-style3 small fl" style="margin:0;">이전</button>
						<button type="button" id="studioStep" class="studioBtn btn-style3 small fr" style="margin:0;">다음</button>
					</div>
				</div>
				<div id="second" class="divbox" style="display: none;">
					<!-- 분류선택 -->
					<h1 class="main-comm-tit type2">분류선택</h1>
					<table class="comm-tbl">
						<colgroup>
							<col width="18%">
							<col width="/">
						</colgroup>
						<tr>
							<th>선택</th>
							<th><select name="code" id="choice">
									<option value="H">웨딩홀</option>
									<option value="D">드레스</option>
									<option value="S">스튜디오</option>
									<option value="M">메이크업&헤어</option>
							</select></th>
						</tr>
					</table>
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="secondBack" class="btn-style3 small fl" style="margin:0;">이전</button>
						<button type="button" id="secondStep" class="btn-style3 small fr" style="margin:0;">다음</button>
					</div>
				</div>
				<div id="third" class="divbox" style="display: none;">
					<!--드레스인경우  -->
					<h1 class="main-comm-tit type2">드레스</h1>
					<table class="comm-tbl">
						<colgroup>
							<col width="18%">
							<col width="/">
						</colgroup>
						<tr>
							<th>드레스피팅가격</th>
							<td><input type="text" name="dressFittingPrice" value="" id="dressFittingPrice"></td>
						</tr>
						<tr>
							<th>드레스피팅시간</th>
							<td><input type="text" name="dressFittingTime" value="" id="dressFittingTime"></td>
						</tr>
						<tr>
							<th>드레스대여가능갯수</th>
							<td><input type="text" name="dressRentNum" value="" id="dressRentNum" class="num middle"> 개</td>
						</tr>
						<tr>
							<th>드레스렌트가격</th>
							<td><input type="text" name="dressRentPrice" value="" id="dressRentPrice" class="num middle"> 원</td>
						</tr>
						<tr>
							<th>보석렌트가격</th>
							<td><input type="text" name="jewelryPrice" value="" id="jewelryPrice" class="num middle"> 원</td>
						</tr>
						<tr>
							<th>체크옵션</th>
							<td><label for="dressMending"><input type="text" id="dressMending" name="dressMending" value=" "> 가봉여부 </label>
								<label for="dressParking"><input type="text" id="dressParking" name="dressParking" value=" "> 주차여부 </label>
							</td>
						</tr>
						<tr>
							<th>추가상세설명</th>
							<th><input type="text" name="dressContent" value="" id="dressContent"></th>
						</tr>
					</table>
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="dressBackStep" class="backBtn btn-style3 small fl" style="margin:0;">이전</button>
						<button type="button" id="dressStep" class="lastBtn btn-style3 small fr" style="margin:0;">다음</button>
					</div>
				</div>
				<div id="fourth"  class="divbox" style="display:none;"><!--메이크업  -->
						<h1 class="main-comm-tit type2">메이크업</h1>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>메이크업기본가격</th>
								<td><input type="number" name="makeupBasicPrice" value="" id="makeupBasicPrice" class="num middle"> 원</td>
							</tr>
							<tr>
								<th>혼주메이크업 가격</th>
								<td><input type="number" name="makeupParentPrice" value="" id="makeupParentPrice" class="num middle"> 원</td>
							</tr>
							<tr>
								<th>하객메이크업 가격</th>
								<td><input type="number" name="makeupVisitorPrice" value="" id="makeupVisitorPrice" class="num middle"> 원</td>
							</tr>
						</table>
						<div class="common-tbl-btn-group clearfix">
							<button type="button" id="makeupBackStep" class="backBtn btn-style3 small fl" style="margin:0;">이전</button>
							<button type="button" id="makeupStep" class="lastBtn btn-style3 small fr" style="margin:0;">다음</button>
						</div>
					</div>

					<div id="fiveth" class="divbox" style="display:none;"><!-- 홀 -->
						<!-- 체크시 아래 음식관련 도출 -->
						<h1 class="main-comm-tit type2">웨딩홀</h1>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>웨딩홀 최소인원</th>
								<th><input type="number" name="hallMinPerson" value="" id="hallMinPerson"></th>
							</tr>
							<tr>
								<th>웨딩홀 최대인원</th>
								<th><input type="number" name="hallMaxPerson" value="" id="hallMaxPerson"></th>
							</tr>
							<tr>
								<th>웨딩홀 타입</th>
								<th>
									<select name="hallType">
										<option value="갤러리">갤러리</option>
										<option value="골프장">골프장</option>
										<option value="공공장소">공공장소</option>
										<option value="레스토랑">레스토랑</option>
										<option value="문화공간">문화공간</option>
										<option value="선박">선박</option>
										<option value="스튜디오">스튜디오</option>
										<option value="웨딩홀">웨딩홀</option>
										<option value="펜션">펜션</option>
										<option value="하우스웨딩홀">하우스웨딩홀</option>			
									</select>
								</th>
							</tr>
							<tr>
								<th>웨딩홀 식사제공</th>
								<th><input type="text" name="hallServiceFood" value=" "></th>
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
									<th>웨딩홀 기본가격</th>
									<th><input type="number" name="hallPrice" value="" id="hallPrice"></th>
								</tr>
								<tr>
									<th>웨딩홀 음식메뉴</th>
									<th><input type="text" name="hallFoodmenu" value="" id="hallFoodmenu"></th>
								</tr>
								<tr>
									<th>웨딩홀음식가격</th>
									<th><input type="number" name="hallFoodprice" value="" id="hallFoodprice"></th>
								</tr>
								<tr>
									<th>웨딩홀 주류제공</th>
									<th><input type="text" name="hallServiceDrink" value=" "></th>
								</tr>
								<tr>
									<th>웨딩홀 음향제공</th>
									<th><input type="text" name="hallServiceAudio" value=" "></th>
								</tr>						
								<tr>
									<th>웨딩홀 주차제공</th>
									<th><input type="text" name="hallServiceParking" value=" "></th>
								</tr>
						</table>
						<div class="common-tbl-btn-group clearfix">
							<button type="button" id="hallBackStep" class="backBtn2 btn-style3 small fl" style="margin:0;">이전</button>
							<button type="button" id="hallStep" class="lastBtn btn-style3 small fr" style="margin:0;">다음</button>
						</div>
					</div>
					<div id="sixth" class="divbox" style="display:none;"><!-- 최종등록-->
						
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>대표사진등록</th>
								<th>
									<label for="imgInp" style="display:inline-block; border:1px solid #eee;">
										<img id="img" name="img"  src="/resources/img/noimg.jpg" width="100px" height="100px">
									</label>
									<input type="file" name="fileName"  id="imgInp" value="" required="required" class="middle">
								</th>
							</tr>
							<tr>
								<th>해쉬태그</th>
								<th><input type="text" name="hashTag" value="" required="required" id="tag"></th>
							</tr>
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>상세설명</th>
								<th><input type="text" name="companyContent" value="" required="required"></th>
							</tr>
						</table>		
						<div class="common-tbl-btn-group clearfix">
							<button type="button" id="finalBackBtn" class="backBtn3 btn-style3 small fl" style="margin:0;">이전</button>
							<button type="submit" id="finalSubmit" class="lastBtn btn-style1 small fr" style="margin:0;">제출</button>
						</div>
					</div>		
				</div>
				<div id="studioOption" class="divbox" style="display:none;"><!--스튜디오 옵션  -->
					<h1 class="main-comm-tit type2">스튜디오 옵션</h1>
					<div id='studioOptionTableDiv'>
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>스튜디오 옵션명</th>
								<td><input type="text" name="studioOption" value="" id="studioOptionName"></td>
							</tr>
							<tr>
								<th>스튜디오 옵션가격</th>
								<td><input type="text" name="studioOptionPrice" value="" id="studioOptionprice" class="num middle"> 원</td>
							</tr>
							<tr>
								<th>스튜디오 옵션분류</th>
								<td>
									<select name="studioOptionType">
										<option value="0">본식</option>
										<option value="1">스튜디오</option>
										<option value="2">영상</option>
									</select>
								
								</td>
							</tr>					
						</table>
					</div>
					<!-- 
						<span id="studioOptionAdd">옵션추가</span><br>
						<span id="studioOptionBackStep" class="backBtn2">이전</span>
						<span id="studioOption" class="lastBtn">다음</span>
					 -->
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="studioOptionAdd" class="btn-style1 small">옵션추가</button>
						<button type="button" id="studioOptionBackStep" class="backBtn2 btn-style3 small fl" style="margin:0;">이전</button>
						<button type="button" id="studioOption" class="lastBtn btn-style3 small fr" style="margin:0;">제출</button>
					</div>
				</div>
				<div id="hallOption" class="divbox" style="display:none;"><!-- 예식장옵션 -->
					<h1 class="main-comm-tit type2">웨딩홀 등록</h1>
					<div id="hallOptionTableDiv">
						<table class="comm-tbl">
							<colgroup>
								<col width="18%">
								<col width="/">
							</colgroup>
							<tr>
								<th>웨딩홀 이름(홀이름)</th>
								<td><input type="text" name="hallSelectName" value="" id="hallSelectName"></td>
							</tr>
							<tr>
								<th>웨딩홀 인원(최소)</th>
								<td><input type="text" name="hallSelectPerson" value="" id="hallSelectPerson" class="num middle"> 명 </td>
							</tr>
							<tr>
								<th>웨딩홀 시간</th>
								<td><input type="text" name="hallSelectTime" value="" id="hallSelectTime" class="middle"> ex) 09시 ~ 18시</td>
							</tr>
							<tr>
								<th>웨딩홀 대여가격</th>
								<td><input type="text" name="hallSelectPrice" value="" id="hallSelectPrice" class="num middle"> 원</td>
							</tr>
							<tr>
								<th>웨딩홀 비고</th>
								<td><input type="text" name="hallSelectEtc" value="" id="hallSelectEtc"></td>
							</tr>
						</table>
					</div>
					<!-- <span id="hallOptionAdd">옵션추가</span><br>
					<span id="hallOption]BackStep" class="backBtn">이전</span>
					<span id="hallOption" class="hallOpt">다음</span> -->
					<div class="common-tbl-btn-group clearfix">
						<button type="button" id="hallOption]BackStep" class="backBtn btn-style3 small fl" style="margin:0;">이전</button>
						<button type="button" id="hallOption" class="hallOpt btn-style1 small fr" style="margin:0;">제출</button>
						<button type="button" id="hallOptionAdd" class="btn-style2 small fr">옵션추가</button>
					</div>
				</div>			
			</form>	
			<input type="hidden" id="totalAddr" value="${sessionScope.member.addr }">
			<input type="hidden" id="memberPhone" value="${sessionScope.member.phone }">
		</div>	
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
	<%--  footer --%>

</section>

<script>

<!--널값 처리 스크립트-->
$('#finalSubmit').click(function(){
	if($('#studioPrice').val()==""||$('#studioTime').val()==""||$("#studioCamera").val()==""){
		$('#studioPrice').val('0');
		$('#studioTime').val('0');
		$("#studioCamera").val(0);
	};
	if($('#dressFittingPrice').val()==""||$('#dressFittingTime').val()==""||$("#dressRentNum").val()==""||$("#dressRentPrice").val()==""||$("#jewelryPrice").val()==""||$("#dressContent").val()==""){
		$('#dressFittingPrice').val('0');
		$('#dressFittingTime').val('0');
		$("#dressRentNum").val(0);
		$("#dressRentPrice").val(0);
		$("#jewelryPrice").val(0);
		$("#dressContent").val(0);
	};
	if($('#makeupBasicPrice').val()==""||$('#makeupParentPrice').val()==""||$("#makeupVisitorPrice").val()==""){
		$('#makeupBasicPrice').val('0');
		$('#makeupParentPrice').val('0');
		$("#makeupVisitorPrice").val('0');
	};
	if($('#hallMinPerson').val()==""||$('#hallMaxPerson').val()==""||$("#hallFoodmenu").val()==""||$("#hallFoodprice").val()==""){
		$('#hallMinPerson').val('0');
		$('#hallMaxPerson').val('0');
		$("#hallFoodmenu").val('0');
		$("#hallFoodprice").val('0');
		$("#hallprice").val('0');
	};
	if($('#studioOptionName').val('')==""||$('#studioOptionprice').val()==""){
		$('#studioOptionprice').val('0');
		$('#studioOptionName').val('0')
	};
	if($('#hallSelectName').val()==""||$('#hallSelectPerson').val()==""||$('#hallSelectTime').val()==""||$('#hallSelectPrice').val()==""||$('#hallSelectEtc').val()==""){
		$('#hallSelectName').val('0');
		$('#hallSelectPerson').val('0');
		$('#hallSelectTime').val('0');
		$('#hallSelectPrice').val('0');
		$('#hallSelectEtc').val('0');
	};
});

	
	


	$(document).ready(function(){
		$('#first').css("display","block");	
	});
	
	$('#firstStep').click(function(){
		if($('#companyName').val()==""||$('#sample4_detailAddress').val()==""||$('#fPhone').val()==""||$('#sPhone').val()==""||$('#tPhone').val()==""){
			alert("모든정보를 입력해주십시오");
		}else{
			$('.divbox').css("display","none");
			$('#second').css("display","block");
		}
	
	});
	
	$('#secondStep').click(function(){
		$('.divbox').css("display","none");
		if($('#choice').val()=="S"){
			$('#seventh').css("display","block");
		}
		if($('#choice').val()=="D"){
			$('#third').css("display","block");
		}
		if($('#choice').val()=="M"){
			$('#fourth').css("display","block");
		}
		if($('#choice').val()=="H"){
			$('#hallOption').css("display","block");
		}
	});

	$('#secondBack').click(function(){
		$('.divbox').css("display","none");
		$('#first').css("display","block");	
	});
	
	$('.hallOpt').click(function(){
		$('.divbox').css("display","none");
		$('#fiveth').css("display","block");
	});
	
	$('#studioStep').click(function(){
		
		if($('#studioPrice').val()==""||$('#studioTime').val()==""||$("#studioCamera").val()==""){
			alert("모든정보를 입력해주십시오");
		}else{
			$('.divbox').css("display","none");
			$('#studioOption').css("display","block");
		}
	});
	
	$('.lastBtn').click(function(){
		$('.divbox').css("display","none");
		$('#sixth').css("display","block");
	});
	$('.backBtn').click(function(){
		$('.divbox').css("display","none");
		$('#second').css("display","block");
	});
	$('#studioOptionBackStep').click(function(){
		$('.divbox').css("display","none");
		$('#seventh').css("display","block");
	});

	$('#hallBackStep').click(function(){
		$('.divbox').css("display","none");
		$('#hallOption').css("display","block");
	});
	
	$('#finalBackBtn').click(function(){
		$('.divbox').css("display","none");
		if($('#choice').val()=="S"){
			$('#studioOption').css("display","block");
		}
		if($('#choice').val()=="D"){
			$('#third').css("display","block");
		}
		if($('#choice').val()=="M"){
			$('#fourth').css("display","block");
		}
		if($('#choice').val()=="H"){
			$('#fiveth').css("display","block");
		}
	});
	
	
	
	$('input[id="getMemberInfo"]').change(function() {
	    var value = $(this).val();              // value
	    var checked = $(this).prop('checked');  // checked 상태 (true, false)
	    if(checked){
	    	var string=$('#totalAddr').val();
	    	var phone=$('#memberPhone').val();
			var strArray=string.split('/');
			var phoneArray=phone.split('/');
		$('#sample4_jibunAddress').val(strArray[0]);
		$('#sample4_extraAddress').val(strArray[1]);
		$('#sample4_detailAddress').val(strArray[2]);
		$('#sample4_postcode').val(strArray[3]);
		$('#sample4_roadAddress').val(strArray[4]);
		
		$('#fPhone').val(phoneArray[0]);
		$('#sPhone').val(phoneArray[1]);
		$('#tPhone').val(phoneArray[2]);
		
	    } else{
			$('#sample4_jibunAddress').val("");
			$('#sample4_extraAddress').val("");
			$('#sample4_detailAddress').val("");
			$('#sample4_postcode').val("");   
			$('#sample4_roadAddress').val();
			
			$('#fPhone').val("");
			$('#sPhone').val("");
			$('#tPhone').val("");
	    }
	});
	

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script><!--옵션추가 스크립트-->
	$('#hallOptionAdd').click(function(){
		var addTable ="";
		addTable += '<br><table class="comm-tbl"><colgroup><col width="18%"><col width="/"></colgroup><tr><th>예식장이름(홀이름)</th>';
		addTable += '<th><input type="text" name="hallSelectName" value=" "></th></tr>';
		addTable += '<tr><th>웨딩홀 인원(최소)</th><td><input type="text" name="hallSelectPerson" value="0" class="num middle"> 명</td></tr>';
		addTable += '<tr><th>웨딩홀 시간</th><td><input type="text" name="hallSelectTime" value=" " class="middle"> ex) 09시 ~ 18시</td></tr>';
		addTable += '<tr><th>웨딩홀 대여가격</th><td><input type="number" name="hallSelectPrice" value="0" class="num middle"> 원</td></tr>';
		addTable += '<tr><th>웨딩홀비고</th><td><input type="text" name="hallSelectEtc" value=" "></td></tr></table>';
		
		$('#hallOptionTableDiv').append(addTable);
	});
	
	$('#studioOptionAdd').click(function(){
		var addTable ="";			
		addTable += '<br><table class="comm-tbl"><colgroup><col width="18%"><col width="/">'
		addTable +='</colgroup><tr><th>스튜디오 옵션명</th><td><input type="text" name="studioOption" value=" " id="studioOptionName"></td>'
		addTable +='</tr><tr><th>스튜디오 옵션가격</th><td><input type="text" name="studioOptionPrice" value="0" id="studioOptionprice" class="num middle"> 원</td>'
		addTable +='</tr><tr><th>스튜디오 옵션분류</th><td><select name="studioOptionType"><option value="0">본식</option>'
		addTable +='<option value="1">스튜디오</option><option value="2">영상</option></select></th></tr></table>'
		$('#studioOptionTableDiv').append(addTable);
	});
	

	
	<!--주소-->
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
	
	
	
	
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});


	



	$('#firstStep').click(function() {
		var roadAddr = $('#sample4_roadAddress').val();
		console.log(roadAddr);
		naver.maps.Service.geocode({
	        address: roadAddr
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	        var result = response.result, // 검색 결과의 컨테이너
	            items = result.items; // 검색 결과의 배열
	         $('#shopLatitude').val(items[0].point.y);
	         $('#shopLongitude').val(items[0].point.x);
	    });	
	});
</script>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imgInp").change(function() {
        readURL(this);
    });        
           
    $("#tag").focus(function() {
		if ($("#tag").val() == "") {
			$("#tag").val("#");
		}

	});
	$("#tag").keyup(function(e) {
		if (e.keyCode == '32') {
			$("#tag").val($("#tag").val() + ",#");
		}
	});
  </script>




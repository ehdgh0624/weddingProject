<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp" />

<%-- wrap --%>
<section id="adminWrap">
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53cf14lzrh&submodules=geocoder"></script>
	<div id="adminHeader">
		<h1 class="logo">
			<a href="/"><img src="/resources/img/logo.png"
				style="max-width: 50px"></a>
		</h1>
	</div>
	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<c:if test="${sessionScope.member.memberCode != 2 }">
			<h2 class="comm-content-tit">드레스 업체수정</h2>
		</c:if>
		<c:if test="${sessionScope.member.memberCode == 2 }">
			<h2 class="comm-content-tit">업체 상세보기</h2>
		</c:if>
		<div class="area">
			<div class="common-tbl-box">
				<form action="/studioUpdate.do" method="post">
					<table class="comm-tbl">
						<colgroup>
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>업체명</th>
							<th><input type="text" name="dressName"
								value="${dress.dressName }"><input type="hidden"
								value="${dress.dressNo }" id="no"></th>
						</tr>
	
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="dressTelFi" id="first" class="small num"> - <input
								type="text" name="dressTelSe" id="second" class="small num"> - <input
								type="text" name="dressTelth" id="third" class="small num"></td>
						</tr>
	
						<tr>
							<th>드레스피팅가격</th>
							<td><input type="text" class="num middle" name="dressFittingPrice"
								value="${dress.dressFittingPrice }"> 원</td>
						</tr>
	
						<tr>
							<th>드레스대여가능개수</th>
							<td><input type="text" class="num middle" name="dressRentPrice"
								value="${dress.dressRentPrice }"> 개</td>
						</tr>
						<tr>
							<th>드레스가봉</th>
							<td><input type="text" name="dressMending"
								value="${dress.dressMending }"></td>
						</tr>
						<tr>
							<th>드레스대여가격</th>
							<td><input type="text" class="num middle" name="jewelryPrice"
								value="${dress.jewelryPrice }"> 원</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" id="sample4_postcode" class="small"
								placeholder="우편번호" name="postNum" value="${post }">
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
								</div> <input type="hidden" name="studioLatitude" id="shopLatitude"
								value="${dress.dressLatitude }"> <input type="hidden"
								name="studioLongtitude" id="shopLongitude"
								value="${maekup.dressLongitud }"></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="sample4_roadAddress"
								placeholder="도로명주소" name="roadAddr"> <span id="guide"
								style="color: #999; display: none"></span></td>
						</tr>
	
						<tr>
							<th>지번주소</th>
							<td><input type="text" id="sample4_jibunAddress"
								placeholder="지번주소" name="jibunAddr"> <input type="text"
								id="sample4_extraAddress" placeholder="참고항목" name="extraAddr" style="margin-top:4px;"></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" id="sample4_detailAddress"
								placeholder="상세주소" name="detailAddr"></td>
						</tr>
						<tr>
							<th>드레스 상세설명</th>
							<td><input type="text" name="dressContent"
								value="${dress.dressContent }"></td>
						</tr>
						<tr>
							<th>업체 상태설정</th>
							<td><select name="viewstatus">
									<option value="3">비공개</option>
									<option value="2">공개</option>
							</select></td>
						</tr>
					</table>
					<c:if test="${sessionScope.member.memberCode != 2}">
						<div class="common-tbl-btn-group" style="margin-bottom:20px;">
							<button type="submit" class="btn-style1 small" id="updateDress">수정</button>
						</div>
					</c:if>
				</form>
	
				<c:if test="${sessionScope.member.memberCode != 2}">
					<div>
						<!-- <button>추가</button> -->
						<form action="/saveGallery.do" method="post"
							enctype="multipart/form-data">
							<table class="comm-tbl type2" id="gall">
								<colgroup>
									<col width="20%">
									<col width="/">
									<col width="20%">
									<col width="10%">
								</colgroup>
								<tr>
									<th>No</th>
									<th>파일이미지</th>
									<th>미리보기</th>
									<th>삭제</th>
								</tr>
								<c:if test="${not empty galleryList }">
									<c:forEach items="${galleryList }" var="s" varStatus="i">
										<tr>
											<td>${i.count }</td>
											<td><span>${s.filename }</span></td>
											<td><img src="/resources/dress/${s.filepath }"
												style="width: 300px; height: 300px"></td>
											<td><input type="hidden" value="${s.filepath }"
												class="oldpath">
											<button onclick='imgDelete(this)' type='button'
													class='imgDelete'>삭제</button></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty galleryList }">
									<tr class="list-none">
										<td colspan="4"><p class="none small">사진 내역이 없습니다.</p></td>
									</tr>
								</c:if>
							</table>
							<input type="hidden" value="${dress.dressNo }" name="prdNo">
							<input type="hidden" value="D" name="code">
							<div class="common-tbl-btn-group right">
								<button type="submit" class="btn-style1 small" id="imgSub">저장</button>
							</div>
						</form>
					</div>
					<br>
					<br> 
					<div class="common-tbl-btn-group left" style="padding-top:0;display:inline-block;position:relative;top:-61px;">
						<button type="button" class="btn-style2 small" id="addGallery">사진추가하기</button> 
						<input type="hidden" id="totalAddr" value="${dress.dressAddr }"> 
						<input type="hidden" id="phone" value="${dress.dressTel }">
					</div>
				</c:if>
			</div>
		</div>
	</div>



	<script>
		var count = 0;
		$('#addGallery').click(function() {
							count = count + 1;
							var addTable = "<tr class='imgtr'><td></td><td><label for='filename'><input type='file' class='filename' onchange='chk(this)' name='filename'></label></td>";
							addTable += "<td><img src='' style='width:300px; heigth:300px' class='img-view'></td>";
							addTable += "<td><button onclick='imgDelete(this)' type='button'class='imgDelete'>삭제</button></td>";
							addTable += "<tr>";
							if($("#gall").has('.list-none')){
								$('.list-none').remove();
								$('#gall').append(addTable);
							}else{
								$('#gall').append(addTable);
							}
						});

		function chk_file_type(obj) {
			var file_kind = obj.value.lastIndexOf('.');
			var file_name = obj.value.substring(file_kind + 1, obj.length);
			var file_type = file_name.toLowerCase();

			var check = new Array();
			check = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp', 'jfif' ];

			if (check.indexOf(file_type) == -1) {
				alert("등록 할 수 없는 파일명 입니다.");
				$(obj).val("");
				return false;
			} else {
				return true;
			}
		}

		function imgDelete(tt) {
			count = count - 1;
			var filepath = $(tt).prev().val();
			var code = "D";
			console.log(filepath);
			$.ajax({
				url : "/deleteGallery.do",

				data : {
					filepath : filepath,
					code : code
				},

				type : "get",
				success : function(data) {
					if (data > 0) {
						alert("수정성공");
						console.log("삭제성공");
					} else {
						console.log("삭제실패");
					}
				},
				error : function() {
					console.log("ajax실패")
				}

			})
			$(tt).parent().parent().remove();
		}

		$(document).ready(function() {

			var string = $('#totalAddr').val();
			var strArray = string.split('/');

			$('#sample4_jibunAddress').val(strArray[0]);
			$('#sample4_extraAddress').val(strArray[1]);
			$('#sample4_detailAddress').val(strArray[2]);
			$('#sample4_postcode').val(strArray[3]);
			$('#sample4_roadAddress').val(strArray[4]);

			var stringTel = $('#phone').val();
			var stringTelArray = stringTel.split('/');
			$('#first').val(stringTelArray[0]);
			$('#second').val(stringTelArray[1]);
			$('#third').val(stringTelArray[2]);

		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}

		var infoWindow = new naver.maps.InfoWindow({
			anchorSkew : true
		});

		$('#updateStudio').click(function() {
			var roadAddr = $('#sample4_roadAddress').val();
			console.log(roadAddr);
			naver.maps.Service.geocode({
				address : roadAddr
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

		$("#imgSub").click(function(e) {
			if ($("#gall").children().find('tr').is(".imgtr")) {
				for (var i = 0; i < count; i++) {
					if ($(".filename").eq(i).val() == "") {
						alert("파일이 비어있습니다.");
						$(".filename").eq(i).focus();
						e.preventDefault();		
						return;
					}
				}
			}else{
				alert("사진을 추가하지 않았습니다.")
				e.preventDefault();
			}
		});
		
		function chk(f) {
			chk_file_type(f);
			if (f.files.length != 0 && f.files[0] != 0 && chk_file_type(f)) {
				//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
				//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
				reader.onload = function(e) { //다 읽어 왔으면 실행
					$(f).parent().parent().next().children('.img-view').attr('src', e.target.result);
				}
			} else {
				$(f).parent().parent().next().children('.img-view').attr('src', "");
			}
		}
	</script>

	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>




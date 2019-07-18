<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=53cf14lzrh&submodules=geocoder"></script>
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="common-tbl-box">
		<form action="/studioUpdate.do" method="post">
			<h2 class="comm-content-tit">스튜디오 업체수정</h2>
			<table class="comm-tbl">		
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					
					<tr>
						<th>업체명</th>
						<th><input type="text" name="studioName" value="${studio.studioName }"><input type="hidden" value="${studio.studioNo }" id="no"></th>
					</tr>
					
					<tr>
						<th>전화번호</th>
						<th><input type="text" name="studioTelFi" id="first">-<input type="text" name="studioTelSe" id="second">-<input type="text" name="studioTelth" id="third"></th>
					</tr>
					
					<tr>
						<th>스튜디오금액</th>
						<th><input type="number" name="studioPrice" value="${studio.studioPrice }" ></th>
					</tr>
					
					<tr>
						<th>설명</th>
						<th><input type="text" name="studioContent" value="${studio.studioContent }"></th>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="postNum" value="${post }">
							<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
							</div>
							<input type="hidden" name="studioLatitude" id="shopLatitude" value="${Studio.studioLatitude }">
							<input type="hidden" name="studioLongtitude" id="shopLongitude" value="${Studio.studioLongitud }">
						</td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddr">
						<span id="guide" style="color:#999;display:none"></span></td>
					</tr>
					
					<tr>
						<th>지번주소</th>
						<th><input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddr">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="extraAddr"></th>
					</tr>
					
					<tr>
						<th>상세주소</th>
						<th><input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr"></th>
					</tr>
					
					<tr>
						<th>스튜디오 촬영장비</th>
						<th><input type="text" name="studioCamera" value="${studio.studioCamera }"></th>
					</tr>
					<tr>
						<th>촬영시간</th>
						<th><input type="text" name="studioTime" value="${studio.studioTime }"></th>
					</tr>
					<tr>
						<th>업체 상태설정</th>
						<th>
							<select name="viewstatus">
								<option value="3">비공개</option>
								<option value="2">공개</option>
							</select>
						</th>
					</tr>
				</table>
				<hr>
			<button type="submit" class="btn-style1" id="updateStudio">수정</button>
		</form>
		<div>
			<button>추가</button>
			<form action="/saveGallery.do" method="post" enctype="multipart/form-data">
			<table class="comm-tbl" id="gall">
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
					<c:forEach items="${galleryList }" var="s" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>
							<span>${s.filename }</span>
						</td>
						<td><img src="${s.filepath }" style="width:300px;height:300px"></td>
						<td><input type="hidden" value="${s.filepath }">
						<span class="imgDelete">삭제</span></td>
					</tr>
					</c:forEach>
			</table>
			<input type="hidden"  value="${studio.studioNo }" name="prdNo">
			<input type="hidden" value="S" name="code">
			<button type="submit">저장</button>
			</form>
		</div>
		<br><br>
		<span id="addGallery">사진추가하기</span>		
		
		
		<div id="studioOption" class="divbox"><!--스튜디오 옵션  -->
		<h1>스튜디오 옵션</h1>
		<div id='studioOptionTableDiv'>
			<table class="comm-tbl" id="studioOptionTable0">
				<colgroup>
					<col width="15%">
					<col width="/">
				</colgroup>
				<c:forEach items="${studioSelectList0}" var="ss0" varStatus="i">
					<c:set var="countS" value="${i.count }"/>
				</c:forEach>
				<tr>
					<th rowspan="${countS+1}" class="ssnapRow" id="rowThF">본식스냅
						<button class="tsnapRow"  id="addList0">추가</button>
						<button class="tsnapRow" id="selectList0">옵션전체삭제</button>
					</th>
				</tr>
				<c:forEach items="${studioSelectList0}" var="ss0" varStatus="i">
					<tr class="fsnap">
						<td><input type="hidden" value="${ss0.studioSelectNo }">
						<input type="text" value="${ss0.studioOption}"><span class="deleteOption">삭제</span>
						<input type="text" value="${ss0.studioOptionPrice}"><span class="updateOption">수정</span></td>
					</tr>
				</c:forEach>
			</table>
							
			<table class="comm-tbl" id="studioOptionTable1">
				<colgroup>
					<col width="15%">
					<col width="/">
				</colgroup>
				<c:forEach items="${studioSelectList1}" var="ss1" varStatus="i">
					<c:set var="countS" value="${i.count }"/>
				</c:forEach>
				<tr>
					<th rowspan="${countS+1}" class="ssnapRow" id="rowThS">스튜디오 스냅
						<button class="tsnapRow"  id="addList1">추가</button>
						<button class="tsnapRow" id="selectList1">옵션전체삭제</button>
					</th>
				</tr>
				<c:forEach items="${studioSelectList1}" var="ss1" varStatus="i">
					<tr class="ssnap">
						<td><input type="hidden" value="${ss1.studioSelectNo }">
						<input type="text" value="${ss1.studioOption}"><span class="deleteOption">삭제</span>
						<input type="text" value="${ss1.studioOptionPrice}"><span class="updateOption">수정</span></td>
					</tr>
				</c:forEach>
			</table>
				
			<table class="comm-tbl" id="studioOptionTable2">
				<colgroup>
					<col width="15%">
					<col width="/">
				</colgroup>
				<c:forEach items="${studioSelectList2}" var="ss2" varStatus="i">
					<c:set var="countS" value="${i.count }"/>
				</c:forEach>
				
				<tr>
					<th rowspan="${countS+1}" class="ssnapRow" id="rowThT">영상스냅
						<button class="tsnapRow" id="addList2">추가</button>
						<button class="tsnapRow" id="selectList2">옵션전체삭제</button>
					</th>
				</tr>
				<c:forEach items="${studioSelectList2}" var="ss2" varStatus="i">
					<tr class="tsnap">
						<td><input type="hidden" value="${ss2.studioSelectNo }">
						<input type="text" value="${ss2.studioOption}"><span class="deleteOption">삭제</span>
						<input type="text" value="${ss2.studioOptionPrice}"><span class="updateOption">수정</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		<input type="hidden" id="totalAddr" value="${studio.studioAddr }">
		<input type="hidden" id="phone" value="${studio.studioTel }">
	</div>
</div>	



<script type="text/javascript">


$('#addGallery').click(function(){
	
	var addTable="<tr><td></td><td><label for='filename'><input type='file' class='filename' name='filename'></label></td>";
	addTable+= "<td><img src='' style='width:300px; heigth:300px'></td>";
	addTable+= "<td><span class='imgDelete'>삭제</span></td>";
	addTable+= "<tr>";
	
	$('#gall').append(addTable);
});


$('.imgDelete').click(function(){
	 var filepath = $(this).prev('input').val();
		console.log(filepath);
		$.ajax({
			url:"/deleteGallery.do",

			data:{filepath:filepath},

			type:"get",
			success:function(data){
				if(data>0){
					alert("수정성공");
					console.log("삭제성공");
				}else{
					console.log("삭제실패");
				}
			},
			error : function(){
				console.log("ajax실패")
			}
			
		})
		 $(this).parent().parent().remove();
});









$(document).ready(function(){	
	var string=$('#totalAddr').val();
	var strArray=string.split('/');

	$('#sample4_jibunAddress').val(strArray[0]);
	$('#sample4_extraAddress').val(strArray[1]);
	$('#sample4_detailAddress').val(strArray[2]);
	$('#sample4_postcode').val(strArray[3]);
	$('#sample4_roadAddress').val(strArray[4]);

	var stringTel=$('#phone').val();
	var stringTelArray=stringTel.split('/');
	$('#first').val(stringTelArray[0]);
	$('#second').val(stringTelArray[1]);
	$('#third').val(stringTelArray[2]);
	
});






<!--옵션수정-->
$('.updateOption').click(function(){
	var optionNo=$(this).prev().prev().prev().prev('input').val();
	var option = $(this).prev().prev().prev('input').val();
	var price = $(this).prev('input').val();
	
	$.ajax({
		url:"/updateOneStudioOption.do",

		data:{option:option,price:price,optionNo:optionNo},

		type:"get",
		success:function(data){
			if(data>0){
				alert("수정성공");
				console.log("수정성공");
			}else{
				console.log("수정실패");
			}
		},
		error : function(){
			console.log("ajax실패")
		}
		
	})
});





<!--개별삭제-->
$('.deleteOption').click(function(){
	var optionNo = $(this).parent().children().eq(0).val();
	var select = $(this);
	console.log(optionNo);
	$.ajax({
		url:"/deleteOneStudioOption.do",
		data:{optionNo:optionNo},
		type:"get",
		success:function(data){
			if(data>0){
				alert("삭제성공");
				console.log("삭제성공");
				select.parent('td').remove();
			}else{
				console.log("삭제실패");
			}
		},
		error : function(){
			console.log("ajax실패")
		}
	})
});

<!--옵션추가-->
$('#addList0').click(function(){
	
	var addTable="";
	var studioNo=${studio.studioNo};
	addTable+="<tr class='fsnap'><td><form action='/studioOptionAdd.do' method='post'> <input type='text' value='' name='studioOption'><button type='submit'>추가</button> ";
	addTable+="<input type='text' name='studioOptionPrice'>";
	addTable+="<input type='hidden'  name='studioOptionType' value='0'>";
	addTable+="<input type='hidden' name='studioNo' value='"+studioNo+"'>";
	addTable+="</form></td></tr>";

	var number=$('#rowThF').attr('rowspan');

	$('#rowThF').attr('rowspan',number+1);
	
	$('#studioOptionTable0').append(addTable);
	
});
$('#addList1').click(function(){
	
	var addTable="";
	var studioNo=${studio.studioNo};
	addTable+="<tr class='ssnap'><td><form action='/studioOptionAdd.do' method='post'> <input type='text' value='' name='studioOption'><button type='submit'>추가</button> ";
	addTable+="<input type='text' name='studioOptionPrice'>";
	addTable+="<input type='hidden'  name='studioOptionType' value='1'>";
	addTable+="<input type='hidden' name='studioNo' value='"+studioNo+"'>";
	addTable+="</form></td></tr>";

	var number=$('#rowThF').attr('rowspan');

	$('#rowThS').attr('rowspan',number+1);
	
	$('#studioOptionTable1').append(addTable);
	
});
$('#addList2').click(function(){
	
	var addTable="";
	var studioNo=${studio.studioNo};
	addTable+="<tr class='ssnap'><td><form action='/studioOptionAdd.do' method='post'> <input type='text' value='' name='studioOption'><button type='submit'>추가</button> ";
	addTable+="<input type='text' name='studioOptionPrice'>";
	addTable+="<input type='hidden'  name='studioOptionType' value='2'>";
	addTable+="<input type='hidden' name='studioNo' value='"+studioNo+"'>";
	addTable+="</form></td></tr>";

	var number=$('#rowThF').attr('rowspan');

	$('#rowThT').attr('rowspan',number+1);
	
	$('#studioOptionTable2').append(addTable);
	
});

<!--전체삭제-->
$('#selectList0').click(function(){
	var type=0;
	var no=$('#no').val();
	$.ajax({
		url:"/deleteStudioOption.do",
		data:{type:type,no:no},
		type:"get",
		success:function(data){
			alert("전체삭제성공");
			console.log("삭제성공")
			$('.fsnap').remove();
		},
		error : function(){
			console.log("ajax실패")
		}
		
	})
});


$('#selectList1').click(function(){
	var type=1;
	var no=$('#no').val();
	$.ajax({
		url:"/deleteStudioOption.do",
		data:{type:type,no:no},
		type:"get",
		success:function(data){
			
			if(data>0){
				alert("전체삭제성공");
				console.log("삭제성공");
				$('.ssnap').remove();
				
			}else{
				console.log("삭제실패")
				
			}		
		},
		error : function(){
			console.log("ajax실패")
		
		}
		
	})
	
	
});
$('#selectList2').click(function(){
	var type=2;
	var no=$('#no').val();
	$.ajax({
		url:"/deleteStudioOption.do",
		data:{type:type,no:no},
		dataType: 'text',
		type:"get",
		success:function(data){
			alert("전체삭제성공");
			console.log("삭제성공")
			$('.tsnap').remove();
		},
		error : function(){
			console.log("ajax실패")
		}
		
	})
	
});

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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


$('#updateStudio').click(function() {
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

	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>




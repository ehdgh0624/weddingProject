<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<div class="area">
			<!-- 여기에 내용 작서어어어어어엉!!! -->
			<h2 class="comm-content-tit">계정관리</h2>
			<div class="common-tbl-box">
				
					<table class="comm-tbl">		
						<colgroup>
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="memberId" class="middle" value="${sessionScope.member.memberId }" readonly="readonly" id="memberId"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" class="middle" name="memberPw" value="${sessionScope.member.memberPw }" id="pwInput" readonly="readonly">
								<span id="pwck" class="comment" style="display:none;">8자리이상</span>
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" class="btn-style3 small" id="changePw">변경</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
							<input type="password" class="middle" name="pwCheck" id="ckpw">
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" class="btn-style3 small" id="savePw" style="display:none">저장</button>
								</div>
							</td>
						</tr>
					<form action="/memberUpdateEnroll.do" method="post">
						<tr>
							<th>이름<input type="hidden" value="${sessionScope.member.memberId }" name="memberId"></th>
							<td><input type="text" class="middle" name="memberName" value="${sessionScope.member.memberName }"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
							<input type="text" name="fPhone" id="fPhone" class="small" value="010" required="required"> <input type="text" name="sPhone" id="sPhone" class="small num phone" required="required"> - <input type="text" name="tPhone" id="tPhone" class="small num phone" required="required">
							<input type="hidden" id="phone" value="${sessionScope.member.phone }">
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" name="birthDay" value="${sessionScope.member.birthDay }" readonly="readonly" class="middle"></td>
						</tr>
										<tr>
							<th>우편번호</th>
							<td><input type="text" id="sample4_postcode" class="short" placeholder="우편번호" name="postNum" value="${post }" readonly="readonly">
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddr" readonly="readonly">
							<span id="guide" style="color:#999;display:none"></span></td>
						</tr>
						<tr>
							<th>지번주소</th>
							<td><input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddr" readonly="readonly">
							<input type="text" id="sample4_extraAddress" placeholder="지번주소 추가사항" name="extraAddr" style="margin-top:3px;" readonly="readonly"></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr" required="required"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" class="middle" value="${sessionScope.member.email }" readonly="readonly" id="emailInput">
							<span class="comment" style="display:inline-block; width:200px;" id="emailComment">ex) abcd1234@naver.com</span>
							<span class="comment" id="emailPass" style="display:none; width:200px; color:blue">인증완료</span>	
								<div class="common-tbl-btn-group join-btn-group">
									<button type="button" class="btn-style3 small" id="emailChange">이메일변경</button>
									<button type="button" class="btn-style3 small" id="emailCk" style="display:none;">이메일인증</button>
								</div>	
							</td>
						</tr>
					</table>
					<hr>
					<c:if test="${empty sessionScope.member.marrySchedule }">
						<span id="addInfo">추가입력!</span><br>
					</c:if>
					<div style="display:none" id="infoMarry">
						<table class="comm-tbl">
							<colgroup>
								<col width="20%">
								<col width="/">
							</colgroup>
							<tr>
								<th>결혼예정일</th>
								<td><input type="text" class="datepicker short" name="marrySchedule" value="${sessionScope.member.marrySchedule }" id="ck"></td>
							</tr>
							<tr>
								<th>예상하객수</th>
								<td><input type="number" class="short" name="expectVisitor" value="${sessionScope.member.expectVisitor }"> 명</td>
							</tr>
							<tr>
								<th>예산</th>
								<td><input type="number" class="short" name="budget" value="${sessionScope.member.budget }"> 만원</td>
							</tr>
						</table>	
					</div>
					<div class="common-tbl-btn-group">
						<button type="submit" class="btn-style1">수정</button>
						<button type="button" class="btn-style2" onclick="location.href='/memberDelete.do?memberId=${sessionScope.member.memberId}'">탈퇴</button>
					</div>
				</form>
			</div>
		</div>
		<input type="hidden" id="totalAddr" value="${sessionScope.member.addr }">
</div>	



<script>
$('#savePw').click(function(){
	 var pwinput = $("#pwInput").val();
	 var pwckinput =$("#ckpw").val();
	 var id=$("#memberId").val();
	 if(pwinput==pwckinput){
			$.ajax({
				url:"/changePw.do",
				data:{pwinput:pwinput,id:id},
				type:"get",
				dataType:"json",
				success:function(data){
					if(data.result==1){
						alert("변경완료");
						console.log(data.result);
					}else{
						alert("변경실패");
					}
				},
				error : function(){
					console.log("ajax실패");
					console.log(data.result);
				}
				
			});
	 }else{
		 alert("비밀번호가 일치하지않습니다");
	 }

});


$("#pwInput").keyup(function(){
	var pw=$("#pwInput").val();
	var checkpw2= /^[a-zA-Z0-9]{8,12}$/;
	var checkpw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&_\-\+\=])[A-Za-z\d$@$!%*#?&_\-\+\=]{8,50}$/;
	var check=/^[a-zA-Z0-9]{0,7}$/;
	if(checkpw2.test(pw)==true){
		$("#pwck").css("color","green");
		$("#pwck").html("사용가능:[보안수준 약함]");
		$("#savePw").css("display","block");
		console.log("ㅇㅇㅇㅇ");
	}
	if(checkpw.test(pw)==true){
		$("#pwck").css("color","blue");
		$("#pwck").html("사용가능:[보안수준 강함]");
		$("#savePw").css("display","block");
		console.log("ㅇㅇㅇㅇ");
	}
	if(check.test(pw)==true){
		$("#pwck").css("color","red");
		$("#pwck").html("사용불가능");
		$("#savePw").css("display","none");
	}
});

$("#emailChange").click(function(){
	
	$("#emailChange").css("display","none");
	$("#emailCk").css("display","inline-block");
	$("#emailInput").attr("readonly",false);
	
	
});

$("#changePw").click(function(){
	$("#pwInput").attr("readonly",false);
	$("#changePw").css("display","none");
	$("#pwck").css("display","block");
});

$("#savePw").click(function(){
	
	
});




$(document).ready(function(){
	var value=$('#ck').val();	
	if(value != ""){
		$('#infoMarry').css("display","block");
	}
	
	var string=$('#totalAddr').val();
	var strArray=string.split('/');

	$('#sample4_jibunAddress').val(strArray[0]);
	$('#sample4_extraAddress').val(strArray[1]);
	$('#sample4_detailAddress').val(strArray[2]);
	$('#sample4_postcode').val(strArray[3]);
	$('#sample4_roadAddress').val(strArray[4]);
	
	var phone=$('#phone').val();	
	var phoneArray=phone.split('/');
	$("#fPhone").val(phoneArray[0]);
	$("#sPhone").val(phoneArray[1]);	
	$("#tPhone").val(phoneArray[2]);

	console.log(strArray[0]);
});

$('#addInfo').click(function(){
	$('#infoMarry').css("display","block");
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

</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>




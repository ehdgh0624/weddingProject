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
		<!-- 여기에 내용 작서어어어어어엉!!! -->
	
		<div class="common-tbl-box">
		<form action="/memberUpdateEnroll.do" method="post">
			<h2 class="comm-content-tit">계정관리</h2>
			<table class="comm-tbl">		
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>아이디</th>
						<th><input type="text" name="memberId" value="${sessionScope.member.memberId }" readonly="readonly"></th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="password" name="memberPw" value="${sessionScope.member.memberPw }"></th>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<th><input type="password" name="pwCheck" ></th>
					</tr>
					<tr>
						<th>이름</th>
						<th><input type="text" name="memberName" value="${sessionScope.member.memberName }"></th>
					</tr>
					<tr>
						<th>전화번호</th>
						<th><input type="text" name="Phone" value="${sessionScope.member.phone }"></th>
					</tr>
					<tr>
						<th>생년월일</th>
						<th><input type="text" name="birthDay" value="${sessionScope.member.birthDay }" readonly="readonly"></th>
					</tr>
									<tr>
						<th>우편번호</th>
						<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="postNum" value="${post }">
							<div class="common-tbl-btn-group join-btn-group">
									<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn-style2 small">우편번호 찾기</button>
							</div>
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
						<th>이메일</th>
						<th><input type="text" name="email" value="${sessionScope.member.email }"></th>
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
							<th><input type="date" name="marrySchedule" value="${sessionScope.member.marrySchedule }" id="ck"></th>
						</tr>
						<tr>
							<th>예상하객수</th>
							<th><input type="number" name="expectVisitor" value="${sessionScope.member.expectVisitor }"></th>
						</tr>
						<tr>
							<th>예산</th>
							<th><input type="number" name="budget" value="${sessionScope.member.budget }"></th>
						</tr>
					</table>	
				</div>
			<button type="submit" class="btn-style1">수정</button>
		</form>
			<span onclick="location.href='/memberDelete.do?memberId=${sessionScope.member.memberId}'">탈퇴</span>
	</div>
	<input type="text" id="totalAddr" value="${sessionScope.member.addr }">
</div>	



<script>
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




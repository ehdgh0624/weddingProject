<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<section id="wrap">
	<div class="area">
		<h2 class="comm-content-tit" style="margin-top:30px;">회원가입</h2>
		<div class="common-tbl-box">
			<form action="/memberEnroll.do" method="post">
				<br>
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="memberId" class="middle"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="memberPw" class="middle"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pwCheck" class="middle"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="memberName" class="middle"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="fPhone" class="small"> - <input type="text" name="sPhone" class="small"> - <input type="text" name="tPhone" class="small"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birthDay" class="middle" placeholder="ex) 901122"> <span class="comment">ex) 901122</span></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" id="sample4_postcode" class="short" placeholder="우편번호" name="postNum">
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
						<td><input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunAddr">
						<input type="text" id="sample4_extraAddress" placeholder="지번주소 추가사항" name="extraAddr" style="margin-top:3px;"></td>
					</tr>
					
					<tr>
						<th>상세주소</th>
						<td><input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" class="middle"> <span class="comment">ex) abcd1234@naver.com</span></td>
					</tr>
					<!--  이후 수정페이지에서 등록예정
								-----------------필수항목x-----------------------------				
								결혼예정일 : <input type="date" name="marrySchedule"><br>
								예상하객수 : <input type="text" name="expectVisitor"><br>
								예산 : <input type="text" name="budget"><br>
							-->
				</table>
				<div class="common-tbl-btn-group">
					<button type="submit" class="btn-style1">회원가입</button>
					<button type="reset" class="btn-style3">초기화</button>
					<button type="button" onclick="location.href='/index.jsp'" class="btn-style2">메인페이지로</button>
					<br>

				</div>
			</form>
		</div>
	</div>
</section>

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
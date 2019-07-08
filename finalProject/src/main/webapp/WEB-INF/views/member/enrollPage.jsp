<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<section id="wrap">
	<div class="area">
		<h2 class="comm-content-tit">회원가입</h2>
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
						<th><input type="text" name="memberId"></th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="password" name="memberPw"></th>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<th><input type="password" name="pwCheck"></th>
					</tr>
					<tr>
						<th>이름</th>
						<th><input type="text" name="memberName"></th>
					</tr>
					<tr>
						<th>전화번호</th>
						<th><input type="text" name="Phone"></th>
					</tr>
					<tr>
						<th>생년월일</th>
						<th><input type="text" name="birthDay"></th>
					</tr>
					<tr>
						<th>주소</th>
						<th><input type="text" name="addr"></th>
					</tr>
					<tr>
						<th>이메일</th>
						<th><input type="text" name="email"></th>
					</tr>
					<!--  이후 수정페이지에서 등록예정
								-----------------필수항목x-----------------------------				
								결혼예정일 : <input type="date" name="marrySchedule"><br>
								예상하객수 : <input type="text" name="expectVisitor"><br>
								예산 : <input type="text" name="budget"><br>
							-->
				</table>
				<div class="login-btn-box">
					<button type="submit">회원가입</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='/index.jsp'">메인페이지로</button>
					<br>

				</div>
			</form>
		</div>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
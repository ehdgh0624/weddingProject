<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="/memberUpdate.do" method="post">
			<h2 class="comm-content-tit">계정관리</h2>
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
						<th><input type="text" name="birthDayF">-<input type="text" name="birthDayS"></th>
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
				<hr>
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>결혼예정일</th>
						<th><input type="date" name="marrySchedule"></th>
					</tr>
					<tr>
						<th>예상하객수</th>
						<th><input type="number" name="expectVisitor"></th>
					</tr>
					<tr>
						<th>예산</th>
						<th><input type="number" name="budget"></th>
					</tr>
				</table>	
			<button type="submit" class="btn-style1">수정</button>
		</form>
		<button type="button" onclick="location.href='/memberDelete.do'">회원탈퇴</button>
	</div>
	
</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


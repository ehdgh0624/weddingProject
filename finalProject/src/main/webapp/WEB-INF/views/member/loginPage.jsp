<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<h1>로그인</h1>
	<hr>
	<div class="area">
		<h2 class="comm-content-tit">로그인</h2>
		<div class="common-tbl-box">
		<form action="/login.do" form="post">
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
				</table>
				<button type="submit" >로그인</button><br>
				<button type="button" onclick="location.href='/goAddTerms.do'">회원가입</button><br>
		</form>
		</div>
	</div>
	<hr>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
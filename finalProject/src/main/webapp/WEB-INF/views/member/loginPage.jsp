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
		<form action="/login.do" form="post">
				아이디 : <input type="text" name="memberId"><br>
				비밀번호 : <input type="password" name="memberPw"><br>
				<button type="submit" >로그인</button><br>
				<button type="button" onclick="location.href='/memberEnroll.do'">회원가입</button><br>
		</form>
	</div>
	<hr>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
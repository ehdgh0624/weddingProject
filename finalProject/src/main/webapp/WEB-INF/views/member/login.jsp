<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<form action="/login.do" form="post">
				아이디 : <input type="text" name="memberName">
				비밀번호 : <input type="password" name="memberPw">
				<button type="submit" value="로그인"></button>
				<button type="button" onclick="location.href='/memberEnroll.do'" value="회원가입"></button>
		</form>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<fieldset>
			<legend>회원가입</legend>
			<form action="/memberEnroll.do" method="post">
				아이디 : <input type="text" name="memberId">
				비밀번호 : <input type="password" name="memberPw">
				비밀번호 확인 : <input type="password" name="pwCheck">
				생년월일 : <input type="text">-<input type="text">*******
				이메일 : <input type="text" name="email">
				주소 :<input type="text" name="addr">			
				-----------------필수항목x-----------------------------				
				결혼예정일 : <input type="date" name="marrySchedule">
				예상하객수 : <input type="text" name="expectVisitor">
				예산 : <input type="text" name="budget">			
				<button type="submit" value="회원가입"></button>
				<button type="reset" value="취소"></button>
				<button type="button" onclick="location.href='/index'"></button>
			</form>
		</fieldset>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
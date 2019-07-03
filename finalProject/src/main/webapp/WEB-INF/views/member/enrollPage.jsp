<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<fieldset>
		<table>
			<legend>회원가입</legend>
			<form action="/memberEnroll.do" method="post"><br>
				아이디 : <input type="text" name="memberId"><br>
				비밀번호 : <input type="password" name="memberPw"><br>
				비밀번호 확인 : <input type="password" name="pwCheck"><br>
				생년월일 : <input type="text">-<input type="text">*******<br>
				이메일 : <input type="text" name="email"><br>
				주소 :<input type="text" name="addr">			<br>
				<!--  이후 수정페이지에서 등록예정
				-----------------필수항목x-----------------------------				
				결혼예정일 : <input type="date" name="marrySchedule"><br>
				예상하객수 : <input type="text" name="expectVisitor"><br>
				예산 : <input type="text" name="budget"><br>-->	
				<button type="submit" value="회원가입">회원가입</button><br>
				<button type="reset" value="취소">초기화</button><br>
				<button type="button" onclick="location.href='/index'">메인페이지로</button><br>
			</form>
		</table>
		</fieldset>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
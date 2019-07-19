<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<h2 class="comm-content-tit" style="margin:80px 0 60px;" >아이디찾기</h2>
		<div class="comm-login-box" id="idpw"><!-- common-tbl-box -->
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>이메일입력</th>
						<th><input type="text" name="email" id="email" required="required"></th>
					</tr>
				</table>
				<div class="common-tbl-btn-group login-tbl-btn-group">
					<button type="button" class="btn-style1 login-btn" id="findId" >아이디찾기</button>
				</div>
			<button type="button" class="btn-style3" id="oneTimeLogin">일회용 로그인</button>
			<dvi style="float:right">
				<button type="button" class="btn-style3" id="findPw" onclick="location.href='/findPw.do'">비밀번호찾기/</button>
				<button type="button" class="btn-style3" id="findPw" onclick="location.href='/loginPage.do'">로그인페이지</button>
			</dvi>
		</div>
	</div>	
</section>
<script>

$("#findId").click(function(){
	var email=$("#email").val();
	openWin(email);
	
	
});
function openWin(data){  
    window.open("/idList.do?email="+data, "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  




</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
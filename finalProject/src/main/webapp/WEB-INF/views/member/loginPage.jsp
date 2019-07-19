<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<h2 class="comm-content-tit" style="margin:80px 0 60px;" >로그인</h2>
		<div class="comm-login-box" id="idpw"><!-- common-tbl-box -->
			<form action="/login.do" form="post" class="clearfix">
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>아이디</th>
						<th><input type="text" name="memberId" id="idInput" required="required"></th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="password" name="memberPw" id="pwInput" required="required"></th>
					</tr>
				</table>
				<div class="common-tbl-btn-group login-tbl-btn-group">
					<button type="submit" class="btn-style1 login-btn" id="login">로그인</button>
					<button type="button" class="btn-style3" onclick="location.href='/goAddTerms.do'">회원가입</button>
				</div>
			</form>
			<button type="button" class="btn-style3" id="oneTimeLogin">일회용 로그인</button>
		</div>
		<div class="comm-login-box" id="otloginbox" style="display:none;"><!-- common-tbl-box -->
			<form action="/oneTimelogin.do" form="post" class="clearfix">
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>숫자입력</th>
						<th><input type="text" name="number" id="idInput" required="required"></th>
					</tr>
				</table>
				<div class="common-tbl-btn-group login-tbl-btn-group">
					<button type="submit" class="btn-style1 login-btn" id="loginot">1회용로그인</button>
				</div>
			</form>
			<button type="button" class="btn-style3" id="idpwchange">아이디 로그인</button>
		</div>
	</div>
</section>
<script>
	$("#oneTimeLogin").click(function(){
		
		$("#otloginbox").css("display","block");
		$("#idpw").css("display","none");
	});
	
	$("#idpwchange").click(function(){
		
		$("#otloginbox").css("display","none");
		$("#idpw").css("display","block");
	});



	$("#login").click(function(){
		var idvalue=$("#idInput").val();
		var pwvalue=$("#pwInput").val();
		
		if(idvalue ==""){
			alert("아이디를 입력해주세요")
		}else{
			if(pwvalue==""){
				alert("비밀번호를 입력해주세요")
			}
		}
	});

</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
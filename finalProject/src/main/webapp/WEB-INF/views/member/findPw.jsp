<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<section id="wrap">
	<div class="area">
		<h2 class="comm-content-tit" style="margin:80px 0 60px;" >비밀번호찾기</h2>
		<div class="comm-login-box" id="idpw"><!-- common-tbl-box -->
			<form action="/sendPw.do" form="post" class="clearfix">
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>아이디입력</th>
						<th><input type="text" name="memberId" id="memberId" required="required"></th>
					</tr>
					<tr>
						<th>이메일입력</th>
						<th><input type="text" name="email" id="email" required="required"></th>
					</tr>
				</table>
				<div class="common-tbl-btn-group login-tbl-btn-group">
					<button type="submit" class="btn-style1 login-btn" id="login">메일보내기</button>
				</div>
			</form>
			<button type="button" class="btn-style3" id="oneTimeLogin">일회용 로그인</button>
			<dvi style="float:right">
				<button type="button" class="btn-style3" id="findPw" onclick="location.href='/findId.do'">아이디찾기/</button>
				<button type="button" class="btn-style3" id="findId" onclick="location.href='/loginPage.do'">로그인페이지</button>
			</dvi>
		</div>
	</div>
</section>
<script>
	$("#findId").click(function(){
		
		
	});

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
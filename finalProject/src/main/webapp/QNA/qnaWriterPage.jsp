<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<h1 style="margin-bottom: 20px;">QNA 글쓰기</h1>
		<form action="/qnaWrite.do" method="post">
			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="qnaTitle" id="qnaTitle"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="qnaWriter" value="${sessionScope.member.memberId }" readonly></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="qnaCategory" id="qnaCategory">
							<option value="">카테고리 선택</option>
							<option value="1">홀</option>
							<option value="2">스튜디오</option>
							<option value="3">드레스</option>
							<option value="4">메이크업</option>
							<option value="5">기타</option>
						</select>
					 </td>
				</tr>
				<tr>
					<th>비밀글 설정</th>
					<td>비밀번호 설정<input type="checkbox" name="qnaChk" id="pwchk"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>	
						<textarea rows="20" name="qnaContent" id="qnaContent"></textarea>
					</td>
				</tr>
			</table>
			<div class="common-tbl-btn-group" style="margin-top: 30px;padding-top:0;">
				<button type="submit" class="btn-style1" id="sub">글등록</button>
				<button type="button" class="btn-style4" id="hisBack">취소</button>
			</div>
		</form>
	</div>
</section>

<script>
	$("#pwchk").on("click",function(){
		if($(this).prop("checked")){
			$(this).after("<span><input type='password' name='qnaPw' id='qnaPw' class='middle'></span>");
		}else{
			$(this).siblings('span').remove();
		}
	});
	$("#hisBack").on("click",function(){
		window.history.back();
	});
	$("#sub").on("click",function(e){
		console.log($("#qnaContent").val() == "")
		if($("#qnaTitle").val()==""){
			alert("제목을 입력하여 주세요");
			$("#qnaTitle").focus();
			e.preventDefault();
		}else if($("#qnaCategory").val() ==""){
			alert("카테고리를 선택해 주세요");
			$("#qnaCategory").focus();
			e.preventDefault();
		}else if($("#qnaCategory").val() ==""){
			alert("카테고리를 선택해 주세요");
			$("#qnaCategory").focus();
			e.preventDefault();
		}else if($("#qnaPw").val()==""){
				alert("비밀번호를 확인해주세요");
				$("#qnaPw").focus();
				e.preventDefault();	
		}else if($("#qnaContent").val() == ""){
			alert("내용 작성을 해주세요");
			$("#qnaContent").focus();
			e.preventDefault();	
		} 
	});
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
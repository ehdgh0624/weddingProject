<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<h1 style="margin-bottom: 20px;">QNA 글쓰기</h1>
		<form action="/qnaUpdate.do" method="post">
			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="qnaTitle" required="required" value="${qna.qnaTitle }"><input type="hidden" name="qnaNo" value="${qna.qnaNo }"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="qnaWriter" value="${sessionScope.member.memberId }" readonly></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="qnaCategory" required="required">
							<option value="">카테고리 선택</option>
							<c:choose>
								<c:when test="${qna.qnaCategory == 1}">
									<option value="1" selected>홀</option>
									<option value="2">스튜디오</option>
									<option value="3">드레스</option>
									<option value="4">메이크업</option>
									<option value="5">기타</option>
								</c:when>
								<c:when test="${qna.qnaCategory == 2}">
									<option value="1">홀</option>
									<option value="2" selected>스튜디오</option>
									<option value="3">드레스</option>
									<option value="4">메이크업</option>
									<option value="5">기타</option>
								</c:when>
								<c:when test="${qna.qnaCategory == 3}">
									<option value="1">홀</option>
									<option value="2">스튜디오</option>
									<option value="3" selected>드레스</option>
									<option value="4">메이크업</option>
									<option value="5">기타</option>
								</c:when>
								<c:when test="${qna.qnaCategory == 4}">
									<option value="1">홀</option>
									<option value="2">스튜디오</option>
									<option value="3">드레스</option>
									<option value="4" selected>메이크업</option>
									<option value="5">기타</option>
								</c:when>
								<c:when test="${qna.qnaCategory == 5}">
									<option value="1">홀</option>
									<option value="2">스튜디오</option>
									<option value="3">드레스</option>
									<option value="4">메이크업</option>
									<option value="5" selected>기타</option>
								</c:when>
							</c:choose>
							
						</select>
					 </td>
				</tr>
				<tr>
					<th>비밀글 설정</th>
					<c:if test="${qna.qnaCheck == 0 }">
						<td>비밀번호 설정<input type="checkbox" name="qnaChk" id="pwchk" checked></td>
					</c:if>
					<c:if test="${qna.qnaCheck == 1 }">
						<td>비밀번호 설정<input type="checkbox" name="qnaChk" id="pwchk"></td>
					</c:if>
				</tr>
				<tr>
					<th>내용</th>
					<td>	
						<textarea rows="20" name="qnaContent" required="required">${qna.qnaContent }</textarea>
					</td>
				</tr>
			</table>
			<div class="common-tbl-btn-group" style="margin-top: 30px;padding-top:0;">
				<button type="submit" class="btn-style1">글수정</button>
				<button type="button" class="btn-style4" id="hisBack">취소</button>
			</div>
		</form>
	</div>
</section>

<script>
	$(document).ready(function(){
		if($("#pwchk").prop("checked")){
				$("#pwchk").after("<span><input type='password' name='qnaPw' class='middle' value='${qna.qnaPw}'></span>");
		}else{
			$("#pwchk").siblings('span').remove();
		}
	});
	$("#pwchk").on("click",function(){
		if($("#pwchk").prop("checked")){
				$("#pwchk").after("<span><input type='password' name='qnaPw' class='middle' value='${qna.qnaPw}'></span>");
		}else{
			$("#pwchk").siblings('span').remove();
		}
	});
	$("#hisBack").on("click",function(){
		window.history.go(-2);
	});
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
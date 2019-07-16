<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<h1 style="margin-bottom: 20px;">Notice 글쓰기</h1>
		<form action="/noticeWrite.do" method="post">
			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="noticeTitle" required="required"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="noticeWriter" value="${sessionScope.member.memberId }" readonly></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>	
						<textarea rows="20" name="noticeContent" required="required"></textarea>
					</td>
				</tr>
			</table>
			<div class="common-tbl-btn-group" style="margin-top: 30px;padding-top:0;">
				<button type="submit" class="btn-style1">글등록</button>
				<button type="button" class="btn-style4" onclick="window.history.back();">취소</button>
			</div>
		</form>
	</div>
</section>


<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
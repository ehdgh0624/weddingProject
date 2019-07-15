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
		<table class="comm-tbl type1">
			<colgroup>
				<col width="12.5%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td colspan="7">${qna.qnaTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qna.qnaWriter }</td>
				<th>카테고리</th>
				<c:choose>
						<c:when test="${qna.qnaCategory == 1 }">
							<td>웨딩 홀</td>						
						</c:when>
						<c:when test="${qna.qnaCategory == 2 }">
							<td>스튜디오</td>						
						</c:when>
						<c:when test="${qna.qnaCategory == 3 }">
							<td>드레스</td>						
						</c:when>
						<c:when test="${qna.qnaCategory == 4 }">
							<td>메이크업</td>						
						</c:when>
						<c:when test="${qna.qnaCategory == 5 }">
							<td>기타</td>						
						</c:when>
					</c:choose>
				<th>작성일</th>
				<td>${qna.qnaDate }</td>
				<th>답변상태</th>
				<c:choose>
					<c:when test="${qna.qnaStatus == 0 }">
						<td class="answerStay"> 답변 대기</td>
					</c:when>
					<c:when test="${qna.qnaStatus == 1 }">
						<td class="answerComplete"> 답변 완료</td>
					</c:when>
				</c:choose>
			</tr>
			<tr>
				<th >내용</th>
				<td colspan="7" rowspan="50">${qna.qnaContent }</td>
			</tr>
		</table>
			<div class="common-tbl-btn-group right" >
		<c:if test="${sessionScope.member.memberId == qna.qnaWriter }">
				<button class="btn-style2 small" onclick="location.href='/qnaUpdatePage.do?qnaNo=${qna.qnaNo}'">글수정</button>
				<button class="btn-style3 small" onclick="location.href='/qnaDelete.do?qnaNo=${qna.qnaNo}'">글삭제</button>
		</c:if>
				<button class="btn-style1 small" onclick="window.history.back()">목록으로</button>
			</div>
		<c:if test="${sessionScope.member.memberCode == 2 && qna.qnaStatus == 0 }">
			<form action="/commentUpdate.do?">
				<table class="comm-tbl" style="margin-top: 20px;">
					<colgroup>
						<col width="12.5%">
						<col width="/">
						<col width="12.5%">
					</colgroup>
					<tr>	
						<th>관리자 답변 <input type="hidden" value="${qna.qnaNo }" name="qnaNo"></th>
						<td><textarea rows="2" id="comment" name="qnaAnswer"></textarea> </td>
						<td>
							<div class="common-tbl-btn-group right" style="padding-top:0;">
								<button type="submit" class="btn-style1 small" >답변등록</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${qna.qnaStatus == 1 }">
			<table class="comm-tbl" style="margin-top: 20px;">
					<colgroup>
						<col width="12.5%">
						<col width="75%">
						<col width="12.5%">
					</colgroup>
					<tr>	
						<th>관리자 답변</th>
						<td> ${qna.qnaAnswer }</td>
						<td>
							${qna.qnaAnswerDate }
						</td>
					</tr>
			</table>
		</c:if>
	</div>
</section>
	

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
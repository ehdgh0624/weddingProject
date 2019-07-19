<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>


<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<table class="comm-tbl type1" style="margin-top: 30px;">
			<colgroup>
				<col width="16.666%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td colspan="5">${n.noticeTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${n.noticeWriter }</td>
				<th>작성일</th>
				<td>${n.noticeDate }</td>
				<th>조회수</th>
				<td>${n.noticeViews }</td>
			</tr>
			<tr>
				<th >내용</th>
				<td colspan="5" rowspan="50"><div class="boardContent" >${n.noticeContent }</div></td>
			</tr>
		</table>
			<c:if test="${sessionScope.member.memberCode == 2}">
			<div class="common-tbl-btn-group right" style="marmargin-bottom: 20px;padding-top:0;margin-top: 20px;">
			
			<button class="btn-style1 small" onclick="update();">글수정</button>
			<button class="btn-style1 small" onclick="noticeDelete();">삭제</button>
			<button class="btn-style1 small" onclick="window.history.back()">목록으로</button>
			</div>
			</c:if>
		  
	</div>
		
</section>

<script>
function update() {
	
	location.href="/noticeUpdateView.do?noticeNo="+${n.noticeNo};
}
function  noticeDelete() {
	location.href="/noticeDelete.do?noticeNo="+${n.noticeNo};
}

</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
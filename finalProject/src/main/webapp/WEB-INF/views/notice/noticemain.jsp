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
		<div style="text-align: right;  width: 1071px; ">
			<br>
			<br>
		</div>	
	
		<c:if test="${sessionScope.member.memberCode == 2}">
		<div class="common-tbl-btn-group right" style="marmargin-bottom: 20px;padding-top:0;margin-top: 20px;">
		<button class="btn-style1" onclick="location.href='/noticeWriting.do'">글쓰기</button>
		</div>
		 </c:if>
		<table class="comm-tbl type" style="margin-top: 20px;">
				<colgroup>
					<col width="7%">
					<col width="20%">
					<col width="40%">
					<col width="20%">
					<col width="13%">
				</colgroup>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${npd.list }" var="n">
					<tr>
						<td>${n.rnum } </td>
						<td>${n.noticeWriter }</td>
						<td><a href='/noticeView.do?noticeNo=${n.noticeNo }'>${n.noticeTitle }</a></td>
						<td>${n.noticeDate }</td>
						<td>${n.noticeViews }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="paging">${npd.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/noticeSearch.do" method="get">
               <input placeholder="글 제목를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	</div>
		
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
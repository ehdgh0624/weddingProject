<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp" />

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo">
			<a href="/"><img src="/resources/img/logo.png"
				style="max-width: 50px"></a>
		</h1>
	</div>
	<div id="memberTypeBtn" class="btn-wrap">
		<button class="btn-samll" onclick="location.href='/adminPage.do'">모든회원</button>
		<button class="btn-samll"
			onclick="location.href='/adminPage.do?sCode=1'">일반회원</button>
		<button class="btn-samll"
			onclick="location.href='/adminPage.do?sCode=2'">업체회원</button>
	</div>
	<div id="myPageContainer" class="clearfix area">
		<table class=comm-tbl>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="8%">
				<col width="32%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>가입일</th>
				<th>탈퇴</th>
			</tr>
			<c:forEach items="${list.list }" var="m">
				<tr>
					<td>${m.memberId }</td>
					<td>${m.memberName }</td>
					<td>${m.phone }</td>
					<td>${m.birthDay }</td>
					<td>${fn:replace(m.addr,'/',' ') }</td>
					<td>${m.enrollDate }</td>
					<td>
					<c:if test="${m.memberCode != 2 }">
						<button type="button" onclick="del(${m.memberNo})"class="delete-btn">탈퇴</button>
					</c:if>
						
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">${list.pageNavi}</div>
		<!-- 검색박스 -->
		<div class="board-search-box">
			<form action="/searchMember.do" method="get">
				<select name="type" id="type">
					<!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
					<option value="memberId">아이디</option>
					<option value="memberName">이름</option>
				</select> <input placeholder="검색어를 입력해주세요." type="search" name="keyword"
					class="search-word" value="${param.keyword }">
				<button type="submit" class="bbs-search-btn" title="검색">
					<img src="/resources/img/search_icon.png" style="width: 30px;">
				</button>
			</form>
		</div>
	</div>
	<script>
		function del(no){
			alert("벌써 탈퇴 시기지 마");
		}
		$(document).ready(function(){
			var type = '${param.type}';
			if(type == 'memberId'){
				$("option").eq(0).attr("selected","selected");
			}else if(type == 'memberName'){
				$("option").eq(1).attr("selected","selected");
			}
		});
		
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>


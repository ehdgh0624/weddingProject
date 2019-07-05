<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
	<div id="myPageContainer">
	<button onclick="location.href='/adminPage.do'">모든회원</button> 
	<button onclick="location.href='/adminPage.do?sCode=1'">일반회원</button> 
	<button onclick="location.href='/adminPage.do?sCode=2'">업체회원</button> 
	</div>
	<div id="myPageContainer" class="clearfix">
		<table class=comm-tbl>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>가입일</th>
				<th>탈퇴</th>
			</tr>
			<c:forEach items="${list.list }" var="m" >
				<tr>
					<td>${m.memberId }</td>
					<td>${m.memberName }</td>
					<td>${m.phone }</td>
					<td>${m.birthDay }</td>
					<td>${m.addr }</td>
					<td>${m.enrollDate }</td>
					<td><button type="button" onclick="del(${m.memberNo})" class="delete-btn">탈퇴</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">${list.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/searchMember.do" method="get">
               <select name="type"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
                  <option value="memberId">아이디</option>
                  <option value="memberName">이름</option>
               </select>
               <input placeholder="검색어를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	</div>
	<script>
		function del(no){
			alert("벌써 탈퇴 시기지 마");
		}
	
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


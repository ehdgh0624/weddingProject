<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<script>
//콤마찍기
function addComma(num) {
  return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

$(document).ready(function(){
	$(".price").each(function(){
		$(this).children("span").text(addComma($(this).children("span").html()));
	});
	
	$(".myReserv-price").children("p").each(function(){
		$(this).children("b").text(addComma($(this).children("b").html()));
	})
})
</script>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<h2 class="comm-content-tit">내가 등록한 경험담</h2>
		<div class="area">
			<div class="common-tbl-box">
				<table class="comm-tbl type1">		
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="/">
						<col width="20%">
						<col width="12%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>글번호</th>
						<th>작성자</th>
						<th>제목</th>							
						<th>작성일</th>
					</tr>
					<c:if test="${not empty ex2.exList}">
						<c:forEach var="e" items="${ex2.exList}" varStatus="i" >	
							<tr>
								<td>${e.experienceNo}</td>	<!-- 번호 -->
								<td>${e.experienceWriter}</td> <!-- 작성자 -->
								<td><a href="/experienceDetail.do?experienceNo=${e.experienceNo}">${e.experienceTitle}</td> <!-- 제목 -->
								<td><fmt:formatDate value="${e.experienceDate}"/></td> <!-- 작성일 -->
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty ex2.exList}">
						<tr>
							<td colspan="6"><p class="none">내가 등록한 경험담이 없습니다.</p></td>
						</tr>
					</c:if>
				</table>
				<div class="paging">
         			${ex2.pageNavi}
     		 	</div>
			</div>
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>



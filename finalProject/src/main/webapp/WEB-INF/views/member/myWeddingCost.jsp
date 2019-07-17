<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="common-tbl-box">
			<h2 class="comm-content-tit">웨딩비용계산</h2>

			<h1>웨딩비용계산리스트</h1>
			<table class="comm-tbl">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="/">
				</colgroup>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>지역</th>
					<th>인원</th>
					<th>금액</th>
					<th>날짜</th>
				</tr>
				<c:set var="total" value='0'></c:set>
				<!-- 총금액세팅 -->
				<c:forEach var="s" items="${simulator }">
					<tr class="listView">
						<td class="simNo">${s.simulatorNo }</td>
						<td>${s.weddingDate }</td>
						<td>${s.weddingLoc }</td>
						<td>${s.weddingPerson }</td>
						<td>${s.simulatorTotalPrice }</td>
						<td>${s.simulatorDate }</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</div>
	</div>
	<script type="text/javascript">
		$(".listView").click(function() {
			var simulatorNo = $(this).children('.simNo').html();
			detailView(simulatorNo);
		});

		function detailView(data) {
			var a=data;
			window.open("/detailViewCost.do?a="+a, "상세보기",
							"width=1200, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		}
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>



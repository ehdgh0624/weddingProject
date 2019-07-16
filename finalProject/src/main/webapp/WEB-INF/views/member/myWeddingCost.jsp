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

	<div id="myPageContainer" class="clearfix">
		<!-- 여기에 내용 작서어어어어어엉!!! -->
		<div class="common-tbl-box">
			<h2 class="comm-content-tit">웨딩비용계산</h2> 
				
					<h1> 웨딩비용계산리스트</h1>		
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
						<c:set var="total" value='0'></c:set>  <!-- 총금액세팅 -->
					<c:forEach var="s" items="${simulator }">
						<tr class="listView">
							<td>${s.simulatorNo }</td>
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
		$(".listView").click(function(){
			   window.open("/exCommentReg.do?experienceCommentNo="+a+"&experienceCommentRef="+b,
			            "","width=600,height=150,location=0,left=550, top=300,status=no,toolbar=no,scrollbars=no,resizable=No"); 
			
			
		});
		
		
	
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>



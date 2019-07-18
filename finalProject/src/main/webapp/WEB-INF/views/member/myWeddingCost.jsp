<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp" />

<style>
.comm-tbl.type2 tr.listDetail:hover td{background:none;}
</style>

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
		<h2 class="comm-content-tit">나의 웨딩 계산기 내역</h2>
		<div class="area">
			<div class="">
				<table class="comm-tbl type2">
					<colgroup>
						<col width="7%">
						<col width="/">
						<col width="/">
						<col width="/">
						<col width="/">
						<col width="/">
						<col width="10%">
					</colgroup>
					<tr>
						<th>No.</th>
						<th>예식일</th>
						<th>지역</th>
						<th>하객수</th>
						<th>총 금액</th>
						<th>계산 날짜</th>
						<th>Detail</th>
					</tr>
					<c:set var="total" value='0'></c:set>
					<c:if test="${not empty simulator }">
						<!-- 총금액세팅 -->
						<c:forEach var="s" items="${simulator }">
							<tr class="listView">
								<td class="simNo">${s.simulatorNo }</td>
								<td>${s.weddingDate }</td>
								<td>${s.weddingLoc }</td>
								<td>${s.weddingPerson }명</td>
								<td><strong class="total-price">${s.simulatorTotalPrice }</strong> 원</td>
								<td>${s.simulatorDate }</td>
								<td>
									<div class="common-tbl-btn-group" style="padding-top:0;">
										<button class="btn-style1 small detail-view-btn" onclick="detailView(this, ${s.simulatorNo })">상세 보기</button>
										<button class="btn-style3 small detail-close-btn" onclick="detailClose(this)" style="display:none;">상세 닫기</button>
									</div>
								</td>
							</tr>
							<!-- 상세보기가 들어가 -->
						</c:forEach>
					</c:if>
					<c:if test="${empty simulator }">
						<tr>
							<td colspan="7">
								<p class="none">나의 웨딩 계산기 내역이 존재하지 않습니다.</p>
							</td>
						</tr>
					</c:if>
				</table>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		//가격 콤마 찍기
		function addComma(num) {
			return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
	
		$(document).ready(function(){//
			/*$(".listView").click(function() {
				var simulatorNo = $(this).children('.simNo').html();
				detailView(simulatorNo);
			});*/
			
			//가격 콤마 찍기
			$(".total-price").each(function(){
				$(this).text(addComma($(this).html()));
			});
			
			
		});		
	
		function detailView(it, data) {
			var no = data;
			$.ajax({
				url : "/detailViewCost.do",
				data : {no : no},
				type : "post",
				dataType : "json",
				success : function(data){
					var html="";
					var detailView;
					html += "<tr class='listDetail'><td colspan='7'><div class='listDetail-box'><table class='comm-tbl type2'>";
					html += "<tr class='title'><th>CODE</th><th>업체명</th><th>가격</th><th>전화번호</th><th>업체지역</th></tr>";
					for(var i in data){
						detailView = data[i];
						if(data[i].code == 'H'){
							html += "<tr><td>웨딩홀</td>";
						}else if(data[i].code == 'D'){
							html += "<tr><td>드레스</td>";
						}else if(data[i].code == 'M'){
							html += "<tr><td>메이크업&헤어</td>";
						}else if(data[i].code == 'S'){
							html += "<tr><td>스튜디오</td>";
						}
						html += "<td>"+data[i].prdName+"</td>";
						html += "<td><span class='prd-price'>"+data[i].prdPrice+"</span> 원</td>";
						html += "<td>"+data[i].prdTel+"</td>";
						html += "<td>"+data[i].prdLoc+"</td></tr>";
					}
					html += "</table></div></td></tr>";
					
					var here = $(it).parent().parent().parent();
					$(html).insertAfter(here);
					
					console.log(data[0].code);
					
					//가격 콤마 찍기
					$(".prd-price").each(function(){
						$(this).text(addComma($(this).html()));
					});
					
					$(it).css('display','none');
					$(it).siblings('.detail-close-btn').css('display','block');
				},
				error : function(data){
					console.log("ajax 처리 실패");
				}
			});
			//window.open("/detailViewCost.do?a="+a, "상세보기","width=1200, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		}
		
		function detailClose(it){
			$(it).parent().parent().parent().next(".listDetail").remove();
			$(it).css('display','none');
			$(it).siblings(".detail-view-btn").css('display','block');
		}
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>



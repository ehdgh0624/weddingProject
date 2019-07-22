<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
	<!-- 업체 분류 페이지 버튼 -->
	<div id="companyTypeBtn" class="btn-wrap">
		<button class="btn-samll" onclick="location.href='/companyManager.do'">모든업체</button> 
		<button class="btn-samll" onclick="location.href='/companyManager.do?typeCode=1'">웨딩 홀</button> 
		<button class="btn-samll" onclick="location.href='/companyManager.do?typeCode=2'">스튜디오</button> 
		<button class="btn-samll" onclick="location.href='/companyManager.do?typeCode=3'">드레스</button> 
		<button class="btn-samll" onclick="location.href='/companyManager.do?typeCode=4'">메이크업</button> 
	</div>
	<div id="myPageContainer" class="clearfix area">
		<table class="comm-tbl type2">
		<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="30%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>업체 종류</th>
				<th>업체 이름</th>
				<th>신청자 아이디</th>
				<th>업체 전화번호</th>
				<th>업체 주소</th>
				<th>신청허가</th>
				<th>신청 거절</th>
			</tr>
			<c:forEach items="${ac.aList }" var="c" >
				<tr>
					<td title="${c.code }">
					<c:if test="${c.code eq 'H'}" > 호텔</c:if>
					<c:if test="${c.code eq 'S'}" > 스튜디오</c:if>
					<c:if test="${c.code eq 'D'}" > 드레스</c:if>
					<c:if test="${c.code eq 'M'}" > 메이크업</c:if>
					</td>
					<td  class="companyDetail" title="${c.comNo }">${c.name}</td>
					<td>${c.id }</td>
					<td>${c.tel}</td>
					<td>${c.addr }</td>
					<td style="text-align: center;"><button type="button" onclick="agree(${c.comNo},'${c.code }','${c.id } ')" class="agree-btn">신청 허가</button></td>
					<td style="text-align: center;"><button type="button" onclick="reject(${c.comNo},'${c.code }','${c.id }')" class="reject-btn">신청 거절</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">${ac.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/searchCompany.do" method="get">
               <select name="type"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
                  <option value="companyName">업체이름</option>
                  <option value="memberId">신청자아이디</option>
               </select>
               <input placeholder="검색어를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	</div>
	<script>
		function agree(num,code,id){
			location.href ='/agreeUpdate.do?num='+num+"&code="+code+"&id="+id;
		}
		function reject(num,code,id){
			location.href ='/rejectUpdate.do?num='+num+"&code="+code+"&id="+id;
		}
		$(document).ready(function(){
			var type = '${param.type}';
			if(type == 'companyName'){
				$("option").eq(0).attr("selected","selected");
			}else if(type == 'memberId'){
				$("option").eq(1).attr("selected","selected");
			}
		});
		$(".companyDetail").each(function(){
			$(this).on("click",function(){
			var code = $(this).prev().attr("title");
			var no = $(this).attr("title");
				location.href='/companyDetailView.do?prdNo='+no+'&code=${s.code }'+code;
			});
		});
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


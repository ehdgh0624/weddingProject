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
		<button class="btn-samll" onclick="location.href='/viewstatusManager.do'">모든업체</button> 
		<button class="btn-samll" onclick="location.href='/viewstatusManager.do?typeCode=1'">웨딩 홀</button> 
		<button class="btn-samll" onclick="location.href='/viewstatusManager.do?typeCode=2'">스튜디오</button> 
		<button class="btn-samll" onclick="location.href='/viewstatusManager.do?typeCode=3'">드레스</button> 
		<button class="btn-samll" onclick="location.href='/viewstatusManager.do?typeCode=4'">메이크업</button> 
	</div>
	<div id="viewManagerContainer" class="clearfix area">
		<table class=comm-tbl>
			<tr>
				<th>업체 종류</th>
				<th>업체 이름</th>
				<th>신청자 아이디</th>
				<th>업체 전화번호</th>
				<th>업체 주소</th>
				<th>공개/비공개 신청</th>
				
			</tr>
			<c:forEach items="${ac.aList }" var="c" >
				<tr>
					<td>
					<c:if test="${c.code eq 'H'}"> 호텔</c:if>
					<c:if test="${c.code eq 'S'}"> 스튜디오</c:if>
					<c:if test="${c.code eq 'D'}"> 드레스</c:if>
					<c:if test="${c.code eq 'M'}"> 메이크업</c:if>
					</td>
					<td>${c.name}</td>
					<td>${c.id }</td>
					<td>${c.tel}</td>
					<td>${c.addr }</td>
					<c:if test="${c.viewstatus == 2 }">
					<td style="text-align: center;"><button type="button" onclick="view(${c.comNo},'${c.code }')" class="agree-btn">공개설정</button></td>
					</c:if>
					<c:if test="${c.viewstatus == 3}">
					<td style="text-align: center;"><button type="button" onclick="unview(${c.comNo},'${c.code }')" class="reject-btn">비공개설정</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">${ac.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/viewManagerSearch.do" method="get">
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
		function view(num,code){
			location.href ='/viewUpdate.do?num='+num+"&code="+code;
		}
		function unview(num,code){
			location.href ='/unviewUpdate.do?num='+num+"&code="+code;
		}
		$(document).ready(function(){
			var type = '${param.type}';
			if(type == 'companyName'){
				$("option").eq(0).attr("selected","selected");
			}else if(type == 'memberId'){
				$("option").eq(1).attr("selected","selected");
			}
		});
	</script>
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>

<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<script>
function exintsert() {
	location.href="/experienceWriting.do";
	
}
</script>
<section id="wrap">
	<div class="area" >
	
		<div style="text-align: right;  width: 1165px; ">
			
			<c:if test="${not empty list}">	
			
			<div class="common-tbl-btn-group right" style="marmargin-bottom: 20px;padding-top:0;margin-top: 20px;">
			<button class="btn-style1 small" onclick="exintsert();">글등록</button>
			</div>
			
			</c:if>
			<br>
			<br>
		</div>	
		<div >		
		 	<c:forEach items="${expd.exList}" var="e" varStatus="i">
		 	  
				<div style="width:350px;height:350px;display:inline-block;margin:20px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);" class="photolist">
					<div style="padding:5px; height: 70%;">
						<div >
							<div>
							<a href="/experienceDetail.do?experienceNo=${e.experienceNo}">
							<img src = "/resources/upload/${e.experienceFilePath}" style="width:100%;height:60%;">
							
							</a>
							</div>
						</div>
					</div>
					<div style="padding:20px;">
						<div>
							<div>
							${e.experienceTitle}						
							</div>
						</div>
					</div>
				</div>
			
				<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
					<br>
				</c:if>
		 	</c:forEach>
		 </div>
		  <div class="paging">
            ${expd.pageNavi}
          </div>
          
		  <div class="board-search-box">
             <form action="/exsearchExperience.do" method="get">
              
               <input placeholder="글 제목을 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	 </div>	
</section>


<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>

<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
	
		<div style="text-align: right;  width: 1071px; ">
			<a href="/experienceWriting.do" >
				<span style="font-size: 15px; color: red; ">글등록</span>
			</a>
			<br>
			<br>
		</div>	
		<div style="text-align: center;">		
		 	<c:forEach items="${expd.exList}" var="e" varStatus="i">
		 	  
				<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235); ">
					<div style="padding:5px; height: 70%;">
						<div>
							<div>
							<a href="/experienceDetail.do?experienceNo=${e.experienceNo}">
							<img src = "/resources/upload/${e.experienceFilePath}" style="width:100%;height:60%;">
							대표사진 경로
							${e.experienceFileName} 
							대표사진명
							</a>
							</div>
						</div>
					</div>
					<div style="padding:20px;">
						<div>
							<div>
							${e.experienceTitle}
							제목
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
             <form action="" method="get">
               <select name="type"><!-- option 세부항목은 각자 알아서 넣으시면 됩니다. -->
                  <option value="title">제목</option> 
               </select>
               <input placeholder="검색어를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	 </div>	
</section>


<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
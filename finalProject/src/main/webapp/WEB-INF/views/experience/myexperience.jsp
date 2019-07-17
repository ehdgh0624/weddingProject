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
			<div style="text-align: center;">		
					<c:forEach items="${ex}" var="e">
				<div style="width:300px;height:300px;display:inline-block;margin:10px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);" class="photolist">
						<div style="padding:5px; height: 70%;">
						
							<div>
								<div>
								<a href="/experienceDetail.do?experienceNo=${e.experienceNo}">
								<img src = "/resources/upload/${e.experienceFilePath}" style="width:100%;height:60%;">
								
						
								<a href="/exChg.do?experienceNo=${e.experienceNo}">수정</a>
								<a href="/exDelete.do?experienceNo=${e.experienceNo}">삭제</a>
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
						<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
						</c:if>
				</div>
					</c:forEach>
			
			</div>
		</div>
	</section>
	
	
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

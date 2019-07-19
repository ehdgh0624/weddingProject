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
			<div>		
					<c:forEach items="${ex}" var="e">
				<div style="width:350px;height:350px;display:inline-block;margin:20px;box-shadow: 5px 5px 5px 5px rgb(235,235,235);" class="photolist">
						<div style="padding:5px; height: 70%;">
						
							<div>
								<div>
									<a href="/experienceDetail.do?experienceNo=${e.experienceNo}">
									<img src = "/resources/upload/${e.experienceFilePath}" style="width:100%;height:60%;">																
								</a>
								</div>
						
								
							</div>
						</div>
						<div style="padding:10px;">
							<div>
								<div  class="common-tbl-btn-group right" style="text-align: center; marmargin-bottom: 20px;padding-top:0;margin-top: 0px; ">
									${e.experienceTitle}
								<br>
								<br>
								
								<br>
									
										<button class="btn-style1 small" onclick="exChg();">수정</button>
										<button class="btn-style3 small" onclick="exDelete()">삭제</button>
								
								</div>
														
																	<%--  <a href="/exChg.do?experienceNo=${e.experienceNo}">수정</a>
																	<a href="/exDelete.do?experienceNo=${e.experienceNo}">삭제</a>																			  --%>
							</div>
						</div>
						<c:if test="i%3==0">				<!-- forEach가 3번 돌 때마다 개행 -->
						<br>
						</c:if>
				</div>
				<script>
							function exChg() {
								location.href="/exChg.do?experienceNo="+${e.experienceNo};
							
							}
							function exDelete() {
								location.href="exDelete.do?experienceNo="+${e.experienceNo};
							
							}
				</script>
					</c:forEach>
			
			</div>
		</div>
	</section>
	
	
	
	
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

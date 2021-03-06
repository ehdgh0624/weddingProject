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
		<div class="area">
			<h2 class="comm-content-tit">나의 업체 관리</h2>
			<div class="common-tbl-box">
				<table class="comm-tbl type2">		
					<colgroup>
						<col width="10%">
						<col width="/%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>업체 분류</th>
						<th>업체 명</th>
						<th>신청 상태</th>
						<th>업체 노출</th>
						<th>상세 보기</th>
					</tr>
					<c:if test="${not empty memberAll.studio}">	
						<c:forEach items="${memberAll.studio }" var="s">
							
						<tr>
							<td>스튜디오</td>
							<td><span>${s.studioName }</span></td>
							<td>
								<span>
									<c:if test="${s.status==1 }">
										허가완료
									</c:if>		
									<c:if test="${s.status==2 }">
										허가취소
									</c:if>	
									<c:if test="${s.status==0 }">
										대기중
									</c:if>					
								</span>
							</td>
							<td>
								<span>
									<c:if test="${s.viewstatus==0 }">
										<img width="24px" src="/resources/img/viewstatus_on.png">
									</c:if>		
									<c:if test="${s.viewstatus==1 }">
										<img width="24px" src="/resources/img/viewstatus_off.png">
									</c:if>	
									<c:if test="${s.viewstatus==2 }">
										공개 신청중
									</c:if>	
									<c:if test="${s.viewstatus==3 }">
										비공개 신청중
									</c:if>	
								</span>
							</td>
								<td>
								<c:if test="${s.status==1 }">
									<button class="agree-btn" type="button" onclick="location.href='/companyDetailView.do?prdNo=${s.studioNo }&code=${s.code }'">상세 보기</button>
								</c:if>	
									<c:if test="${s.status==2 }">
									<button onclick="cancel()">허가취소</button>
								</c:if>	
								<c:if test="${s.status==0 }">
									<button onclick="wait()">대기중</button>
								</c:if>	
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty memberAll.dress}">		
						<c:forEach items="${memberAll.dress }" var="d">
						<tr>
							<td>드레스</td>
							<td><span>${d.dressName }</span></td>
							<td>
								<span>
									<c:if test="${d.status==1 }">
										허가완료
									</c:if>		
									<c:if test="${d.status==2 }">
										허가취소
									</c:if>	
									<c:if test="${d.status==0 }">
										대기중
									</c:if>					
								</span>
							</td>
							<td>
								<span>
									<c:if test="${d.viewstatus==0 }">
										<img width="24px" src="/resources/img/viewstatus_on.png">
									</c:if>		
									<c:if test="${d.viewstatus==1 }">
										<img width="24px" src="/resources/img/viewstatus_off.png">
									</c:if>	
									<c:if test="${d.viewstatus==2 }">
										공개 신청중
									</c:if>	
									<c:if test="${d.viewstatus==3 }">
										비공개 신청중
									</c:if>	
								</span>
							</td>
							<td>
								<c:if test="${d.status==1 }">
									<button class="agree-btn" type="button" onclick="location.href='/companyDetailView.do?prdNo=${d.dressNo }&code=${d.code }'">상세 보기</button>
								</c:if>	
									<c:if test="${d.status==2 }">
									<button onclick="cancel()">허가취소</button>
								</c:if>	
								<c:if test="${d.status==0 }">
									<button onclick="wait()">대기중</button>
								</c:if>	
							</td>
						</tr>
						</c:forEach>	
					</c:if>
					<c:if test="${not empty memberAll.makeup}">		
						<c:forEach items="${memberAll.makeup }" var="m">
						<tr onclick="location.href='/companyDetailView.do?prdNo=${m.makeupNo }&code=${m.code }'">
							<td>메이크업</td>
							<td><span>${m.makeupName }</span></td>
							<td>
								<span>
									<c:if test="${m.status==1 }">
										허가완료
									</c:if>		
									<c:if test="${m.status==2 }">
										허가취소
									</c:if>	
									<c:if test="${m.status==0 }">
										대기중
									</c:if>					
								</span>
							</td>
							<td>
								<span>
									<c:if test="${m.viewstatus==0 }">
										<img width="24px" src="/resources/img/viewstatus_on.png">
									</c:if>		
									<c:if test="${m.viewstatus==1 }">
										<img width="24px" src="/resources/img/viewstatus_off.png">
									</c:if>	
									<c:if test="${m.viewstatus==2 }">
										공개 신청중
									</c:if>	
									<c:if test="${m.viewstatus==3 }">
										비공개 신청중
									</c:if>	
								</span>
							</td>
							<td>
								<c:if test="${m.status==1 }">
									<button class="agree-btn" type="button" onclick="location.href='/companyDetailView.do?prdNo=${m.makeupNo }&code=${m.code }'">상세 보기</button>
								</c:if>	
									<c:if test="${m.status==2 }">
									<button onclick="cancel()">허가취소</button>
								</c:if>	
								<c:if test="${m.status==0 }">
									<button onclick="wait()">대기중</button>
								</c:if>	
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty memberAll.hall}">	
					<c:forEach items="${memberAll.hall }" var="h">		
						<tr onclick="location.href='/companyDetailView.do?prdNo=${h.hallNo }&code=${h.code }'">
							<td>웨딩홀</td>
							<td><span>${h.hallName }</span></td>
							<td>
								<span>
								<c:if test="${h.status==1 }">
										허가완료
									</c:if>		
									<c:if test="${h.status==2 }">
										허가취소
									</c:if>	
									<c:if test="${h.status==0 }">
										대기중
									</c:if>					
								</span>
							</td>
							<td>
								<span>
									<c:if test="${h.viewStatus==0 }">
										<img width="24px" src="/resources/img/viewstatus_on.png">
									</c:if>		
									<c:if test="${h.viewStatus==1 }">
										<img width="24px" src="/resources/img/viewstatus_off.png">
									</c:if>	
									<c:if test="${h.viewStatus==2 }">
										공개 신청중
									</c:if>	
									<c:if test="${h.viewStatus==3 }">
										비공개 신청중
									</c:if>	
								</span>
							</td>
							<td>
								<c:if test="${h.status==1 }">
									<button class="agree-btn" type="button" onclick="location.href='/companyDetailView.do?prdNo=${h.hallNo }&code=${s.code }'">상세 보기</button>
								</c:if>	
									<c:if test="${h.status==2 }">
									<button onclick="cancel()">허가취소</button>
								</c:if>	
								<c:if test="${h.status==0 }">
									<button onclick="wait()">대기중</button>
								</c:if>	
							</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>		
				<c:if test="${empty memberAll.studio }">
					<c:if test="${empty memberAll.dress }">
						<c:if test="${empty memberAll.makeup }">
							<c:if test="${empty memberAll.hall }">
								<h1 class="none">등록된 업체가 없습니다.</h1>
								<div class="common-tbl-btn-group">
									<button class="btn-style1 big" onclick="location.href='/goCompanyTerms.do'">업체등록 하러가기</button>
									<!-- <a href="/goCompanyTerms.do">업체등록 하러가기</a> -->
								</div>
							</c:if>	
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>

<script>

function wait(){
	alert("대기중입니다");
}
function cancel(){
	alert("허가거절되었습니다 관리자에게 문의주십시오 000-000-0000")
}

</script>


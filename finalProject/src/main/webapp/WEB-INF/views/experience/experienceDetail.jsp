<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<div><img src = "/resources/upload/${experience.e.experienceFilePath}" style="width:100%;height:600px;"></div>

<%--  Header --%>
<%-- <jsp:include page="/WEB-INF/common/sub.jsp"/> --%>
<%-- wrap --%>
<section id="wrap">
	<div class="area">
	<table class="comm-tbl">
				<tr>
					<th colspan="2"  style="text-align:center; "><span>${experience.e.experienceTitle } 제목맨</span></th>
			
				</tr>
				<tr>
					<th colspan="2" style="text-align:center; ">${ experience.e.experienceContent}</th>
					
				</tr>
				<tr>

				</tr>		    
		    </table>
		    
			<table class="comm-tbl">
				<tr>
					<th style="font-size: 20px;padding: 30px;" colspan="4">댓글창</th>
				</tr>	
				
				<tr>
	   				<th>작성자</th>
	   				<th>내용</th>
	   				<th>작성일</th>
	   				<th>버튼</th>
	   			</tr>
	   		
	   				<c:forEach items="${experience.list}" var="e">
	   				<tr>
			   			<c:if test="${e.experienceCommentLevel == 1}">				  
							<td width="10%">${e.experienceCommentWriter}</td> <!-- 작성자 -->
							 <td width="50%">${e.experienceCommentContent}<br>			 
							 </td><!-- 내용 -->	
							
							<td>
							 ${e.experienceCommentDate}
							 </td>
							 <td>							 				
						 	<c:if test="${ sessionScope.member.memberId== e.experienceCommentWriter}">
							
							<a href="#"  onclick="updateComment('${e.experienceCommentNo}','${e.experienceCommentContent}')" >수정</a>
							
							</c:if>
							<c:if test="${sessionScope.member.memberId=='admin' || sessionScope.member.memberId== e.experienceCommentWriter}">
							
								<a href="CommentDelete.do?experienceCommentNo=${e.experienceCommentNo}&experienceNo=${experience.e.experienceNo}">삭제하기</a>
							
							</c:if>	
							
								<a href=# onclick="exCommentReg('${e.experienceCommentNo}','${experience.e.experienceNo}')">댓글달기</a>
							
							</td>        			             									   		
				   		</c:if>
					   			
						<c:forEach items="${experience.list}" var="k">
					   		<c:if test="${k.experienceCommentLevel == 2 && k.experienceCommentRef ==e.experienceCommentNo  }">					 				  
					 
									<tr> 
											<td>
												  	${e.experienceCommentWriter}
										 	</td> 
										   	<td colspan="2" >
													${e.experienceCommentContent}		 																					             						
											</td >
											<td>
											<a href="#"  onclick="updateComment('${e.experienceCommentNo}','${e.experienceCommentContent}')" >수정</a>
											<a href="/CommentDelete.do?experienceCommentNo=${e.experienceCommentNo}&experienceNo=${experience.e.experienceNo}">삭제하기</a>
											</td>
									 </tr>
					   	</c:if>
										   			 
						 </c:forEach>
				   	</tr>
		   			</c:forEach>
		   	
		   
		   			
		   		
		   					   						   														
				<tr>
				<td colspan="4">
					<form action="/experienceCommentInsert.do" method="post">
						<input type="hidden" name="experienceCommentWriter" value="${sessionScope.member.memberId }"> 
						<input type="hidden" name="experienceCommentRef" value="${experience.e.experienceNo}"> 
						<input type="hidden" name="experienceCommentLevel" value="1"> 
 						<input type="hidden" name="experienceCommentCommentRef" value="0"> 				
					<div class="common-tbl-btn-group right" style="marmargin-bottom: 20px;padding-top:0;margin-top: 20px; text-align: left;">
						<textarea rows="1" class="form-control" name="experienceCommentContent" style="width: 88%"></textarea>
		
						<button type="submit" class="btn-style1 small">댓글등록하기</button>	
					</div>																					
					</form>
				</td>	
			</tr>			
		</table>
	</div>
</section>

<script type="text/javascript">
function exCommentReg(a,b) {
	console.log(a)
	window.name = "exCommentReg"
	window.open("/exCommentReg.do?experienceCommentNo="+a+"&experienceCommentRef="+b,
				"","width=600,height=150,location=0,left=550, top=300,status=no,toolbar=no,scrollbars=no,resizable=No"			
	)
}


function updateComment(a,b) {
	console.log(a)
	console.log(b)	
	
	window.name = "updatecommnets";
	window.open("/UpdateComments.do?experienceCommentNo="+a+"&experienceCommentContent="+b,
				"","width=600,height=150,location=0,left=550, top=300,status=no,toolbar=no,scrollbars=no,resizable=No"	
				)
				
	
}


</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

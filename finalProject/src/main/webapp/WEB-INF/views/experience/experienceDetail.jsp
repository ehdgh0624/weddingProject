<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>


<%--  Header --%>
<%-- <jsp:include page="/WEB-INF/common/sub.jsp"/> --%>
<%-- wrap --%>
<style>
.comm-tbl th, .comm-tbl td {
    border: 1px solid #ddd;
    padding: 15px;
    text-align: left;
    font-weight: normal;
    line-height: 20px;
}
.common-tbl-btn-group {
    padding-top: 0px; 
    text-align: center;
}
.common-tbl-btn-group > button{margin:0 3px;}
</style>

<section id="wrap">
	<div class="area">
	<c:if test="${ sessionScope.member.memberId== experience.e.experienceWriter}">
		<div class="common-tbl-btn-group right" style="margin-bottom: 10px;">
			<button  class="btn-style1 small" onclick="updateEx('${experience.e.experienceNo}')">수정</button>
			<button  class="btn-style3 small" onclick="deleteEx('${experience.e.experienceNo}')">삭제</button>
		</div>	
	</c:if>
	<div><img src = "/resources/upload/${experience.e.experienceFilePath}" style="width:100%;height:600px;"></div>
			<table class="comm-tbl" style="margin-bottom:30px;">
				<colgroup>
					<col width="8%">
					<col width="/">
					<col>
					<col width="10%">
				</colgroup>
				<tr>
					<th style="text-align:center; ">
						글제목
					</th>
					<td>
						${experience.e.experienceTitle }
					</td>
				</tr>
				<tr>
					<th  style="text-align:center; ">
						작성자
					</th>
					<td>
						${experience.e.experienceWriter }
					</td>		
				</tr>
				<tr>
					<th  style="text-align:center; width: 10px; ">
					</th>
					<td>
						${experience.e.experienceContent }
					</td>
				</tr>		    
		    </table>
			<table class="comm-tbl">
				<colgroup>
					<col width="10%">
					<col width="70%">
					<col width="/">
				</colgroup>
				<tr>
					<th style="font-size: 20px;padding: 30px;" colspan="3">
						댓글창
					</th>
				</tr>	
				<tr>
	   				<th style="text-align: center;">
	   					작성자
	   				</th>
	   				<th style="text-align: center;">
	   					내용
	   				</th>
	   				<th style="text-align: center;">
	   					작성일
	   				</th>
	   			</tr>
	   		<c:forEach items="${experience.list}" var="e">
	   			<tr>
		   			<c:if test="${e.experienceCommentLevel == 1}">				  
						<td>
							${e.experienceCommentWriter}
						</td> <!-- 작성자 -->
						<td>			
							<p style="display:block " id="level1ContentP" class="level1ContentP">
								${e.experienceCommentContent}
							</p><!-- 내용 -->						
							<div class="common-tbl-btn-group">
								<form action="/UpdateComment.do">
									<input id="level1ContentInput" name="level1ContentInput" class="level1ContentInput" type="text" value="${e.experienceCommentContent}" style="display:none; width: 688px; ">
									<input type="submit"  style= "cursor:pointer; font-size: 15px; color:white;   border-radius: 5px; display: none; height:38px; width: 100px; background-image: linear-gradient(-20deg, #ddd6f3 0%, #faaca8 100%, #faaca8 100%); 	border: 0;  outline :0;" class="btn-style2 small abs" value="완료"  >
									<input type="hidden" name="experienceCommentNo" id="experienceCommentNo" value="${e.experienceCommentNo}">
									<input type="hidden"  name="experienceNo" id="experienceNo"  value="${experience.e.experienceNo}">
								</form>
							</div>
						</td>						     			             									   		
						<td style="text-align:center;">
							<span>
								${e.experienceCommentDate}
							</span>
							<p class="common-tbl-btn-group" style="padding-top:5px;">
								<c:if test="${ sessionScope.member.memberId== e.experienceCommentWriter}">
									<button id="level1updateComment" id="level1ch"  style="display:inline; width: 50px;" class="btn-style2 small" onclick="updateComment(this)" >수정</button>																																													
								</c:if>
								<c:if test="${sessionScope.member.memberId=='admin' || sessionScope.member.memberId== e.experienceCommentWriter}">
									<button style="width: 50px;" class="btn-style3 small" onclick="CommentDelete(${e.experienceCommentNo});">삭제</button>
									<script type="text/javascript">
										function CommentDelete(a) {
											location.href="CommentDelete.do?experienceCommentNo="+a+"&experienceNo="+${experience.e.experienceNo};											
										}
									</script>									
								</c:if>	
								<c:if test="${  not empty sessionScope.member.memberId}">
									<button style="width: 80px; display: inline-block;" class="btn-style1 small" onclick="exCommentReg(this);" >댓글달기</button>
								</c:if>
							</p>	
						</td>	
						<tr style="display: none;">
							<td colspan="3">
								<form action="/exCommentRegs.do" >
									<input type="hidden" id="experienceCommentWriter" name="experienceCommentWriter" value="${sessionScope.member.memberId}">
									<input type="hidden" id="experienceCommentNo" name="experienceCommentNo" value="${e.experienceCommentNo}">
									<input type="hidden" id="experienceCommentLevel"  name="experienceCommentLevel" value="2">
									<input type="hidden" id="experienceCommentRef" name="experienceCommentRef" value="${e.experienceCommentRef }">
									<input type="text"   id="experienceCommentContent" name="experienceCommentContent" style=" width: 89%;" >
									<input type="submit" id="level1submit" style= "cursor:pointer; font-size: 15px; color:white;   border-radius: 5px; height:38px; width: 100px; background-image: linear-gradient(-20deg, #ddd6f3 0%, #faaca8 100%, #faaca8 100%); 	border: 0;  outline :0;" class="btn-style2 small  abs" value="완료"  >
									<input type="hidden"  name="experienceNo" id="experienceNo"  value="${experience.e.experienceNo}">										
								</form>												
							</td>
						</tr>																												
			   		</c:if>			   		
				  </tr> <!-- ddddddddddddddddddddddd -->
					<c:forEach items="${experience.list}" var="k">
				   		<c:if test="${k.experienceCommentLevel == 2 && k.experienceCommentRef == e.experienceCommentNo}">		
							<tr> 
								<td colspan="2"> <!--  내용 -->
								   ㄴ ${k.experienceCommentWriter} :		
									${k.experienceCommentContent}
									 							 										   	
									<form action="/UpdateComment2.do">		
										<input id="level1ContentInput" name="level1ContentInput" class="level1ContentInput" type="text" value="${k.experienceCommentContent}" style="display: none;     width: 87%;">
										<input type="submit" id="level1submit"  style= "cursor:pointer; font-size: 15px; color:white;  border-radius: 5px; display: none; height:38px; width: 100px; background-image: linear-gradient(-20deg, #ddd6f3 0%, #faaca8 100%, #faaca8 100%); 	border: 0;  outline :0;" class="btn-style2 small abs" value="완료"  >
										<input type="hidden" name="experienceCommentNo" id="experienceCommentNo" value="${k.experienceCommentNo}">
										<input type="hidden" name="experienceNo" id="experienceNo"  value="${experience.e.experienceNo}">																			             						
									</form>
								</td>
								<td style="text-align: center;">
									<span>
										${k.experienceCommentDate}
									</span>
								<p class="common-tbl-btn-group" style="padding-top:5px;">
									<c:if test="${ sessionScope.member.memberId== k.experienceCommentWriter}">
										<button style="width: 50px;" class="btn-style1 small" onclick="updateComment2(this)" >수정</button>												
									</c:if>
									<c:if test="${sessionScope.member.memberId=='admin' || sessionScope.member.memberId== k.experienceCommentWriter}">
										<button style="width: 50px;" onclick="ccommentDelete(${k.experienceCommentNo});" class="btn-style2 small">삭제</button>
									<script type="text/javascript">
										function ccommentDelete(b) {
											location.href="/CommentDelete.do?experienceCommentNo="+b+"&experienceNo="+${experience.e.experienceNo};
											
										}
									</script>
									</c:if>	
								</p>
							</td>
						</tr>
					</c:if>	   			 
				</c:forEach>	<!--  레벨222222222222 -->				  
		   	</c:forEach>		   						   														
		<c:if test="${  not empty sessionScope.member.memberId}">
			<tr>
				<td colspan="4">
					<form action="/experienceCommentInsert.do" method="post">
						<input type="hidden" name="experienceCommentWriter" value="${sessionScope.member.memberId }"> 
						<input type="hidden" name="experienceCommentRef" value="${experience.e.experienceNo}"> 
						<input type="hidden" name="experienceCommentLevel" value="1"> 
 						<input type="hidden" name="experienceCommentCommentRef" value="0"> 				
						<div class="common-tbl-btn-group right" style="padding-top:0;text-align: left;">
							<input type="text"  rows="1" class="form-control" name="experienceCommentContent" style="width: 88%"></textarea>
							<button  id="sub" type="submit" class="btn-style1 small">댓글등록하기</button>
							
							
						</div>																					
					</form>
				</td>	
			</tr>			
		</c:if>
		</table>
	</div>
</section>



<script type="text/javascript">
	
	
	function deleteEx(experienceNo) {
		
		location.href="/exDelete.do?experienceNo="+experienceNo;
		
	}
	
	function updateEx(experienceNo) {
		
		location.href="/exChg.do?experienceNo="+experienceNo;
		
	}
	
	
	
	$(".abs").each(function(){
		$(this).click(function(e){
			if($(this).prev().val() ==""){
				alert("댓글이 비어있습니다.");
				e.preventDefault();
			}else{
			
			}
		});
	});

function exCommentReg(but) {
			$(but).hide();
			$(but).parent().parent().parent().next().show();
}
	
	function updateComment(but) {
		$(but).parent().parent().prev().children().children().children().eq(0).show();
		$(but).parent().parent().prev().children().children().children().eq(1).show();
		$(but).hide();
		$(but).parent().parent().prev().children().eq(0).hide();
	}

	function updateComment2(but2) {
		$(but2).parent().parent().prev().children('span').hide();
	
		$(but2).parent().parent().prev().children('form').find('input').show();
		$(but2).hide();
		
		 
	}

</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

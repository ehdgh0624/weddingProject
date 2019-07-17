<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script>
	<section id="wrap">
			<div class="area">
				<form action="/noticeUpDate.do" method="post">
					<table class="comm-tbl">
						<tr>
							<th>제목</th>
								<td><input type="text"  id="noticeTitle" name="noticeTitle" value="${n.noticeTitle}"></td>
							</tr>
						<tr>
								<td colspan="2"><textarea name="editor"  id="editor" cols="80" >${n.noticeContent}</textarea></td>
						</tr>
													
							
					</table>
					
								<input type="hidden" id ="noticeWriter" value="${sessionScope.member.memberId }" name="noticeWriter">	
						    	<input type="hidden" id="noticeNo" value="${n.noticeNo}" name="noticeNo">							 
						    	<div class="common-tbl-btn-group right" style="marmargin-bottom: 20px;padding-top:0;margin-top: 20px;">
						    		<button type="submit" class="btn-style1">수정하기</button>
						    	</div>
				</form>	
			</div>
	</section>

<script>



	
	
	CKEDITOR.config.height = 500;
	CKEDITOR.config.toolbarCanCollapse = true;
	CKEDITOR.replace('editor' , {                
	filebrowserImageUploadUrl: '/experienceUpload.do'                   
	});
	 CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;
	
	        switch (dialogName) {
	            case 'image': 
	            	//Image Properties dialog
	                //dialogDefinition.removeContents('info');
	                dialogDefinition.removeContents('Link');
	                dialogDefinition.removeContents('advanced');
	                break;
	        }                                                         
	    });                        
	
</script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
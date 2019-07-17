<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<div><img src = "/resources/upload/${ex.experienceFilePath}" style="width:100%;height:600px;"></div>

<%--  Header --%>
<%-- <jsp:include page="/WEB-INF/common/sub.jsp"/> --%>
<%-- wrap --%>
<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script>
	<section id="wrap">
			<div class="area">
				<form action="/upDateloadTest.do" method="post" enctype="multipart/form-data">
					<table class="comm-tbl">
						<tr>
						<th>제목</th>
							<td><input type="text"  id="experienceTitle" name="experienceTitle" value="${ex.experienceTitle}"></td>
						</tr>
					<tr>
						<th>대표사진 등록</th>
						<td>
							<input type="file" name="experiencefile" id="imgInp" style="display:none;" >
					
							<label for="imgInp">
								<img id="img" name="img"  src="resources/upload/${ex.experienceFilePath}" width="100px" height="100px">
								<button type="button" id="fileDelBtn">삭제</button>
							</label>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="editor"  id="editor" cols="80" >${ex.experienceContent}</textarea></td>
					</tr>		
					</table>
					<div class="common-tbl-btn-group">
			    	<button type="submit" class="btn-style1">수정하기</button>
			    	<input type="hidden" id="experienceFilePath" value="${ex.experienceFilePath }" name="experienceFilePath">
			    	 <input type="hidden" id ="experienceWriter" value="${sessionScope.member.memberId }" name="experienceWriter">	
			    	 <input type="hidden" id="experienceNo" value="${ex.experienceNo}" name="experienceNo">	
			    	 <input type="hidden" name="oldFilename" value="${ex.experienceFileName }">	    
			    	 <input type="hidden" name="oldFilepath" value="${ex.experienceFilePath }">	
			    	 <input type="hidden" id="status" name="status" value="stay">	 			    	 
			    	</div>
			    </form>	
			</div>
	</section>

<script>
$(document).ready(function(){
	$('#fileDelBtn').click(function(){
		if(confirm("첨부파일을 삭제하시겠습니까?")){
			$("#fileDelBtn").hide();
			$('#imgInp').show();
			$("#status").val('delete');
			$("#img").attr('src','');
		};
	});			
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            $('#img').attr('src', e.target.result);
         
        }
        reader.readAsDataURL(input.files[0]);
    }
}
	$("#imgInp").change(function() {
    readURL(this);
		});   


	
	
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
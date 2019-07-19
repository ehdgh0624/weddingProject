<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script>
<section id="wrap">
	<div class="area">
		<form action="/noticeWriting2.do" method="post" enctype="multipart/form-data">
			<table class="comm-tbl" style="margin-top: 30px;">
				<tr>
					<th>제목</th>
					<td><input type="text"  id="noticeTitle" name="noticeTitle" required></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text"  id="noticeTitle" name="noticeWriter" value="${sessionScope.member.memberId }" required readonly></td>
				</tr>
				
				<tr>
					<td colspan="2"><textarea name="editor"  id="editor" cols="80" required></textarea></td>
				</tr>		    
		    </table>
		    <div class="common-tbl-btn-group">
		    	<button type="submit" class="btn-style1">등록하기</button>
		    </div>
		</form>
	</div>
</section>
<script>     
            CKEDITOR.config.height = 500;
            CKEDITOR.config.toolbarCanCollapse = true;
            CKEDITOR.replace('editor' , {                
            filebrowserImageUploadUrl: '/noticeUpload.do'                   
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
        <style>
        
</style>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
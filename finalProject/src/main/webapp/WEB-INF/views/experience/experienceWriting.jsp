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
	<div class="area" style="padding-top:30px;">
		<form action="/uploadTest.do" method="post" enctype="multipart/form-data">
			<table class="comm-tbl">
				<tr>
					<th>제목</th>
					<td><input type="text"  id="experienceTitle" name="experienceTitle"></td>
				</tr>
				<tr>
					<th>대표사진 등록</th>
					<td>
						<label for="imgInp">
							<img id="img" name="img" src="/resources/img/noimg.jpg" width="100px" height="100px">
						</label>
						<input type="file" name="experiencefile"id="imgInp" class="middle" >
					</td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="editor"  id="editor" cols="80"></textarea></td>
				</tr>		    
		    </table>
		    <div class="common-tbl-btn-group">
		    	<button type="submit" class="btn-style1" id="suv">등록하기</button>
		    </div>
		    
		    <input type="hidden" id ="experienceWriter" value="${sessionScope.member.memberId }" name="experienceWriter">
		</form>
	</div>
</section>
<script>
	
	
		$('#suv').click(function(kdc){
		
			if($('#experienceTitle').val() ==""){
					alert("제목이 비어있습니다.");
					$('#experienceTitle').focus();
					kdc.preventDefault();
					}
			else if($('#imgInp').val()==""){
				alert("사진이비어있습니다.")
				$('#imgInp').focus();
				kdc.preventDefault();
			}
			/* else if($("#cke_editor").chiledren('p').html() == ""){
				alert("내용을 입력해주세요.")
				$('#editor').focus();
				kdc.preventDefault();
			} */
			});

		function chk_file_type(obj) {
	         var file_kind = obj.value.lastIndexOf('.');
	         var file_name = obj.value.substring(file_kind + 1, obj.length);
	         var file_type = file_name.toLowerCase();

	         var check = new Array();
	         check = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp', 'jfif' ];

	         if (check.indexOf(file_type) == -1) {
	            alert("등록 할 수 없는 파일명 입니다.");
	            $(obj).val("");
	            return false;
	         } else {
	            return true;
	         }
	      }
    function readURL(input) {
        if (input.files && input.files[0] && chk_file_type(input)) {
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
        <style>
        
</style>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
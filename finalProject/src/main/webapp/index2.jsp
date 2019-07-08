<%@page import="java.util.ArrayList"%>
<%@page import=" java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String url = null;
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>
<title>Insert title here</title>
</head>
<body>
	테스트트으으으으
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script>


	<form action="/test.do" method="post">
	<textarea name="editor"  id="editor" cols="80"></textarea>
	<input type="hidden" name="oldFilename" id="oldFilename">
	<input type="submit" value="등록하기"> 
	</form>	
	<button id="nono">삭제하기</button>
	<button id="kkk">테스트2</button>
	<input type="hidden" id="ttest" value="test">
	<button id="fileName">테스트</button>
	
	
				<!-- filebrowserUploadUrl : '/upload.do', -->
			
			
				
				<!-- CKEDITOR.instances.editor.document.getBody()
				 -->
		<script type="text/javascript">
		
			CKEDITOR.config.height = 500;
			CKEDITOR.config.toolbarCanCollapse = true;
			CKEDITOR.replace('editor' , {
				
		    filebrowserImageUploadUrl: '/upload.do'
		    
		
			});
			 CKEDITOR.on('dialogDefinition', function( ev ){
		            var dialogName = ev.data.name;
		            var dialogDefinition = ev.data.definition;
		 
		            switch (dialogName) {
		                case 'image': //Image Properties dialog
		                    //dialogDefinition.removeContents('info');
		                    dialogDefinition.removeContents('Link');
		                    dialogDefinition.removeContents('advanced');
		                    break;
		            }		            		         		            
		        });
			 
			 
		</script>
		<script>
	/* 	  CKEDITOR.instances['editor'].on('contentDom', function() {
		    this.document.on('click', function(event){
		         alert('동천실험');
				
				console.log(this.getDocumentElement("img"));
		     });
		});   */
		
	/* 	$("#kkk").click(function(){
		 elements = CKEDITOR.document.getById( 'cke_1_contents' ).getChild(1).getHtml();
		 asd = CKEDITOR.dialog.definition
	
		/* elements = CKEDITOR.document.getElementsByTag('html'); */
	
		
	
	
		 
		</script>		
		<script>
	
		    arr = new Array();
					
			var test1 = "";
		 /* 	$(document).on('mouseleave', 'img[src]', function(){					
				
				$("#ttest").val($(this).attr('src'));				
			}) ; */
			$("#fileName").click(function(){
	
				var element = new CKEDITOR.dom.element('img');
				console.log(CKEDITOR.instances.editor.getData());
				
				
				alert("dd");
				
				
			});
			
			$(document).on("click",'a[title="확인"]',function(){
				alert($("input[aria-required]").val());	
				
				arr.push($("input[aria-required]").val());
				console.log(arr);
			});	
			
			$("#nono").click(function(){
			
				$.ajax({
					url:"/delete.do",
					type:"post",
					traditional:true,
					data:{'arr':arr},
					success:function(data){						
						console.log(data);
					}
					
				});
				
			});
		/* 	window.onbeforeunload = function() {				
				$.ajax({
					url:"/delete.do",
					type:"post",
					traditional:true,
					data:{'arr':arr},
					success:function(data){
						console.log(data);
					}					
				});	
				return 
			}
		
			 */
			
			
		</script>
		<!-- 값추출 -->
		<a href="/testView.do">값추출</a>
			
		<!-- 공지사항 -->
		<a href="/noticeAllList.do">전체게시판리스트</a><br>	
</body>
</html>
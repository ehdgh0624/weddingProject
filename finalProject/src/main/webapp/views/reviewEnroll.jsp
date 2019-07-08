<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js"></script> <!-- ck 에디터 스크립트 .js  -->
<title>Insert title here</title>
</head>
<body>


<form action="/test.do" method="post">
	<textarea name="editor"  id="editor" cols="80"></textarea>
	<input type="hidden" name="oldFilename" id="oldFilename">
	<input type="submit" value="등록하기"> 
	</form>	

	
				<!-- filebrowserUploadUrl : '/upload.do', -->
			
			
				
				<!-- CKEDITOR.instances.editor.document.getBody()
				 -->
				 
		<script type="text/javascript"> //ck 에디터  크기랑 에디터에 이미지 upload.do로 하겟다 그리고 switch 쪽은 링크나 그런거 추가하거나 삭제하거나
		
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
			
			$(document).on("click",'a[title="확인"]',function(){
				alert($("input[aria-required]").val());	
				
				arr.push($("input[aria-required]").val());
				console.log(arr);
			});	
			
/* 			$("#fileName").click(function(){
	
				var element = new CKEDITOR.dom.element('img');
				console.log(CKEDITOR.instances.editor.getData());
				
				
				alert("dd");
				
				
			}); */
			
			/* 
			$("#nono").click(function(){ //delete.do 는 임시 파일 만들고 하루마다 갱신하니까 의미가 사라졌다. 
			
				$.ajax({
					url:"/delete.do",
					type:"post",
					traditional:true,
					data:{'arr':arr},
					success:function(data){						
						console.log(data);
					}
					
				});
				
			}); */
			
			
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
</body>
</html>
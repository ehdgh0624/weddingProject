<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<%--  ColorPicker --%>
<script src='/resources/js/colorPicker/jquery.minicolors.js'></script>
<link rel='stylesheet' href='/resources/css/colorPicker/jquery.minicolors.css' />
<style>
	.text-fontSize-10{font-size: 10px;}
	.text-fontSize-12{font-size: 12px;}
	.text-fontSize-14{font-size: 14px;}
	.text-fontSize-16{font-size: 16px;}
	.text-fontSize-18{font-size: 18px;}
	.text-fontSize-20{font-size: 20px;}
	.text-fontSize-22{font-size: 22px;}
	.text-fontSize-24{font-size: 24px;}
	.text-fontSize-26{font-size: 26px;}
	.text-fontSize-28{font-size: 28px;}
	.text-fontSize-30{font-size: 30px;}
	.justify-align{text-align: justify;}
	.left-align{text-align: left;}
	.center-align{text-align: center;}
	.right-align{text-align: right;}
	.text-bold{font-weight: bolder;}
	.text-underLine{text-decoration: underline;}
	.text-italic{font-style: italic;}
	.text-cancelList{text-decoration: line-through;}
	
	#editor-content{
		text-align: center;
	}
	#editor-textBox{
		width:800px;
		height:450px;
		resize:vertical;
		font-size: 10px;
		padding:20px;
		margin:0;
	}
</style>

<script>
	$(document).ready(function(){
 		$('.demo').minicolors();
	});
</script>
<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<div id="editor-decorationBox">
			<button type="button" id="justify-align">양쪽정렬</button>
			<button type="button" id="left-align">왼쪽정렬</button>
			<button type="button" id="center-align">가운데정렬</button>
			<button type="button" id="right-align">오른쪽정렬</button>
			<button type="button" id="image-upload">이미지</button>
			<button type="button" id="video-upload">동영상</button>
			<button type="button" id="text-bold">굵게</button>
			<button type="button" id="text-underLine">밑줄</button>
			<button type="button" id="text-italic">기울임</button>
			<button type="button" id="text-cancelLine">취소선</button>
			<button type="button" id="text-color">글씨색</button>
            <input type="hidden" id="hidden-input-text" class="demo" value="#000000" onchange="textColorChange();">
			<button type="button" id="text-backgroundColor">글씨바탕색</button>
            <input type="hidden" id="hidden-input-background" class="demo" value="#000000" onchange="textBackgroundColorChange();">
			<select id="text-fontFamily">
				<option value="default">글꼴</option>
				<option style="font-family: 궁서체" value="궁서체">궁서체</option>
				<option style="font-family: 돋움체" value="돋움체">돋움체</option>
				<option style="font-family: 바탕체" value="바탕체">바탕체</option>
				<option style="font-family: 굴림체" value="굴림체">굴림체</option>
			</select>
			<select id="text-fontSize">
				<option value="default">크기</option>
				<option value="10">10</option>
				<option value="12">12</option>
				<option value="14">14</option>
				<option value="16">16</option>
				<option value="18">18</option>
				<option value="20">20</option>
				<option value="22">22</option>
				<option value="24">24</option>
				<option value="26">26</option>
				<option value="28">28</option>
				<option value="30">30</option>
			</select>
		</div>
		<div id="editor-content">
			<div id="editor-textBox" contenteditable="true" style="background-color: pink;overflow: auto;"></div>			
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			$('#editor-textBox').mouseup(function(){
				dragText();
			});
			
		});
		
		function dragText(){
			var txt = '';
			if(window.getSelection){
				txt = window.getSelection();
			} else if (document.getSelection) {
			    txt = document.getSelection();
			} else if (document.selection) {
				txt = document.selection.createRange().text;
			} else {
				return;
			}
			txt = String(txt);
		}
	
		/* 글씨색 변경 시 수행되는 함수 */
		function textColorChange(){
	        var sp = document.createElement('span');		/* span 태그 생성 */
	        sp.style.color=$('#hidden-input-text').val();	/* 생성한 태그에 color 부여 */
	 
	        var highlight = window.getSelection();			/* 드래그한 요소 변수에 저장 */
	        if(highlight) {									/* 드래그한 요소가 있을 경우 */
	            if(highlight.rangeCount) {					/* 드래그한 요소에 텍스트와 숫자가 있으면 */
	                var range = highlight.getRangeAt(0).cloneRange();		/* 드래그한 요소를 복사함 */
	                range.surroundContents(sp);
	                highlight.removeAllRanges();
	                highlight.addRange(range);
	            }
	        }
	        
	        
	        
/* 	        if(window.getSelection){
				$(document.getSelection()).wrap('<span style="color:'+$('#hidden-input-text').val()+'"></span>');
			} */
/* 			$('#editor-textBox').html('<span style="color:'+$('#hidden-input-text').val()+'">'+$('#hidden-input-text').val()+'</span>'); */
		}
		/* 글씨배경색 변경 시 수행되는 함수 */
		function textBackgroundColorChange(){
/* 			$('#editor-textBox').html('<span style="background-color:'+$('#hidden-input-background').val()+'">'+$('#hidden-input-background').val()+'</span>'); */

		}
	</script>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
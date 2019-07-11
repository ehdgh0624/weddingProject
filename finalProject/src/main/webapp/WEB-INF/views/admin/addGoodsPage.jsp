<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>

	<div id="myPageContainer" class="clearfix area">
		<h1>상품등록</h1>
		<br>
			<form action="/addGoods.do" method="post" enctype="multipart/form-data">
				<table class=comm-tbl>
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>상품타입</th>
						<td>
							<select name="goodsType" class="middle">
								<option value="">선택</option>
	 							<option value="B">부케</option>
	 							<option value="I">청첩장</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품이름</th>
						<td><input type="text" name="goodsName"class="short"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input type="text" name="goodsPrice" class="num short"> 원</td>
					</tr>
					<tr>
						<th>태그</th>
						<td><input type="text" name="goodsTag" class="middle" placeholder="#태그를 입력해 주세요"> <span style="color:gray"> ex) #웨딩 #결혼식 #웨딩부케 #웨딩청첩장</span></td>
					</tr>
					<tr>
						<th>상품내용</th>
						<td><textarea rows="5" cols="10" name="goodsContent" style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<th>상품사진</th>
						<td>
							<input type="file" name="img" onchange="loadImg(this)" class="short"> 
							<div id="img-viewer" style="width: 80%;">
								<img id="img-view" style="max-width:100%;">
							</div>
						</td>
					</tr>
				</table>
				<input type="submit" value="등록" class="delete-btn">
			</form>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>
	<script>
		function loadImg(f){
			if(f.files.length !=0 && f.files[0] !=0){
				//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
				//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
				reader.onload=function(e){ //다 읽어 왔으면 실행
					$("#img-view").attr('src', e.target.result);
				}
			}else{
				$("#img-view").attr('src','');
			}
		}
	</script>


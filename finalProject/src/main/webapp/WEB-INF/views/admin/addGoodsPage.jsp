<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp" />

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo">
			<a href="/"><img src="/resources/img/logo.png"
				style="max-width: 50px"></a>
		</h1>
	</div>

	<div id="myPageContainer" class="clearfix area">
		<h1>상품등록</h1>
		<br>
		<form action="/addGoods.do" method="post"
			enctype="multipart/form-data">
			<table class=comm-tbl>
				<colgroup>
					<col width="20%">
					<col width="/">
				</colgroup>
				<tr>
					<th>상품타입</th>
					<td><select name="goodsType" class="middle" id="gType">
							<option value="">선택</option>
							<option value="B">부케</option>
							<option value="I">청첩장</option>
					</select></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="goodsName" class="short" id="gName"></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input type="text" name="goodsPrice" class="num short" id="gPrice">
						원</td>
				</tr>
				<tr>
					<th>태그</th>
					<td><input type="text" name="goodsTag" class="middle"
						placeholder="#태그를 입력해 주세요" id="tag"> <span
						style="color: gray"> ex) #웨딩 #결혼식 #웨딩부케 #웨딩청첩장</span></td>
				</tr>
				<tr>
					<th>상품내용</th>
					<td><textarea rows="5" cols="10" name="goodsContent" id="gContent"
							style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<th>상품사진</th>
					<td><input type="file" name="img" onchange="loadImg(this)" id="file" class="short">
						<div id="img-viewer" style="width: 80%;">
							<img id="img-view" style="max-width: 100%;">
						</div></td>
				</tr>
			</table>
			<div class="common-tbl-btn-group " style="margin-bottom: 20px;">
				<button class="btn-style1" type="submit" id="sub">등록</button>
			</div>
		</form>
	</div>

	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>
<script>
	function loadImg(f) {
		if (f.files.length != 0 && f.files[0] != 0 && chk_file_type(f)) {
			//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
			//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
			var reader = new FileReader();
			reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
			reader.onload = function(e) { //다 읽어 왔으면 실행
				$("#img-view").attr('src', e.target.result);
			}
		} else {
			$("#img-view").attr('src', '');
		}
	}

	$("#tag").focus(function() {
		if ($("#tag").val() == "") {
			$("#tag").val("#");
		}

	});
	$("#tag").keyup(function(e) {
		if (e.keyCode == '32') {
			$("#tag").val($("#tag").val() + ",#");
		}
	});
	//스크립트 정의

	function chk_file_type(obj) {
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind + 1, obj.length);
		var file_type = file_name.toLowerCase();

		var check = new Array();
		check = [ 'jpg', 'gif', 'png', 'jpeg', 'bmp', 'jfif' ];

		if (check.indexOf(file_type) == -1) {
			alert("등록 할 수 없는 파일명 입니다.");
			$("#file").val("");
			return false;
		} else {
			return true;
		}
	}
	$("#sub").click(function(e){
		if($("#gType").val() == ""){
			alert("타입을 선택해주세요");
			$("#gType").focus();
			e.preventDefault();
		}else if($("#gName").val() == ""){
			alert("상품이름을 입력해주세요");
			$("#gName").focus();
			e.preventDefault();
		}else if($("#gPrice").val() == ""){
			alert("상품가격을 입력해주세요");
			$("#gPrice").focus();
			e.preventDefault();
		}else if($("#tag").val() == ""){
			alert("태그를 입력해주세요");
			$("#tag").focus();
			e.preventDefault();
		}else if($("#gContent").val() == ""){
			alert("상품내용을 입력해주세요");
			$("#gContent").focus();
			e.preventDefault();
		}else if($("#file").val()== ""){
			alert("대표사진을 넣어주세요");
			$("#file").focus();
			e.preventDefault();
		}
	});
</script>


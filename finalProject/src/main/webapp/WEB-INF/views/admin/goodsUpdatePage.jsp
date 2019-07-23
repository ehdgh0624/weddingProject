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
		<h1>상품수정 </h1>
		<br>
		<form action="/goodsUpdate.do" method="post"
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
							<c:if test="${g.goodsType eq 'B' }">
								<option value="B" selected>부케</option>
								<option value="I">청첩장</option>
							</c:if>
							<c:if test="${g.goodsType eq 'I' }">
								<option value="B">부케</option>
								<option value="I" selected>청첩장</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="goodsName" class="short"
						value="${g.goodsName }" id="gName"></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input type="text" name="goodsPrice" class="num short"
						value="${g.goodsPrice}" id="gPrice"> 원</td>
				</tr>
				<tr>
					<th>태그</th>
					<td><input type="text" name="goodsTag" class="middle"
						placeholder="#태그를 입력해 주세요" id="tag" value="${g.goodsTag }">
						<span style="color: gray"> ex) #웨딩 #결혼식 #웨딩부케 #웨딩청첩장</span></td>
				</tr>
				<tr>
					<th>상품내용</th>
					<td><textarea rows="5" cols="10" name="goodsContent"
							style="resize: none;" id="gContent">${g.goodsContent }</textarea></td>
				</tr>
				<tr>
					<th>숨김설정</th>
					<td><select name="viewstatus" class="middle" id="view">
							<option value="">선택</option>
							<c:if test="${g.viewstatus == 0 }">
								<option value="0" selected>보임설정</option>
								<option value="1">안보임설정</option>
							</c:if>
							<c:if test="${g.viewstatus == 1 }">
								<option value="0">보임설정</option>
								<option value="1" selected>안보임 설정</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<th>상품사진</th>
					<td><input type="file" name="img" onchange="loadImg(this)"
						class="short" id="file" style="display: none;"> <input
						type="hidden" name="goodsNo" class="short" value="${g.goodsNo}">
						<input type="hidden" name="oldFilename" class="short"
						value="${g.goodsFileName }"> <input type="hidden"
						name="oldFilepath" class="short" value="${g.goodsFilePath }">
						<div id="img-viewer" style="width: 80%;">
							<label for="file"><img id="img-view"
								style="max-width: 100%;"
								src="/resources/goods/${g.goodsFilePath }"></label>
						</div></td>
				</tr>
			</table>
			<div class="common-tbl-btn-group " style="margin-bottom: 20px;">
				<button class="btn-style1" type="submit" id="sub">등록</button>
			</div>
		</form>
	</div>
	<div class="area">
		<!-- <button>추가</button> -->
				<form action="/saveGallery.do" method="post"
					enctype="multipart/form-data">
					<table class="comm-tbl type2" id="gall">
						<colgroup>
							<col width="20%">
							<col width="/">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>No</th>
							<th>파일이미지</th>
							<th>미리보기</th>
							<th>삭제</th>
						</tr>
						<c:if test="${not empty gallery }">
							<c:forEach items="${gallery }" var="s" varStatus="i">
								<tr >
									<td class="re">${i.count }</td>
									<td><span>${s.filename }</span></td>
									<td><img src="/resources/goods/${s.filepath }"
										style="width: 300px; height: 300px"></td>
									<td><input type="hidden" value="${s.filepath }"
										class="oldpath">
									<button onclick='imgDelete(this)' type='button'
											class='imgDelete'>삭제</button></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty gallery }">
							<tr class="list-none">
								<td colspan="4"><p class="none small">사진 내역이 없습니다.</p></td>
							</tr>
						</c:if>
					</table>
					<input type="hidden" value="${g.goodsNo }" name="prdNo">
						<input type="hidden" value="G" name="code">
					<div class="common-tbl-btn-group right">
						<button type="submit" class="btn-style1 small" id="imgSub">저장</button>
					</div>
				</form>
				<br><br>
		<div class="common-tbl-btn-group left" style="padding-top:0;display:inline-block;position:relative;top:-61px;">
				<button type="button" class="btn-style2 small" id="addGallery">사진추가하기</button>
			</div>
	</div>
	<br>
	<br>

	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp" />
</section>
<script>
	var count;
	if($(".type2").children('tbody').children().children().is(".re")){
		 count = parseInt($(".re").last().html());
	}else{
		count = 0;
	}
	
	
	function loadImg(f) {
		chk_file_type(f);
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
	function chk(f) {
		chk_file_type(f);
		if (f.files.length != 0 && f.files[0] != 0 && chk_file_type(f)) {
			//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
			//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
			var reader = new FileReader();
			reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
			reader.onload = function(e) { //다 읽어 왔으면 실행
				$(f).parent().parent().next().children('.img-view').attr('src', e.target.result);
			}
		} else {
			$(f).parent().parent().next().children('.img-view').attr('src', "");
		}
	}

	$("#tag").focus(function() {
		if ($("#tag").val() == "") {
			$("#tag").val("#");
		}

	});
	$("#tag").keyup(function(e) {
		if (e.keyCode == '32') {
			$("#tag").val($("#tag").val() + ", #");
		}
	});
	$('#addGallery')
	.click(
			function() {
				count = count + 1;
				var addTable = "<tr class='imgtr'><td>"+count+"</td><td><label for='filename'><input type='file' onchange='chk(this)' class='filename' name='filename'></label></td>";
				addTable += "<td><img src='' style='width:300px; heigth:300px' class='img-view'></td>";
				addTable += "<td><button onclick='imgDelete(this)' type='button' class='imgDelete'>삭제</button></td>";
				addTable += "<tr>";
				

				if($("#gall").has('.list-none')){
					$('.list-none').remove();
					$('#gall').append(addTable);
				}else{
					$('#gall').append(addTable);
				}
			});
	function imgDelete(tt) {
		if(count<=0){
			count = 0;
		}else{
			count = count - 1;
		}
		var filepath = $(tt).prev().val();
		var code = "${g.goodsType}";
		console.log(filepath);
		$.ajax({
			url : "/deleteGallery.do",

			data : {
				filepath : filepath,
				code : code
			},

			type : "get",
			success : function(data) {
				if (data > 0) {
					alert("수정성공");
					console.log("삭제성공");
				} else {
					console.log("삭제실패");
				}
			},
			error : function() {
				console.log("ajax실패")
			}

		})
		$(tt).parent().parent().remove();
	}

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
	
	$("#sub").click(function(e) {
		if ($("#gType").val() == "") {
			alert("타입을 선택해주세요");
			$("#gType").focus();
			e.preventDefault();
		} else if ($("#gName").val() == "") {
			alert("상품이름을 입력해주세요");
			$("#gName").focus();
			e.preventDefault();
		} else if ($("#gPrice").val() == "") {
			alert("상품가격을 입력해주세요");
			$("#gPrice").focus();
			e.preventDefault();
		} else if ($("#tag").val() == "") {
			alert("태그를 입력해주세요");
			$("#tag").focus();
			e.preventDefault();
		} else if ($("#gContent").val() == "") {
			alert("상품내용을 입력해주세요");
			$("#gContent").focus();
			e.preventDefault();
		}
	});

	$("#imgSub").click(function(e) {
		if ($("#gall").children().find('tr').is(".imgtr")) {
			for (var i = 0; i < count; i++) {
				if ($(".filename").eq(i).val() == "") {
					alert("파일이 비어있습니다.");
					$(".filename").eq(i).focus();
					e.preventDefault();		
					return;
				}
			}
		}else{
			alert("사진을 추가하지 않았습니다.")
			e.preventDefault();
		}
	});
</script>


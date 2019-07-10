<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>
<section id="wrap">
	<div class="area">
		<form action="/uploadTest.do" method="post" enctype="multipart/form-data">
		<input type="file" name="fileTest"id="imgInp" ><br>
		<input type="submit" value="업로드">
		</form>
		<img id="foo"  src="#" width="100px" height="100px">
	</div>

</section>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        readURL(this);
    });


  </script>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
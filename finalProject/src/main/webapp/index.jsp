<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>

<script type="text/javascript" src="/resources/js/main.js"></script><!-- main.js -->
<script>
	$(document).ready(function(){
		$("#header").addClass("main");
	});
</script>


<%-- wrap --%>
<section id="wrap">
	<!-- 메인 비주얼 -->
	<div id="mainVisual" class="full-height">
		<ul class="main-visual-container">
			<li>
				<div class="main-visual-con">
					<span style="background:url(/resources/img/main_visual01.jpg) no-repeat center top; background-size:cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span style="background:url(/resources/img/main_visual19.jpg) no-repeat right center; background-size:cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span style="background:url(/resources/img/main_visual20.jpg) no-repeat center center; background-size:cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span style="background:url(/resources/img/main_visual12.jpg) no-repeat center 25%; background-size:cover;"></span>
				</div>
			</li>
		</ul>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Top --%>
<jsp:include page="/WEB-INF/common/top.jsp"/>


<script type='text/javascript'>
$(document).ready(function(){
	$('.kwicks').kwicks({
		maxSize: '33%',
		behavior: 'menu'
	});
});
</script>

<%-- wrap --%>
<section id="adminWrap">
	<div id="adminHeader">
		<h1 class="logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:50px"></a></h1>
	</div>
	

	<div id="myPageContainer" class="clearfix">
		<!-- 마이페이지 상단 -->
		<div id="myPageTop" class="area" style="margin-bottom:0;">
			<div class="common-tbl-box" style="padding:50px; padding-bottom:40px;">
				<div class="mypage-top-box clearfix">
					<div class="mypage-left-con">
						<h2 class="main-comm-tit type2" style="margin-bottom:0; padding-top:0;">M y P a g e</h2>
					</div>
					<div class="mypage-right-con">
						<h1><img src="/resources/img/logo.png" style="max-width:50px"></h1>
						<p>가장 쉽고 편리하게 웨딩을 준비하는 방법,<br>
						합리적이고 투명한 가격공개와 스마트한 시스템이 있는 <br>
						JUO에서 결혼을 준비하세요</p>
					</div>
				</div>
			</div>
		</div><br/><br/>
		<!-- 메인 카테고리 컨텐츠 -->
		<div id="mainCategory">
			<!-- <h2 class="main-comm-tit type2 center">JUO의 모든 것</h2> -->
			<div class="main-category-box">
				<ul class="main-category-inner kwicks kwicks-horizontal clearfix">
					<li>
						<a href="/hall.do">
							<div class="category-img-thum">
								<img src="/resources/img/main_category_img01.jpg">
								<span class="category-img-cover"></span>
							</div>
							<div class="category-txt">
								<h2>웨딩홀</h2>
							</div>
						</a>
					</li>
					<li>
						<a href="/collectionListDress.do?reqPage=1">
							<div class="category-img-thum">
								<img src="/resources/img/main_category_img02.jpg">
								<span class="category-img-cover"></span>
							</div>
							<div class="category-txt">
								<h2>드레스</h2>
							</div>
						</a>
					</li>
					<li>
						<a href="/collectionListStudio.do?reqPage=1">
							<div class="category-img-thum">
								<img src="/resources/img/main_category_img03.jpg">
								<span class="category-img-cover"></span>
							</div>
							<div class="category-txt">
								<h2>스튜디오</h2>
							</div>
						</a>
					</li>
					<li>
						<a href="/collectionListMakeup.do?reqPage=1">
							<div class="category-img-thum">
								<img src="/resources/img/main_category_img04.jpg">
								<span class="category-img-cover"></span>
							</div>
							<div class="category-txt">
								<h2>메이크업&헤어</h2>
							</div>
						</a>
					</li>
					<li>
						<a href="/simulator/simulator.jsp">
							<div class="category-img-thum">
								<img src="/resources/img/main_category_img06.jpg">
								<span class="category-img-cover"></span>
							</div>
							<div class="category-txt">
								<h2>웨딩 계산기</h2>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<%--  footer --%>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</section>


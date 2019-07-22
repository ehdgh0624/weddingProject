<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp" />

<script type="text/javascript" src="/resources/js/main.js"></script>
<!-- main.js -->

<!-- 메인 :: 아코디언 -->
<link rel='stylesheet' type='text/css'
	href='/resources/css/plugin/jquery.kwicks.css' />
<script src='/resources/js/plugin/jquery.kwicks.js'
	type='text/javascript'></script>

<script type='text/javascript'>
	$(document).ready(function() {
		$("#header").addClass("main");

		$('.kwicks').kwicks({
			maxSize : '33%',
			behavior : 'menu'
		});
	});
</script>


<%-- wrap --%>
<section id="wrap">
	<!-- 메인 비주얼 -->
	<div id="mainVisual" class="full-height">
		<ul class="main-visual-container">
			<li>
				<div class="main-visual-con">
					<span
						style="background: url(/resources/img/main_visual01.jpg) no-repeat center top; background-size: cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span
						style="background: url(/resources/img/main_visual19.jpg) no-repeat right center; background-size: cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span
						style="background: url(/resources/img/main_visual20.jpg) no-repeat center center; background-size: cover;"></span>
				</div>
			</li>
			<li>
				<div class="main-visual-con">
					<span
						style="background: url(/resources/img/main_visual12.jpg) no-repeat center 25%; background-size: cover;"></span>
				</div>
			</li>
		</ul>
	</div>
	<!-- 메인 카테고리 컨텐츠 -->
	<div id="mainCategory">
		<h2 class="main-comm-tit type2 center">JUO의 모든 것</h2>
		<div class="main-category-box">
			<ul class="main-category-inner kwicks kwicks-horizontal clearfix">
				<li><a href="/hall.do">
						<div class="category-img-thum">
							<img src="/resources/img/main_category_img01.jpg"> <span
								class="category-img-cover"></span>
						</div>
						<div class="category-txt">
							<h2>웨딩홀</h2>
						</div>
				</a></li>
				<li><a href="/collectionListDress.do?reqPage=1">
						<div class="category-img-thum">
							<img src="/resources/img/main_category_img02.jpg"> <span
								class="category-img-cover"></span>
						</div>
						<div class="category-txt">
							<h2>드레스</h2>
						</div>
				</a></li>
				<li><a href="/collectionListStudio.do?reqPage=1">
						<div class="category-img-thum">
							<img src="/resources/img/main_category_img03.jpg"> <span
								class="category-img-cover"></span>
						</div>
						<div class="category-txt">
							<h2>스튜디오</h2>
						</div>
				</a></li>
				<li><a href="/collectionListMakeup.do?reqPage=1">
						<div class="category-img-thum">
							<img src="/resources/img/main_category_img04.jpg"> <span
								class="category-img-cover"></span>
						</div>
						<div class="category-txt">
							<h2>메이크업&헤어</h2>
						</div>
				</a></li>
			</ul>
		</div>
	</div>

	<!-- 메인 하단 컨텐츠 -->
	<div id="mainBottom">
		<div class="main-bottom-area clearfix">
			<h2 class="main-comm-tit type2">About JUO</h2>
			<div class="main-bottom-left-box">
				<a href="/simulator/simulator.jsp">
					<div class="main-bottom-left-cover"></div>
					<div class="main-bottom-left-con">
						<h1>
							내 웨딩비용이 궁금하다면?
							<p>웨딩 계산기</p>
						</h1>
					</div>
				</a>
			</div>
			<div class="main-bottom-right-box">
				<a href="/experienceAll.do">
					<div class="main-bottom-right-cover"></div>
					<div class="main-bottom-right-con">
						<h1>
							다양한 웨딩 사례 살펴보기
							<p>웨딩 경험담</p>
						</h1>
					</div>
				</a>
			</div>
		</div>
	</div>

</section>
<!-- Channel Plugin Scripts -->
<script>
	;
	window.channelPluginSettings = {
		"pluginKey" : "36548f6f-71dc-4118-a6a4-a454b765d10a"
	};
	(function() {
		var w = window;
		if (w.ChannelIO) {
			return (window.console.error || window.console.log || function() {
			})('ChannelIO script included twice.');
		}
		var d = window.document;
		var ch = function() {
			ch.c(arguments);
		};
		ch.q = [];
		ch.c = function(args) {
			ch.q.push(args);
		};
		w.ChannelIO = ch;
		function l() {
			if (w.ChannelIOInitialized) {
				return;
			}
			w.ChannelIOInitialized = true;
			var s = document.createElement('script');
			s.type = 'text/javascript';
			s.async = true;
			s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
			s.charset = 'UTF-8';
			var x = document.getElementsByTagName('script')[0];
			x.parentNode.insertBefore(s, x);
		}
		if (document.readyState === 'complete') {
			l();
		} else if (window.attachEvent) {
			window.attachEvent('onload', l);
		} else {
			window.addEventListener('DOMContentLoaded', l, false);
			window.addEventListener('load', l, false);
		}
	})();
</script>
<!-- End Channel Plugin -->
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp" />

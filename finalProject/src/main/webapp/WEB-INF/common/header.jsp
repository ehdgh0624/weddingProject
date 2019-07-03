<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JUO</title>
<link rel="Shortcut Icon" href="/resources/img/favicon.ico">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->
<!-- script -->
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->

<!-- Datapicker 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="/resources/js/nav.js"></script><!-- nav.js -->
<script type="text/javascript" src="/resources/js/common.js"></script><!-- common.js -->

<!-- 슬라이드 CSS & Jquery -->
<link rel="stylesheet" type="text/css" href="/resources/css/plugin/slick.css">
<script src="/resources/js/plugin/slick.js"></script>

</head>
<body>
	<header id="header">
		<div id="headerInnerWrap">
			<!-- 헤더 상단 -->
			<div id="headerInner" class="clearfix">
			   	<!-- 부가메뉴 -->
				<div class="header-util">
					<!-- 로그인 전 -->
					<c:choose>
						<c:when test="${empty sessionScope.member }">
					  		<ul class="header-util-box area clearfix">
								<li><a href="/loginPage.do">로그인</a></li>
					       		<li><a href="">회원가입</a></li>
					       		<li><a href="">업체등록</a></li>
					    	</ul>
				    	</c:when>
				    	<c:when test="${not empty sessionScope.member }">
				    	<!--  로그인 후-->
				  			<ul class="header-util-box area clearfix">
							<li><a href="/logout.do">로그아웃</a></li>
				       		<li><a href="/mypage.do">마이페이지</a></li>
				       		<c:if test="${sessionScope.member.memberId eq 'admin' }">
				       			<li><a href="/adminPage.do">관리자페이지</a></li>
				       		</c:if>
				    		</ul>
				       	</c:when>
			    	</c:choose>
			 	</div>
			   	<!-- 로고 -->
				<h1 class="header-logo"><a href="/"><img src="/resources/img/logo.png" style="max-width:80px"></a></h1>
				<!-- 주메뉴 -->
				<nav id="gnb" class="total-menu">
					<div id="gnbBg"></div>
					<ul class="clearfix">
						<li class="gnb01">
							<a href="/hall">웨딩홀</a>
						</li>
						<li class="gnb02">
							<a href="">웨딩 컬렉션</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="">드레스</a></li>
								   	<li><a href="">스튜디오</a></li>
								   	<li><a href="">메이크업&헤어</a></li>
								   	<li><a href="">부케</a></li>
								   	<li><a href="">청첩장</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb03">
							<a href="">웨딩 계산기</a>
						</li>
						<li class="gnb04">
							<a href="">커뮤니티</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="">공지사항</a></li>
								   	<li><a href="">Q&A</a></li>
								   	<li><a href="">경험담</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	
	
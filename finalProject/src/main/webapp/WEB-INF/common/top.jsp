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

<script type="text/javascript" src="/resources/js/common.js"></script><!-- common.js -->

</head>
<body class="clearfix">
	<aside id="sideMenuBar">
		<div class="top-side-box">
			<dl class="clearfix">
				<dt><img src="/resources/img/icon_bride.png" width="50"></dt>
				<dd>
					<p>Hi!</p>
					<strong>${sessionScope.member.memberName }</strong>
				</dd>
			</dl>
			<div class="common-tbl-btn-group right" style="padding-top:0;">
				<button class="btn-style3 small" style="margin:0;" onclick="location.href='/logout.do'">로그아웃</button>
			</div>
		</div>
		<div class="bottom-side-box">
			<ul class="side-bar-list">
				<c:if test="${sessionScope.member.memberId ne 'admin' }">
					<li>
						<p>기본</p>
						<span><a href="">계정관리</a></span>
					</li>
				<!-- 일반 회원일때 -->
					<li>
						<p>예약관리</p>
						<span><a href="">나의 예약현황</a></span>
					</li>
					<!-- 업체 회원일때 -->
					<li>
						<p>업체관리</p>
						<span><a href="">나의 업체 관리</a></span>
						<span><a href="">업체 예약관리</a></span>
					</li>
					<!-- 일반 회원일때 -->
					<li>
						<p>리스트</p>
						<span><a href="">웨딩비용계산결과</a></span>
					</li>
					<!-- 일반&업체 회원일때 -->
					<li>
						<p>스크랩북</p>
						<span><a href="">웨딩홀</a></span>
						<span><a href="">웨딩컬렉션</a></span>
					</li>
				</c:if>
				<!-- 관리자 일떄 -->
				<c:if test="${sessionScope.member.memberId eq 'admin' }">
					<li>
						<p>기본</p>
						<span><a href="/adminPage.do">회원관리</a></span>
					</li>
					<li>
						<p>업체관리</p>
						<span><a href="">신청관리</a></span>
						<span><a href="">공개여부관리</a></span>
					</li>
					<li>
						<p>상품관리</p>
						<span><a href="/admin/addGoodsPage.jsp">상품등록</a></span>
						<span><a href="">재고관리</a></span>
					</li>
					<li>
						<p>주문관리</p>
						<span><a href="">주문신청관리</a></span>
					</li>
				</c:if>
			</ul>
		</div>
	</aside>
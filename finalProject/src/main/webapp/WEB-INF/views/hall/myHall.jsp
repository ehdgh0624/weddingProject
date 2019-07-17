<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/myHall.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- wrap --%>
<section id="wrap">
	<div>
		<section class="myHall">
			<div class="allDiv area">
				<div class="subDiv">
					<div class="title">
						<h1>나의 견적 <span>나의견적 내용입니다.</span></h1>
					</div>
					<div class="contents">
						<div class="photo">
							<img alt="이미지 넣자" src="https://i.pinimg.com/originals/d9/82/f4/d982f4ec7d06f6910539472634e1f9b1.png">
							<!-- 등록된 이미지가 없는 경우 -->
							<!-- <img alt="" src="#"> -->
						</div>
						<div class="text">
							<p>장소이름</p>
							<ul>
								<li>홀타입<p>공원</p></li>
								<li>위치<p>서올 종로구</p></li>
								<li>결혼예정일시<p>날짜 시간</p></li>
								<li>예상하객수<p>00명</p></li>
								<li>식권<p>10:~00 20:00</p></li>
								<li>대관료<p>3,000,000원</p></li>
							</ul>
						</div>
					</div>
					<div class="contents">
						<div class="photo">
							<img alt="이미지 넣자" src="https://i.pinimg.com/originals/d9/82/f4/d982f4ec7d06f6910539472634e1f9b1.png">
							<!-- 등록된 이미지가 없는 경우 -->
							<!-- <img alt="" src="#"> -->
						</div>
						<div class="text">
							<p>음식타입</p>
							<ul>
								<li>단가<p>~</p></li>
								<li>수량<p>~</p></li>
								<li>금액<p>~</p></li>
							</ul>
						</div>
					</div>
					<div class="total">
						<ul>
							<li>total</li>
							<li>3,000,00원<li>
						</ul>
					</div>
				</div>
				<div class="btn-area">
					<button>크흠</button>
					<button>크흠2</button>
				</div>
			</div>		
		</section>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<div class="simulator-box">
			<h2 class="simulator-tit">똑똑한 웨딩계산기</h2>
			<p class="simulator-sub-tit">내 웨딩의 총 비용은 얼마일지를 <br>쉽고 빠르게 골라보고 가격을 확인해보세요</p>
			<div class="simulator-con">
				<form action="/simulatorStandard.do" method="post">
					<table class="simulator-tbl comm-tbl">
						<colgroup>
							<col width="30%">
							<col width="/">
						</colgroup>
						<tr>
							<th>지역</th>
							<td>
								<select name="weddingLoc">
									<option value="0">전국</option>
									<option value="1">서울</option>
									<option value="2">광주</option>
									<option value="3">대구</option>
									<option value="4">대전</option>
									<option value="5">부산</option>
									<option value="6">울산</option>
									<option value="7">인천</option>
									<option value="8">세종특별자치시</option>
									<option value="9">경기</option>
									<option value="10">강원</option>
									<option value="11">경남</option>
									<option value="12">경북</option>
									<option value="13">전남</option>
									<option value="14">전북</option>
									<option value="15">충북</option>
									<option value="16">충남</option>
									<option value="17">제주</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>예식일</th>
							<td><input type="text" name="weddingDate" class="datepicker wedding-date" placeholder="예식일을 선택해주세요"></td>
						</tr>
						<tr>
							<th>하객수</th>
							<td><input type="text" name="weddingPerson" class="num" placeholder="하객 수를 입력해주세요"></td>
						</tr>
					</table>
					<div class="common-tbl-btn-group">
						<button type="submit" class="btn-style1">계산 시작!</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
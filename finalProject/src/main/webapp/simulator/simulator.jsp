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
				<form action="" method="post">
					<table class="simulator-tbl">
						<colgroup>
							<col width="30%">
							<col width="/">
						</colgroup>
						<tr>
							<th>지역</th>
							<td>
								<select name="area">
									<option value=""></option>
								</select>
							</td>
						</tr>
						<tr>
							<th>예식일</th>
							<td><input type="text" name="date"></td>
						</tr>
						<tr>
							<th>하객수</th>
							<td><input type="text" name="person"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
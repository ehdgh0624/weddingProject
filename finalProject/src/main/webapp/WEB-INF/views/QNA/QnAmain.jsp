<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
			<div class="common-tbl-btn-group right" style="margin-bottom: 20px;padding-top:0;margin-top: 20px;"><button class="btn-style1" onclick="location.href='/qnawritePage.do'">글쓰기</button> </div>
			
			<table class="comm-tbl type2">
				<colgroup>
					<col width="7%">
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="20%">
					<col width="13%">
				</colgroup>
				<tr>
					<th>글번호</th>
					<th>카테고리</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
				<c:forEach items="${qdp.list}" var="q">
				<tr>
					<td>${q.rnum }</td>
					<c:choose>
						<c:when test="${q.qnaCategory == 1 }">
							<td>웨딩 홀</td>						
						</c:when>
						<c:when test="${q.qnaCategory == 2 }">
							<td>스튜디오</td>						
						</c:when>
						<c:when test="${q.qnaCategory == 3 }">
							<td>드레스</td>						
						</c:when>
						<c:when test="${q.qnaCategory == 4 }">
							<td>메이크업</td>						
						</c:when>
						<c:when test="${q.qnaCategory == 5 }">
							<td>기타</td>						
						</c:when>
					</c:choose>
					<td><a onclick="qnaView('${q.qnaNo}')" style='cursor: pointer;' id="${q.qnaNo }"> ${q.qnaTitle }</a><c:if test="${q.qnaCheck == 0 }"><img src="/resources/img/lock.png"></c:if></td>
					<td>${q.qnaWriter } </td>
					<td>${q.qnaDate }</td>
					<c:choose>
						<c:when test="${q.qnaStatus == 0 }">
							<td class="answerStay"> 답변 대기</td>
						</c:when>
						<c:when test="${q.qnaStatus == 1 }">
							<td class="answerComplete"> 답변 완료</td>
						</c:when>
					</c:choose>
					</tr>
				</c:forEach>
			</table>
			<div class="paging">${qdp.pageNavi}</div>
		  <!-- 검색박스 -->
          <div class="board-search-box">
             <form action="/qnaSearch.do" method="get">
               <input placeholder="검색하실 아이디를 입력해주세요." type="search" name="keyword" class="search-word" value="${param.keyword }">
               <button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
            </form>
         </div>
	</div>
	<div id="popupPw" class="popupView" >
		<div class="closeBtnDiv"><button class="closeBtn" type="button" onclick="popClose()" style="float:right;">&times;</button></div>
		<h1>비밀번호 입력</h1>
		<div id="pwin"><input type="password" name="qnaPw" id="pwInput"> </div>
		<div class="common-tbl-btn-group" style="margin-top: 20px;padding-top:0;"><button class="btn-style1 small" onclick="pwChk()" id="pwSub" title="" >입력</button></div>
		
	</div>
	<div id="popupBack" class="papupBack"></div>
</section>
<script>

	function qnaView(num){
		var code = "${sessionScope.member.memberCode}";
		if(code == 2){
			 location.href="/qnaView.do?qnaNo="+num; 
		}
		else if($("#"+num).siblings().is("img")){
			$("#popupPw").show();
			$("#popupBack").show();	
			$("#pwSub").attr("title",num);
		}else{
			 location.href="/qnaView.do?qnaNo="+num;
		} 
	}
	function popClose() {
		$("#popupPw").hide();
		$("#popupBack").hide();
	}
	function pwChk(){
		var num = $("#pwSub").attr("title");
		var pass = $("#pwInput").val();
		$.ajax({
			type:"POST",
			url:"/pwChk.do",
			data:{num:num , pass:pass},
			success:function(data){
				if(data>0){
					location.href="/qnaView.do?qnaNo="+num;
				}else{
					alert("비밀번호가 다릅니다.");
				}
			}
		});		
	}
</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
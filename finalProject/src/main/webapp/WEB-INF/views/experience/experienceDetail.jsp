<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<div><img src = "/resources/upload/${experience.experienceFilePath}" style="width:100%;height:600px;"></div>
<%--  Header --%>
<%-- <jsp:include page="/WEB-INF/common/sub.jsp"/> --%>
<%-- wrap --%>
<section id="wrap">
	<div class="area">
	<table class="comm-tbl">
				<tr>
					<th colspan="2"  style="text-align:center; "><span>${experience.experienceTitle } 제목맨</span></th>
			
				</tr>
				<tr>
					<th colspan="2" style="text-align:center; ">${ experience.experienceContent}</th>
					
				</tr>
				<tr>

				</tr>		    
		    </table>
		
		<table class="comm-tbl">
		<tr>
			<th style="font-size: 20px;padding: 30px;" >댓글()</th>
		</tr>	
		<tr>
			<td>ddd</td>
		</tr>	
		<tr>
			<td>ddd</td>
		</tr>	
		<tr>
			<td>ddd</td>
		</tr>	
		<tr>
			<td>ddd</td>
		</tr>	
		<tr>
			<td>
				<form action="/experienceReview.do?experienceNo=${experience.experienceNo}">
					<div class="common-tbl-btn-group" style="padding-top:0px;">
				    	<button type="submit" class="btn-style1" >댓글작성하기</button>
				    </div>
				</form>
		   </td> 	
		</tr>				
		</table>
	</div>
</section>

<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>

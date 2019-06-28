<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/CompanyEnroll.do" method="post">
		<div><!-- 기본정보 -->
			<span>파트너 기본정보 등록</span><br><br>
			<span>업체의 이름을 알려주세요</span><br>
			<input type="text" name="companyName">
			<span>업체주소</span><br>
			<input type="text" name="companyAddr">
			<span>업체전화번호</span><br>
			<input type="text" name="companyPhone">
			<span>업체사이트 url</span>
			<input type="text" name="companyUrl">
			<span>인사말</span>
			<textarea rows="15" cols="30"></textarea>
			
			<button value="">다음</button>
		</div>
		
		<div><!-- 분류선택 -->
			<span>파트너 분류선택</span><br><br>
			<span>어떤일을 하시나요?</span>
			<select name="companyKind">
				<option value="1">스튜디오</option>
				<option value="2">드레스</option>
				<option value="3">메이크업</option>
			</select>	
			<button value="">다음</button>
		</div>
		
		<div><!--스튜디오인경우  -->
			<span>동시에 진행가능한 건수</span>
			<input type="text" name="companySize">
			<span>평균스냅촬영</span>
			<input type="text" name="time">
			
			<span>본식TYPE</span>  수정: <input type="checkbox" name="fixedTitleW">
			A:<input type="text" name="ATypeExplainW"><input type="text" placeholder="금액" name="ATypePriceW">
			B:<input type="text" name="BTypeExplainW"><input type="text" placeholder="금액" name="BTypePriceW">
			C:<input type="text" name="CTypeExplainW"><input type="text" placeholder="금액" name="CTypePriceW">
			코멘트:<input type="text" name="CommentW">
			
			<span>야외스냅</span> 수정: <input type="checkbox" name="fixedTitleO">
			A:<input type="text" name="ATypeExplainO"><input type="text" placeholder="금액" name="ATypePriceO">
			B:<input type="text" name="BTypeExplainO"><input type="text" placeholder="금액" name="BTypePriceO">
			C:<input type="text" name="CTypeExplainO"><input type="text" placeholder="금액" name="CTypePriceO">
			코멘트:<input type="text" name="CommentO">
			
			<span>프리웨딩</span> 수정: <input type="checkbox" name="fixedTitleF">
			A:<input type="text" name="ATypeExplainF"><input type="text" placeholder="금액" name="ATypePriceF">
			B:<input type="text" name="BTypeExplainF"><input type="text" placeholder="금액" name="BTypePriceF">
			C:<input type="text" name="CTypeExplainF"><input type="text" placeholder="금액" name="CTypePriceF">
			코멘트:<input type="text" name="CommentO">
		
			<button value="">다음</button>
		</div>
		
		<div><!--드레스인경우  -->
			<span>동시에 진행가능한 건수</span>
			<input type="text" name="companySize">

			
			<span>피팅비</span>  수정: <input type="checkbox" name="fixedTitleW">
			설명<input type="text" name="ATypeExplainW"><input type="text" placeholder="금액" name="ATypePriceW">
			코멘트:<input type="text" name="CommentW">
			
			<span>대여비</span> 수정: <input type="checkbox" name="fixedTitleO">
			설명<input type="text" name="ATypeExplainO"><input type="text" placeholder="금액" name="ATypePriceO">
			코멘트:<input type="text" name="CommentO">
			
			<span>프리웨딩</span> 수정: <input type="checkbox" name="fixedTitleF">
			설명<input type="text" name="ATypeExplainF"><input type="text" placeholder="금액" name="ATypePriceF">
			코멘트:<input type="text" name="CommentO">
			
			<button value="">다음</button>
		
		</div>
		
		<div><!--메이크업  -->
		
			<span>본식메이크업</span>  수정: <input type="checkbox" name="fixedTitleW">
			A<input type="text" name="ATypeExplainW"><input type="text" placeholder="금액" name="ATypePriceW">
			B<input type="text" name="BTypeExplainW"><input type="text" placeholder="금액" name="ATypePriceW">
			코멘트:<input type="text" name="CommentW">
			
			<span>혼주메이크업</span>  수정: <input type="checkbox" name="fixedTitleO">
			A<input type="text" name="ATypeExplainO"><input type="text" placeholder="금액" name="ATypePriceO">
			B<input type="text" name="BTypeExplainO"><input type="text" placeholder="금액" name="ATypePriceO">
			코멘트:<input type="text" name="CommentW">
			
			<span>리허설/스튜디오 메이크업</span>  수정: <input type="checkbox" name="fixedTitleF">
			A<input type="text" name="ATypeExplainF"><input type="text" placeholder="금액" name="ATypePriceF">
			B<input type="text" name="BTypeExplainF"><input type="text" placeholder="금액" name="ATypePriceF">
			코멘트:<input type="text" name="CommentW">
			<button value="">다음</button>
		</div>
		
		<div>
			대충 이미지 업로드하는공간...
			대표사진
			사진
			사진
			사진
			
			해쉬태그입력<input type="text" name="hashtag">
			<span>여긴 해쉬태그가 들어갈공간-</span>
			
			<button type="submit">제출</button>
		</div>
	
	</form>
</body>
</html>
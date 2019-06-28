<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
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
			
			<button value="다음"></button>
		</div>
		
		<div><!-- 분류선택 -->
			<span>파트너 분류선택</span><br><br>
			<span>어떤일을 하시나요?</span>
			<select name="companyKind">
				<option value="1">스튜디오</option>
				<option value="2">드레스</option>
				<option value="3">메이크업</option>
			</select>
			
			<button value="다음"></button>
		</div>
		
		<div><!--스튜디오인경우  -->
			<span>동시에 진행가능한 건수</span>
			<input type="text" name="companySize">
			<span>평균스냅촬영</span>
			
		
		</div>
		
		<div><!--드레스인경우  -->
		
		</div>
		
		<div><!--메이크업  -->
		
		</div>
	
	</form>
</body>
</html>
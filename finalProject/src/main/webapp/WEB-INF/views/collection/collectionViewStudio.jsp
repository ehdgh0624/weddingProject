<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<%--  Header --%>
<jsp:include page="/WEB-INF/common/sub.jsp"/>
<%-- 네이버 지도 API --%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>

<%-- wrap --%>
<section id="wrap">
	<div class="area">
		<!-- 이 안에 컨텐츠 만들어주세요!!! 제발!!! -->
		<c:if test="${not empty studio}">
			${studio.studioNo}
			<br>
			${studio.code}
			<br>
			${studio.studioName}
			<br>
			${studio.studioTel}
			<br>
			${studio.studioAddr}
			<br>
			${studio.studioPrice}
			<br>
			${studio.studioTag}
			<br>
			${studio.studioLatitude}
			<br>
			${studio.studioLongitud}
			<br>
		</c:if>
		<c:if test="${not empty studioSelectList}">
		
		</c:if>
		<c:if test="${not empty galleryList}">
		
		</c:if>
		<div id="map" style="float:left;margin-left:20px;width:800px;height:300px;margin-bottom:50px;"></div>
	</div>
</section>
	<script>
		//네이버 지도 API
		window.onload = function(){
//			var map = new naver.maps.Map('map');		//시청 기준 map
			var map = new naver.maps.Map('map',{		//위도,경도 기준 map
				center : new naver.maps.LatLng(${studio.studioLatitude},${studio.studioLongitud}),
				zoom:10,
				zoomControl : true,						//zoom 콘트롤러
				zoomControlOptions : {					//zoom 콘트롤러 설정
					position : naver.maps.Position.TOP_RIGHT,		//위치:상단 오른쪽
					style : naver.maps.ZoomControlStyle.SMALL		//사이즈:최소
				}
			});
			var marker = new naver.maps.Marker({		//조건에 맞는 위치를 지도에 찍어주는 핀(마커)
				position : new naver.maps.LatLng(${studio.studioLatitude},${studio.studioLongitud}),
				map : map
			});
			naver.maps.Event.addListener(map, 'click', function(e){
				if(infoWindow.getMap()){
					infoWindow.close();
				}
				//위도 경도는 바로 구할 수 있음
				//geocode 서브모듈을 이용한 위경도 -> 주소변환
				//geocede : 주소 -> 위경도 / reverseGeocode : 위경도 -> 주소
				naver.maps.Service.reverseGeocode({
					location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),		//위도,경도를 클릭한 곳으로 바꿔줌(마커 위치)
					},function(status,response){
						if(status !== naver.maps.Service.Status.OK){					//위도,경도를 못 얻어온 경우
							return alert("못찾음");
						}
						var result = response.result,
						items = result.items;
						address = items[0].address;
				});
			});
			var contentString = [						//마커 클릭 시 출력할 주소 배열
		        '   <h3 style="display:inline-block;padding:10px;">${studio.studioName}</h3>',
		        '       <img src="/img/header_logo.png" width="100" height="100" alt="KS" style="float:right;" class="thumb" />',
		        '   	<p style="font-size:13px;padding:10px;">${studio.studioAddr}<br />',
		        '       TEL : ${studio.studioTel}<br />',
		        '       <a href="http://www.kssports.go.kr" target="_blank" style="text-decoration:none;">http://www.kssports.go.kr/</a>',
		        '   </p>',
		        '</div>'
			].join('');									//배열 값을 String으로 합침
			var infoWindow = new naver.maps.InfoWindow();		//마커 클릭 시 띄우는 창
			naver.maps.Event.addListener(marker,'click',function(){
				if(infoWindow.getMap()){				//infoWindow가 열려있는지 판단
					infoWindow.close();					//열려있을 때 닫음
				}else{
					infoWindow.setContent(contentString);		//정보창에 글시 세팅
					infoWindow.open(map,marker);
				}
			});
		}
	</script>
<%--  footer --%>
<jsp:include page="/WEB-INF/common/footer.jsp"/>
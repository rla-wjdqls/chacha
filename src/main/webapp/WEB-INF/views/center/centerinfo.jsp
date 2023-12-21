<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
	
	
<!-- 본문 시작 template.jsp -->
<hr style="margin-bottom: 0">
	<nav class="navbar navbar-light bg-light" style="height: 42px">
		 <ul class="list-inline ml-auto" style="align-items: center;">
			<li class="list-inline-item">
				<a href="/"><i class="bi bi-house fs-7" style="font-size: 20px" alt="홈으로"></i></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">보호소</span></a>
				<i class="bi bi-arrow-right-short" style="font-size: 20px color: #666"></i>
			</li>
			<li class="list-inline-item">
				<a><span style="color: #757575">보호소 소개</span></a>
			</li>
		</ul>
	</nav>
<div style="text-align: center"> 
	<br>
	<h3>안녕하세요</h3>
	<blockquote>“시민과 동물이 행복하게 공존하는 <br>서울을 만들겠습니다.”</blockquote>
		<div>
			<p>서울에서 발생하는 유기동물은 한해 약 5,600마리에 이르지만, <br>
			   그중 약 1/10은 새로운 보호자를 만나지 못해 안락사되고 있습니다.</p>

			<p>서울시는 ‘유기동물 안락사 제로화, 입양 100%’실현을 위하여, <br>
			   유기동물의 치료부터 입양, 교육까지 전담하는 동물보호 전문시설인 <br>
			   서울동물복지지원센터 마포센터와 구로센터를 각각 2017년 10월과 2020년 4월부터 운영하여 <br>
			   시민 여러분께 건강한 반려동물이 입양되도록 힘쓰고 있습니다. </p>

			<p>앞으로 유기동물 입양이 우리 사회의 보편적인 반려동물 문화가 될 수 있도록 <br>
			   시민 여러분의 많은 관심과 성원 부탁드립니다.</p>
		</div>
	<hr>
	<div class="container text-center">
	<h3>오시는 길</h3>
		<table class="table">
	  	<thead>
		    <tr>
		      <th scope="col"> </th>
		      <th scope="col">마포센터</th>
		    </tr>
		</thead>
		<tbody>
		    <tr>
		      <th scope="row">주소</th>
		      <td>마포구 매봉산로 31 시너지움 지하 1층 <br>
				  (상암동,에스플렉스센터) 
		      	 <a href="https://map.kakao.com/link/to/마포센터,37.5759133,126.8899231">
		      		<button type="button" class="btn btn-warning" style=" border-radius: 15px;">길찾기</button>
		      	 </a>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">지도</th>
		      <td>
		      	 <div id="map" style="width:100%;height:350px;"></div>
				 <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=5c53c362e263e70fd8257ba7395cc333"></script>
				   <script>
                        var mapContainer = document.getElementById('AAA'); // 지도를 표시할 div 
                        var mapOption = { 
                            center: new kakao.maps.LatLng(37.5759133,126.8899231), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                        // 마커가 표시될 위치입니다 
                        var markerPosition  = new kakao.maps.LatLng(37.5759133,126.8899231); 

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);

                        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                        // marker.setMap(null);    
                    </script>
		      </td>
		    </tr>
	 	</tbody>
	    </table>
	</div>
</div>
	

<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
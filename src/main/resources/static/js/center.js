/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    */ 
		
		//로그아웃 함수 
		function logout(){
		alert("로그아웃 되었습니다");
		}//logout() end
		
		//수정내용 작성 페이지 연결 함수 
		function center_Update() {
			document.centerfrm.action="/center/centerUpdate";
			document.centerfrm.submit();
		}//center_Update() end
		
		//동물글 수정 함수 
		function center_update() {
			document.centerfrm.action="/center/update";
			document.centerfrm.submit();
		}//center_update() end
		
		//동물글 삭제 함수 
		function center_delete() {
			if(confirm("삭제하시겠습니까?")){
				document.centerfrm.action="/center/delete";
				document.centerfrm.submit();
			}//if end
		}//center_delete() end
		
		//비회원 로그인 시 알럿창 
		function jjim_nolog(){
			alert("로그인 필요");
		}//jjim_nolog() end
		
		//입양신청 유효성 검사
		function adopt(){
			//alert(anino);
			let gg = document.getElementById("gg").value;
			let bb = document.getElementById("bb").value;
			let da = document.getElementById("da").value;
			let sub_cont = document.getElementById("sub_cont").value;
			//alert(gg);
			//alert(bb);
			//alert(da);
			//alert(sub_cont);
			
			if(gg==1 || bb!=2 || da==1 || sub_cont.length === 0){
				alert("신청불가");
			}else{
				alert("신청가능");
				eduCheck();
			}//if end
			
			function eduCheck(){
				$.ajax({
					url : 'eduCheck' ,
				    type : 'post' ,
				    data : { 'anino' : anino } ,
				    error : function (error){
						alert(error);
					},
					success : function(result){
						if(result === 0)
						alert("아");
							//aniInsert();
					}	
				   
				});//ajax end
			}//eduCheck() end
			
			

		}		
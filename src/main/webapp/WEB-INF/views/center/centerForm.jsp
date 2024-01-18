<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<% 
	String s_mlevel = (String)session.getAttribute("s_mlevel");
%>
<script>
let pageNo = 1;
let apiUrl = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&pageNo=" + pageNo + "&numOfRows=50&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
//초기 로딩 시에만 apiUrl을 생성하도록 수정
$(document).ready(function () {
    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error("api 실패");
            }
            return response.json(); //json 형태로 파싱
        })
        .then(data => {
        	let animalData = data.response.body.items.item;
            console.log(animalData);
            saveDB(animalData);
            animalList(animalData);
        })
        .catch(error => {
            console.error("에러", error);
        });
});

let scroll = true;
//스크롤 이벤트 핸들러 함수
window.onscroll = function() {
	if(scroll){
		if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	        // 스크롤이 페이지 하단에 오면 페이지 +1, 다음 페이지 데이터 요청
	        pageNo++;
	        getDate();
	    }
	}
    
};

function getDate() {
	apiUrl = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&pageNo=" + pageNo + "&numOfRows=50&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
    console.log(apiUrl);
    $.ajax({
        url: apiUrl,
        cache: false, 
        type: 'get',
        error: function (error) {
            alert(error);
        },
        success: function (result) {
            console.log(result);
            let animalData = result.response.body.items.item;
            animalList(animalData);
            saveDB(animalData);
        }
    });
}

function saveDB(animalData) {
	console.log(JSON.stringify({ animals: animalData }));
    $.ajax({
        url: "/center/saveAnimal", 
        type: 'post',
        contentType: 'application/json', // JSON 형식으로 전송
        data: JSON.stringify({ animals: animalData }),
        success: function (response) {
            console.log("데이터 저장 성공", response);
        },
        error: function (error) {
            console.error("데이터 저장 실패", error);
        }
    });
}

function animalList(animalData) {
    $.each(animalData, function (key, value) {
    	let anino = value.desertionNo;
    	let kindCd = value.kindCd;
    	console.log("anino:", anino);
    	console.log("kindCd:", kindCd);
        let a = '';
        a += "<div class='card' style='width: 18rem;'>";
        a += "<div class='card-body'>";
        a += "<img src='" + value.popfile + "' class='card-img-top img-fixed img-fluid'>";
        a += "<h5 class='card-title'>" + value.kindCd + "</h5>";
        a += "<p class='card-text'>" + value.age + "</p>";
        a += "<a href='detail?anino=" + encodeURIComponent(anino) + "&kindCd=" + encodeURIComponent(kindCd) + "' class='btn btn-primary'>보러가기</a>";
        a += "</div></div>";
        $("#container-fixed").append(a);
    })
}

let dogUrl = "";
function dogApi() {
		dogUrl = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&numOfRows=50&upkind=417000&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
		console.log("개 api" + dogUrl)
	    fetch(dogUrl)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("api 실패");
	            }
	            return response.json(); //json 형태로 파싱
	        })
	        .then(data => {
	        	let animalData = data.response.body.items.item;
	            console.log(animalData);
	            saveDB(animalData);
	            $("#container-fixed").empty();
	            animalList(animalData);
	            scroll = false;
	        })
	        .catch(error => {
	            console.error("에러", error);
	        });

}

let catUrl = "";
function catApi() {
	catUrl = "https://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&numOfRows=50&upkind=422400&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
		console.log("고양 api" + catUrl)
	    fetch(catUrl)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("api 실패");
	            }
	            return response.json(); //json 형태로 파싱
	        })
	        .then(data => {
	        	let animalData = data.response.body.items.item;
	            console.log(animalData);
	            saveDB(animalData);
	            $("#container-fixed").empty();
	            animalList(animalData);
	            scroll = false;
	        })
	        .catch(error => {
	            console.error("에러", error);
	        });
}

let othersUrl = "";
function others() {
	othersUrl = "https://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?_type=json&numOfRows=50&upkind=429900&serviceKey=2Yq147AHzw7RELqQbw8mBFIO24qYRSmJDPNo6U6tbgdKEZbEG5Jeo14JXirYpgzfN6n7%2Bf0NO016YigMyNSTWQ%3D%3D";
		console.log("기타 api" + othersUrl)
	    fetch(othersUrl)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("api 실패");
	            }
	            return response.json(); //json 형태로 파싱
	        })
	        .then(data => {
	        	let animalData = data.response.body.items.item;
	            console.log(animalData);
	            saveDB(animalData);
	            $("#container-fixed").empty();
	            animalList(animalData);
	            scroll = false;
	        })
	        .catch(error => {
	            console.error("에러", error);
	        });
}
</script>
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
				<a><span style="color: #757575">입양대기 동물</span></a>
			</li>
		</ul>
	</nav>

<div class="container-fluid">
	<h3 style="text-align: center">입양대기 동물</h3>
		<nav class="navbar navbar-light i-nav">
  			<div class="input-container" style="display: inline-block;">
		      <form class="d-flex">
		        <button class="btn btn-outline-warning" type="button" onclick="window.location.reload()">전체</button>&nbsp; &nbsp;
		        <button class="btn btn-outline-warning" type="button" onclick="dogApi()">강아지</button>&nbsp; &nbsp;
		        <button class="btn btn-outline-warning" type="button" onclick="catApi()">고양이</button>&nbsp; &nbsp;
		        <button class="btn btn-outline-warning" type="button" onclick="others()">기타</button>
		      </form>
		      
		    </div>
		</nav>

	   
	<div class="container-fixed row" id="container-fixed">
			
		   
	</div>
</div>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>      
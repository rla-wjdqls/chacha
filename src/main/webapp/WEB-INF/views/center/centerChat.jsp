<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>채팅 테스트</title>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    .container {
        width: 500px;
        margin: 0 auto;
        padding: 25px
    }
    .container h1 {
        text-align: left;
        padding: 5px 5px 5px 15px;
        color: #FFBB00;
        border-left: 3px solid #FFBB00;
        margin-bottom: 20px;
    }
    .chating {
        background-color: #000;
        width: 500px;
        height: 500px;
        overflow: auto;
    }
    .chating .me{
			color: #F6F6F6;
			text-align: right;
		}
	.chating .others{
			color: #FFE400;
			text-align: left;
	}
    input {
        width: 330px;
        height: 25px;
    }
    #yourMsg {
        display: none;
    }
</style>
</head>
<script>
    let ws;

    function wsOpen() {
        ws = new WebSocket("ws://" + location.host + "/chating");
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function(data) {
            // 소켓이 연결되면 
        }
        ws.onmessage = function(data) { // 메시지를 받으면
            let msg = data.data;
            if (msg != null && msg.trim() != '') {
            	let d = JSON.parse(msg); //JSON 형태로 받은 데이터를 파싱
            	if(d.type == "getId"){ //getID이면 초기 설정한 값
            		let si = d.sessionId != null ? d.sessionId : "";
            		if(si != ''){
            			$("#sessionId").val(si); //sessionId 값 세팅 / 소켓이 종료되기 전까지 자기를 알 수 있는 구분값
            		}
            	}else if(d.type == "message"){ //채팅을 보낸 경우
            		if(d.sessionId == $("#sessionId").val()){ //최초 세션값과 현재 세션값이 같으면 동일 인물
            			$("#chating").append("<p class='me'>나 :" + d.msg + "<p>");
            		}else{ //아니면 다른 사람
            			$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
            		}
            	}else{
            		console.warn("unknown type");
            	}
            }//if end
        }
        
        document.addEventListener("keypress", function(e) {
            if (e.keyCode == 13) { // 엔터를 치면
                send();
            }
        });
    }

    function chatName() {
        let uid = $("#userName").val();
        if (uid == null || uid.trim() == "") {
            alert("이름을 입력하세요");
            $("#userName").focus();
        } else {
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }

    function send() {
    	let option = { //JSON형태로 담아서 서버로 보내기 
    			type: "message",
    			sessionId: $("#sessionId").val(),
    			userName: $("#userName").val(),
    			msg: $("#chatting").val()
    	}
        ws.send(JSON.stringify(option));
        $("#chatting").val("");
    }
</script>
<body>
    <div id="container" class="container">
        <h1>채팅</h1>
        <input type="hidden" id="sessionId" value=""> <!-- 현재 세션값을 저장하기 위 -->
        
        <div id="chating" class="chating">
        </div>
        
        <div id="yourName">
            <table class="inputTable">
                <tr>
                    <th>사용자명</th>
                    <th><input type="text" name="userName" id="userName"></th>
                    <th><button onclick="chatName()" id="sendBtn">채팅 시작</button></th>
                </tr>
            </table>
        </div>
        
        <div id="yourMsg">
            <table class="inputTable">
                <tr>
                    <th>메시지 입력</th>
                    <th><input type="text" name="chatting" id="chatting"></th>
                    <th><button onclick="send()" id="sendBtn">보내기</button></th>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>

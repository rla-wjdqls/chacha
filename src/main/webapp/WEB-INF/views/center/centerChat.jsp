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
    .chating p {
        color: #fff;
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
            // 소켓이 연결되면 초기 세팅
        }
        ws.onmessage = function(data) {
            let msg = data.data;
            if (msg != null && msg.trim() != '') {
                $("#chating").append("<p>" + msg + "</p>");
            }
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
        let uN = $("#userName").val();
        let msg = $("#chatting").val();
        ws.send(uN + ":" + msg);
        $("#chatting").val("");
    }
</script>
<body>
    <div id="container" class="container">
        <h1>채팅</h1>
        <div id="chating" class="chating"></div>
        
        <div id="yourName">
            <table class="inputTable">
                <tr>
                    <th>사용자명</th>
                    <th><input type="text" name="userName" id="userName"></th>
                    <th><button onclick="chatName()" id="sendBtn">채팅 시작</button></th>
                </tr>
            </table>
        </div>
        
        <div id="yourMsg" style="display: none;">
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

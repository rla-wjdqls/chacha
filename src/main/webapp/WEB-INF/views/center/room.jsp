<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>  

<!DOCTYPE html>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Room</title>
    <style>
       .container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%;
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}
    </style>
</head>
<%String uid2 = request.getParameter("writer");%>
<%String anino = request.getParameter("anino");%>
<%String uid = (String)session.getAttribute("s_id"); %>
<script>
    let uid2 = "<%= uid2 %>";
    let anino = "<%= anino %>";
    let uid = "<%= uid %>";
    let msg;
    let seId;
    let roomno;

    //let roomno;
    //alert(writer);
    //alert(anino);
    //alert(uid);
    /* window.onload = function(){
    	getRoomno(anino);
    } */
    	 
    	$.ajax({
        	url : '/getRoomno',
        	type : 'post',
        	data : { 'anino' : anino
        	},
        	error : function (error) {
        		alert(error);
    		},
    		success : function (roomno) {
    			//alert('채팅방 번호 :' + roomno);
    			roomno = roomno
    		    let chatSocket = openChatSocket(roomno); //채팅방번호를 파라미터로 넘겨주면서 웹소켓 연결
    		    //웹소켓 객체를 변수에 담기 
    		}
        });//ajax end
      	
        
	    
    function openChatSocket(roomno) { //소켓이 열리면 
        let socket = new WebSocket("ws://" + location.host + "/chating/" + roomno); //방번호를 넘겨준다

        
        socket.onopen = function (event) {//소켓 연결
        	console.log("웹소켓 연결 성공");
            //소켓이 열리면 방번호와 함께 메시지 전달
            socket.send(JSON.stringify({
                type: "connect",
                roomNo: roomno
            }));	
        }//socket.onopen end
        
        socket.onclose = function (event) {
            alert("웹소켓 연결 종료");
        };
        
        socket.onmessage = function(event) { //서버에서 메시지를 받으면
        	console.log("서버에게 메시지 받음 : " + event.data);
        	//받은 메시지 처리
            let message = event.data; //서버에서 전송한 메시지를 저장
            if(message != null && message.trim() !=''){ //받은 메시지가 null이거나 빈문자열이 아니라면
            	let d = JSON.parse(message);
            	//let myId = d.uid;
            	if(d.type == "getId"){ //서버에서 받은 메시지 type이 getId
            		alert(d.sessionId);
            		let si = d.sessionId != null ? d.sessionId : "";
            		if(si != ""){ //세션 아이디가 빈문자열이 아니라면
            			sessId = si;
            			alert(sessId);
            			alert(d.type);
            		}
            	}else if(d.type == "message"){//type이 message
            		if(d.sessId == sessId){//서버에서 받은 세션id가 저장해둔 세션 id와 같다면  //d.uid와 uid 비교도 해보기
            			$("#sent_msg").append("<p>" + d.content + "</p>");
            			//alert("같다");
            		}else{
            			//alert(d.sessId);
            			alert("다르다");
            			$("#received_withd_msg").append("<p>" + d.content + "</p>");
            		}
            	}else{
            		console.log("정의되지 않은 타입");
            	}
            }
        }//socket.onmessage end
		
        document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				msg = $("#write_msg").val(); //입력 창 값 가져오기
				sendMessage(socket, msg, uid, roomno, sessId);
			}
		}); 
        
        let msg_send_btn = document.getElementById("msg_send_btn");
        msg_send_btn.addEventListener("click", function () {//전송 버튼 클릭하면
        	//alert("오");
        	msg = $("#write_msg").val(); //입력 창 값 가져오기
	        sendMessage(socket, msg, uid, roomno, sessId); // 메시지 전송
	    });
        
        
        
        function sendMessage(socket, msg, uid, roomno, sessId) {//메시지를 보내는 함수
            socket.send(JSON.stringify({
                type: "message",
                content: msg,
                uid : uid,
                roomno : roomno,
                sessId : sessId
            }));
            $("#write_msg").val(''); //빈문자열로 바꾸기 
        }//sendMessage end
        
        return socket;
    }//openChatSocket end
    
    
 // 추가적인 이벤트 핸들러 등록 가능
    // socket.onmessage = function(event) { ... };
    // socket.onclose = function(event) { ... };
    // socket.onerror = function(event) { ... };
</script>
<body>
<div class="container">
<h3 class=" text-center">Messaging</h3>
<div class="messaging">
      <div class="inbox_msg">
        <!-- 채팅창 시작 -->
        <div class="mesgs">
          <div class="msg_history">
          	<div class="outgoing_msg">
             		 <div class="sent_msg" id="sent_msg">
		                <!-- <p></p> -->
		               <%-- <span class="time_date">${row.sdate}</span> --%>
		             </div>
		            </div>
		            <div class="incoming_msg">
		              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		              <div class="received_msg">
		                <div class="received_withd_msg">
		                  <%-- <p>${row.mcontent}</p> --%>
                		  <%-- <span class="time_date">${row.sdate}</span> --%>
		                </div>
		              </div>
		            </div>
          <c:forEach items="${chatList}" var="row" varStatus="vs">
		    <c:choose>
		        <c:when test="${row.sender_id eq uid}">
		            <!-- 발신 메시지 -->
		             <div class="outgoing_msg">
             		 <div class="sent_msg">
		                <p>${row.mcontent}</p>
		               <span class="time_date">${row.sdate}</span>
		             </div>
		            </div>
		        </c:when>
		        <c:otherwise>
		            <!-- 수신 메시지 -->
		            <div class="incoming_msg">
		              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		              <div class="received_msg">
		                <div class="received_withd_msg">
		                  <p>${row.mcontent}</p>
                		  <span class="time_date">${row.sdate}</span>
		                </div>
		              </div>
		            </div>
		        </c:otherwise>
		    </c:choose>
		 </c:forEach>	
         </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" id="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" id="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" id="button" aria-hidden="true"></i></button>
            </div>
          </div>
          
        </div>
      </div>
    </div></div>
    </body>
    </body>
</html>

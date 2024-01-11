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
  overflow: auto;
  
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
    let roomNum;
    let receiver_id;
    let socket
    
    let today = new Date();

    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);
    let hours = ('0' + today.getHours()).slice(-2); 
    let minutes = ('0' + today.getMinutes()).slice(-2);
    let seconds = ('0' + today.getSeconds()).slice(-2); 
    
    let dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes;
	
   /*  let element = document.getElementById("type_msg");   
    element.scrollIntoView();
   	$("#type_msg").scrollIntoView(); */
    
    
    function handleClick(roomNo) {
        alert(roomNo);	
        roomno = roomNo;
        if (socket && socket.readyState === WebSocket.OPEN) { //이전에 연결되어있던 소켓이 있으면 닫는
            socket.close();
        }
        headerChat(roomno);
        $("#msg_history").empty(); 
        document.getElementById('chatContainer').style.display = 'block';
        openChatSocket(roomno);
    }//handleClick end
    
    function headerChat(roomno) {
		$.ajax({
			url : '/headerChatMsg',
			type : 'post',
			data : {'roomno' : roomno
			},
			error : function (error) {
				alert(error);
			},
			success : function (result) {
				//alert("아");
				console.log(result);
				$.each(result, function (key, value) {
					//console.log(value.sender_id);
					
					if(value.sender_id != uid){ //보내는 사람이 내가 아니라면
						let a = '';
						a += "<div class='incoming_msg_img'>" ;
						a += "<img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>" ;
						a += "<div class='received_msg'>" ;
						a += "<div class='received_withd_msg' id='received_msg'>" ;
						a += "<p>" + value.mcontent + "</p>" ;
						a += "<span class='time_date'>" + value.formatted_sdate + "</span>" ;
						a += "</div>" ;
						a += "</div>" ;
						$("#msg_history").append(a);
						
					}else if(value.sender_id == uid){ //보내는 사람이 나라면 
						let a = '';
						a += "<div class='outgoing_msg'>" ;
						a += "<div class='sent_msg' id='send_msg'>" ;
						a += "<p>" + value.mcontent + "</p>" ;
						a += " <span class='time_date'>" + value.formatted_sdate + "</span> " ;
						a += "</div>" ;
						a += "</div>" ;
						$("#msg_history").append(a);
							
					}
				})
			}
		});//ajax end
    	
    	
	}//headerChat end


    function openChatSocket(roomno) { //소켓이 열리면 
    	roomNum = roomno;
    
    	if (socket && socket.readyState === WebSocket.OPEN) {
            // 이미 열려 있는 WebSocket이 있으면 그것을 사용
            return socket;
        }
    	
        socket = new WebSocket("ws://" + location.host + "/chating/" + roomNum); //방번호를 넘겨준다

        socket.onopen = function (event) {//소켓 연결
        	console.log("웹소켓 연결 성공");
            //소켓이 열리면 방번호와 함께 메시지 전달
            socket.send(JSON.stringify({
                type: "connect",
                roomNo: roomNum
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
            			let chatMsg = "<div class='outgoing_msg'>" +
                  					  "<div class='sent_msg' id='sent_msg'>" +
                  					  "<p>" + d.content + "</p>" +
                  					  "<span class='time_date'>" + dateString + "</span>" +
					                  "</div></div>" ;
            			$("#msg_history").append(chatMsg);
            			
            			
            			//alert("같다");
            		}else{
            			//alert(d.sessId);
            			//alert("다르다");
            			alert("보내는 사람 아이디" + d.uid);
            			receiver_id = d.uid;
            			let chatMsg = "<div class='incoming_msg'>" +
        		       				  "<div class='incoming_msg_img'>" +
            						  "<img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>" +
        		        			  "<div class='received_msg'>" +
        		            		  "<div class='received_withd_msg' id='received_withd_msg'>" +
                  					  "<p>" + d.content + "</p>" +
                  					 "<span class='time_date'>" + dateString + "</span>" +
					        		  "</div></div></div>" ;
            			$("#msg_history").append(chatMsg);
            			
            		}
            	}else{
            		console.log("정의되지 않은 타입");
            	}
            }
        }//socket.onmessage end
		
        document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				msg = $("#write_msg").val(); //입력 창 값 가져오기
				if(msg.length !== 0){
					sendMessage(socket, msg, uid, roomNum, sessId, receiver_id);
					
				}
			}
		}); 
        
        let msg_send_btn = document.getElementById("msg_send_btn");
        msg_send_btn.addEventListener("click", function () {//전송 버튼 클릭하면
        	//alert("오");
        	msg = $("#write_msg").val(); //입력 창 값 가져오기
        	if(msg.length !== 0){
				sendMessage(socket, msg, uid, roomNum, sessId, receiver_id);
				$('#msg_history').scrollTop($('#msg_history')[0].scrollHeight);
			}
	    });
        
        function sendMessage(socket, msg, uid, roomNum, sessId, receiver_id) {//메시지를 보내는 함수
            socket.send(JSON.stringify({
                type: "message",
                content: msg,
                uid : uid,
                receiver_id : receiver_id,
                roomno : roomNum,
                sessId : sessId
            }));
            $("#write_msg").val(''); //빈문자열로 바꾸기 
        }//sendMessage end
        
        //sessions.remove(session.getId());
        return socket;
    
    }//openChatSocket end
        
</script>
<body>
<div class="container">
<h3 class="text-center" id="text-cente">채팅</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>목록</h4>
            </div>
            <div class="srch_bar">
            </div>
          </div>
          <div class="inbox_chat">
            <!-- <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div> -->
            <c:forEach items="${headerRoom}" var="RoomList" varStatus="lvs">
			    <div class="chat_list" id="chat_list" onclick="handleClick('${RoomList.roomno}')">
			        <div class="chat_people">
			            <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			            <div class="chat_ib">
			            	<c:choose>
				            	<c:when test="${RoomList.uid eq sessionScope.s_id}">
				            		<h5>${RoomList.uid2}
				            		<span class="chat_date">${RoomList.formatted_sdate}</span></h5>
				            		<p>${RoomList.mcontent}</p>
				            	</c:when>
				                <c:otherwise>
				                	<h5>${RoomList.uid}
				                	<span class="chat_date">${RoomList.formatted_sdate}</span></h5>
				            		<p>${RoomList.mcontent}</p>
				                </c:otherwise>
			                </c:choose>
			            </div>
			        </div>
			    </div>
			</c:forEach>
          </div>
        </div>
        <!-- 채팅창 시작 -->
        <div class="mesgs" style="display: none;" id="chatContainer">
          <div class="msg_history" id="msg_history">
          
         </div>
          <div class="type_msg" id="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" id="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" id="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" id="button" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div></div>
    <script>
    
    </script>
    </body>
</html>

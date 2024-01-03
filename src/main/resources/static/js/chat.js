'use strict';

let usernamePage = document.querySelector('#username-page');
let chatPage = document.querySelector('#chat-page');
let usernameForm = document.querySelector('#usernameForm');
let messageForm = document.querySelector('#messageForm');
let messageInput = document.querySelector('#message');
let messageArea = document.querySelector('#messageArea');
let connectingElement = document.querySelector('.connecting');

let stompClient = null;
let username = null;

let colors = [
	'#2196F3', '#32c787', '#00BCD4', '#ff5652',
	'#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];

function connect(event) {
    username = document.querySelector('#name').value.trim();
	
    if (username) {
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        let socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    }

    // 오타를 수정한 부분입니다
    event.preventDefault();
}


function onConnected(){
	stompClient.subscribe('/topic/public', onMessageReceived);
	
	stompClient.send('/app/chat.addUser',
		{},
		JSON.stringify({sender: username})
	)
	
	connectingElement.classList.add('hidden');
}

function onError(error){
	connectingElement.textContent = "다시시도해주세요";
}

function sendMessage(event){
	let messageContent = messageInput.value.trim();
	if(messageContent && stompClient){
		let chatMessage = {
			sender : username,
			content : messageInput.value
			
		};
		stompClient.send('/app/chat.sendMessage', {}, JSON.stringify(chatMessage));
		messageInput.value="";
		
	}
	event.preventDefault();
}


function onMessageReceived(payload) {
    let message = JSON.parse(payload.body);
    let messageElement = document.createElement('li');

    if (message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' joined';
    } else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' left';
    } else {
        messageElement.classList.add('chat-message');

        if (message.sender) {  // sender 속성이 존재하는지 확인
            let avatarElement = document.createElement('i');
            let avatarText = document.createTextNode(message.sender[0]);
            avatarElement.appendChild(avatarText);
            avatarElement.style['background-color'] = getAvatarColor(message.sender);

            messageElement.appendChild(avatarElement);
        }
    }

    let textElement = document.createElement('p');
    let messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}


function getAvatarColor(messageSender){
	let hash = 0;
	for(let i=0; i<messageSender.length; i++){
		hash = 31 * hash + messageSender.charCodeAt(i);
	}
	
	let index = Math.abs(hash%colors.length);
	return colors[index];
}

usernameForm.addEventListener('submit', connect);
messageForm.addEventListener('submit', sendMessage, true);







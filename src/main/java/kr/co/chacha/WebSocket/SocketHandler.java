package kr.co.chacha.WebSocket;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송 
		String msg = message.getPayload();
		JSONObject obj = jsonToJsonObjectParser(msg);
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(obj.toJSONString()));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception{
		//소켓 연결 
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());	//세션 ID 값을 보내기 
		session.sendMessage(new TextMessage(obj.toJSONString()));
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)throws Exception{
		//소켓 종료
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status); 
		//연결 종료된 세션을 sessionMap에서 제거한다
	}
	
	private static JSONObject jsonToJsonObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj =(JSONObject)parser.parse(jsonStr);
		}catch(ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
}
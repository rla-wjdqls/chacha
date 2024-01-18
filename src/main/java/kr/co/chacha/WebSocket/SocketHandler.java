package kr.co.chacha.WebSocket;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.chacha.chat.ChatDAO;
import kr.co.chacha.chat.ChatDTO;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	private static final String ROOM_NO = "roomno";
	
	//웹소켓 세션을 저장
    private final HashMap<String, WebSocketSession> sessionMap = new HashMap<>();
    
    //사용자 ID와 방 번호 매핑
    private final HashMap<String, Integer> userToRoomMap = new HashMap<>();
	
	@Autowired
	private ChatDAO chatDao;
	
	
	@Override //클라이언트로부터 메시지를 받으면 실행
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		String msg = message.getPayload();
		System.out.println(msg);
		JSONObject obj = jsonToObjectParser(msg);
		//System.out.println(obj.get("receiver_id")); 메시지 받은 id
		
//		if(obj.get("receiver_id")!= null) {
//			String receiver_id = (String) obj.get("receiver_id");
//			int roomno = (int) obj.get("roomno");
//			String sender_id = (String) obj.get("uid");
//			String mcontent = (String) obj.get("content");
//			
//			ChatDTO chatDto = new ChatDTO();
//				chatDto.setReceiver_id(receiver_id);
//				chatDto.setSender_id(sender_id);
//				chatDto.setMcontent(mcontent);
//				chatDto.setRoomno((int) roomno);
//				chatDao.insertMsg(chatDto);
//		}
		
		
			
		if(obj.containsKey(ROOM_NO)) {//받은 메시지에 방번호가 있는지 확인
			Object roomNoObject = obj.get(ROOM_NO);
			long roomNo = 0; 
			if (roomNoObject instanceof Number) {
			    roomNo = ((Number) roomNoObject).longValue();
			} else if (roomNoObject instanceof String) {
			    try {
			        roomNo = Long.parseLong((String) roomNoObject);
			    } catch (NumberFormatException e) {
			        
			        e.printStackTrace();
			    }
			}
			
				//방번호에 따라 메시지 처리
				for(WebSocketSession otherSession : sessionMap.values()) {
					try {
						if(isInSameRoom(session, otherSession, roomNo)) { //방번호가 동일하면 메시지 보내기
							otherSession.sendMessage(new TextMessage(obj.toJSONString()));
							
						  } 
					}catch(Exception e) {
							e.printStackTrace();
						}
					
				}
				
				Object roomNoObject2 = obj.get("roomno");
				int roomno;

				if (roomNoObject2 instanceof Number) {
				    // Number 타입인 경우
				    roomno = ((Number) roomNoObject2).intValue();
				} else if (roomNoObject2 instanceof String) {
				    // String 타입인 경우
				    try {
				        roomno = Integer.parseInt((String) roomNoObject2);
				    } catch (NumberFormatException e) {
				        // 적절한 예외 처리 또는 기본값 설정
				        roomno = 0; // 기본값 설정
				    }
				} else {
				    // 다른 타입일 경우 처리
				    roomno = 0; // 예외 처리 또는 기본값 설정
				}

				String receiver_id = chatDao.selectAmem();
//				String receiver_id = (String) obj.get("receiver_id");
				String sender_id = (String) obj.get("uid");
				String mcontent = (String) obj.get("content");
				
				ChatDTO chatDto = new ChatDTO();
					chatDto.setReceiver_id(receiver_id);
					chatDto.setSender_id(sender_id);
					chatDto.setMcontent(mcontent);
					chatDto.setRoomno((int) roomno);
					chatDao.insertMsg(chatDto);
			
		}
		
	
	}//handleTextMessage() end
	
	@SuppressWarnings("unchecked")
	@Override	//소켓이 연결되면 실행
	public void afterConnectionEstablished(WebSocketSession session)throws Exception{
		
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session); //세션아이디 맵에 담기
		
		//URI에서 방번호 뽑기
		String roomNoStr = session.getUri().toString();
		int roomNo = Integer.parseInt(roomNoStr.substring(roomNoStr.lastIndexOf("/")+1));
		System.out.println(roomNo);
		
		//사용자의 세션아이디와 방번호를 매핑하여 저장
		userToRoomMap.put(session.getId(), roomNo);
		
		
		JSONObject obj = new JSONObject(); //객체 생성
		obj.put("type", "getId");	
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString())); //저장한 사용자의 세션아이디 보내기
	}//afterConnectionEstablished() end
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)throws Exception {
		//소켓 종료 
		sessionMap.remove(session.getId());
        userToRoomMap.remove(session.getId());
        super.afterConnectionClosed(session, status);
	}//afterConnectionClosed() end
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		}catch(ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}//jsonToObjectParser() end
	
	private boolean isInSameRoom(WebSocketSession session1, WebSocketSession session2, long roomNo) {
		Integer user1Room = userToRoomMap.get(session1.getId());
		Integer user2Room = userToRoomMap.get(session2.getId());
		
		return user1Room != null && user2Room != null && user1Room.equals(user2Room) && user1Room == roomNo;
	}//isInSameRoom() end
	

}

package kr.co.chacha.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	public ChatDAO() {
		System.out.println("---ChatDAO() 객체 생성");
	}
	
	@Autowired
	SqlSession sqlSession;
	
	public Integer selectChatRoom(ChatDTO chatDto){
		Integer result = sqlSession.selectOne("chat.selectChatRoom", chatDto);
		if(result == null) {
			result = 0;
		}
		return result;
	}// 채팅방 조회
	
	
	public int createRoom(ChatDTO chatDto){
		return sqlSession.insert("chat.createRoom", chatDto);
	}// 채팅방 생성
	
	public List<ChatDTO> selectChat(ChatDTO chatDto){
		return sqlSession.selectList("chat.selectChat", chatDto);
	}
	
	public Integer getRoomno(ChatDTO chatDto) {
		Integer result = sqlSession.selectOne("chat.selectChatRoom", chatDto);
		if(result == null) {
			result = 0;
		}
		return result;
	}
	
	
}

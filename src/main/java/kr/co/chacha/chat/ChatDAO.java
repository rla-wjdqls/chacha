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
	
	public String selectAmem() {
		return sqlSession.selectOne("chat.selectAmem");
	}
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
	
	public List<Map<String, Object>> selectChat(ChatDTO chatDto){
		return sqlSession.selectList("chat.selectChat", chatDto);
	}//메시지 조회
	
	public Integer getRoomno(ChatDTO chatDto) {
		Integer result = sqlSession.selectOne("chat.selectChatRoom", chatDto);
		if(result == null) {
			result = 0;
		}
		return result;
	}//방번호 조회
	
	public List<Map<String, Object>> headerRoom(String uid){
		return sqlSession.selectList("chat.headerRoom", uid);
	}//헤더에서 채팅방 조회
	
	public List<ChatDTO> headerChat(ChatDTO chatDto){
		return sqlSession.selectList("chat.headerChat", chatDto);
	}//헤더에서 메시지 조회
	
	public int insertMsg(ChatDTO chatDto) {
		return sqlSession.insert("chat.insertMsg", chatDto);
	}
	
	
}

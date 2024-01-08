package kr.co.chacha.chat;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/chat")
public class ChatCont {
	
	@Autowired
	private ChatDAO chatDao;
	
	@PostMapping("/chat")
	public ModelAndView chat(HttpServletRequest req, HttpSession session) {
		String anino = req.getParameter("anino");
		String uid2 = req.getParameter("writer");
		String uid = (String)session.getAttribute("s_id");
		//System.out.println(anino);	//동물글번호 
		//System.out.println(uid2);	//글작성
		//System.out.println(uid);	//회원아이디
		
		//파라미터 dto에 담기
		ChatDTO chatDto = new ChatDTO();
		chatDto.setAnino(anino);
		chatDto.setUid(uid);
		chatDto.setUid2(uid2);
		
		int roomno = chatDao.selectChatRoom(chatDto); //채팅방번호 조회
		//System.out.print(roomno);
		if(roomno != 0) {	//채팅방이 있으면 방번호 dto에 담기
			chatDto.setRoomno(roomno);
			//System.out.print(roomno);
		}else {
			int cnt = chatDao.createRoom(chatDto); //없다면 방 생성
			//System.out.println(cnt);
			roomno = chatDao.selectChatRoom(chatDto); //생성한 방번호 dto에 담기
			chatDto.setRoomno(roomno);
			//System.out.print(roomno);
		}
		
		List<ChatDTO> chatList = chatDao.selectChat(chatDto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/room");
		mav.addObject("chatList", chatList);
		return mav;
	}
	
	@PostMapping("/getRoomno")
	public ResponseEntity<Integer> getRoomno(String anino, HttpSession session) {
		System.out.println(anino);
		String uid = (String)session.getAttribute("s_id");
		System.out.println(uid);	//회원아이디
		ChatDTO chatDto = new ChatDTO();
		chatDto.setAnino(anino);
		chatDto.setUid(uid);
		int roomno = chatDao.getRoomno(chatDto);
		System.out.println(chatDto.getRoomno());
		return  new ResponseEntity<>(roomno, HttpStatus.OK);
	}
	
	
}

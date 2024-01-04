package kr.co.chacha.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/chat")
public class ChatCont {
	
	List<ChatDTO> roomList = new ArrayList<ChatDTO>();
	static int roomNumber = 0;
	
	@PostMapping("/centerChat")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerChat");
		return mav;
	}
	
	//채팅방 페이지
	@PostMapping("/room")
	public ModelAndView room() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/room");
		return mav;
	}
	
	
	//채팅방 생성
	@PostMapping("/createRoom")
	public @ResponseBody List<ChatDTO> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatDTO chatDto = new ChatDTO();
			chatDto.setRoomNumber(++roomNumber);
			chatDto.setRoomName(roomName);
			roomList.add(chatDto);
		}
		return roomList;
	}
	
	//방 정보 가져오기
	@PostMapping("/getRoom")
	public @ResponseBody List<ChatDTO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	//채팅방
	@GetMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mav = new ModelAndView();
		int roomNumber = Integer.parseInt(((String)params.get("roomNumber")).trim());
		
		List<ChatDTO> new_list =roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mav.addObject("roomName", params.get("roomName"));
			mav.addObject("roomNumber", params.get("roomNumber"));
			mav.setViewName("center/centerChat");
		}else {
			mav.setViewName("room");
		}
		return mav;
	}
}

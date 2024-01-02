package kr.co.chacha.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class ChatCont {
	
	@PostMapping("/centerChat")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerChat");
		return mav;
	}
}

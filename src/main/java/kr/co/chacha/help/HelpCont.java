package kr.co.chacha.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/help")
public class HelpCont {
	
	public HelpCont() {
		System.out.println("-----HelpCont() 객체 생성");
	}//HelpCont() end
	
	@GetMapping("/helpList")
	public ModelAndView centerInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/helpList");
		return mav;
	}
	
	@GetMapping("/helpForm")
	public ModelAndView centerForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/helpForm");
		return mav;
	}
}

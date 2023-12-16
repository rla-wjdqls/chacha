package kr.co.chacha.center;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/center")
public class CenterCont {
	
	public CenterCont() {
		System.out.println("----CenterCont() 객체 생성");
	}//CenterCont() end
	
	@GetMapping("/centerinfo")
	public ModelAndView info() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerinfo");
		return mav;
	}
}

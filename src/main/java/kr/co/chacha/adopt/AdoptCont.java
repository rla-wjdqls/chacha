package kr.co.chacha.adopt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/adopt")
public class AdoptCont {
	
	public AdoptCont() {
		System.out.println("-----AdoptCont() 객체 생성");
	}//CenterCont() end
	
	@GetMapping("/adoptReview")
	public ModelAndView adoptReview() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adopt/adoptReview");
		return mav;
	}
	
	@GetMapping("/adoptForm")
	public ModelAndView adoptForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adopt/adoptForm");
		return mav;
	}
}

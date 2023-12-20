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
	
	@GetMapping("/centerinfo") //보호소 소개
	public ModelAndView centerInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerinfo");
		return mav;
	}
	
	@GetMapping("/centerForm") //입양가능 동물 목록
	public ModelAndView centerForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerForm");
		return mav;
	}
	
	@GetMapping("/centerWrite") //동물 추가 페이지
	public String write() {
		return "center/centerWrite";
	}
}

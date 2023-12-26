package kr.co.chacha.research;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.chacha.member.MemberDAO;

@Controller
@RequestMapping("/research")
public class ResearchCont {

	
	public ResearchCont() {
		System.out.println("----ResearchCont()객체 생성됨");
	}//end
	
	
	@Autowired
	ResearchDAO researchdao;

	
	// 설문조사 페이지 이동
	@GetMapping("/researchForm")
	public ModelAndView research() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		return mav;
	}//research() end
	
	
}//class end









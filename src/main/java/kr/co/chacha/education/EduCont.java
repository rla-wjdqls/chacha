package kr.co.chacha.education;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/education")
public class EduCont {
	
	public EduCont() {
		System.out.println("-----EduCont() 객체 생성");
	}
	
	@Autowired
	private EduDAO eduDao;
	
	@RequestMapping("/educationList")
	public ModelAndView educationList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/educationList");
		return mav;
	}
	
	
	
	
	
	
	

}

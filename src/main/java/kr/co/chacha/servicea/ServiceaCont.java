package kr.co.chacha.servicea;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/servicea")
public class ServiceaCont {

	public ServiceaCont() {
		System.out.println("----ServiceaCont()객체 생성됨");
	}//end
	
	@Autowired
	ServiceaDAO serviceaDAO;
	
	
	@GetMapping("/serviceList")
	public ModelAndView serviceList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicea/serviceList");
		return mav;
	}//serviceList() end
	
	
	
	
}//end

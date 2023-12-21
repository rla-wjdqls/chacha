package kr.co.chacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/service")
public class ServiceCont {

	public ServiceCont() {
		System.out.println("----ServiceCont()객체 생성됨");
	}//end
	
	@Autowired
	ServiceDAO serviceDAO;
	
	
	/*
	 * @GetMapping("/serviceList") public ModelAndView serviceList() { ModelAndView
	 * mav = new ModelAndView(); mav.setViewName("service/serviceList"); return mav;
	 * 
	 * }//serviceList() end
	 */	
	@RequestMapping("/serviceList")
	public ModelAndView serviceList2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName ("service/serviceList");
		mav.addObject("serviceList2",serviceDAO.serviceList2());
		return mav;
	}//serviceList() end
	
	@GetMapping("/serviceForm")
	public ModelAndView serviceForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceForm");
		return mav;
		
	}//serviceList() end
	
	@PostMapping("/serviceForm")
	public ModelAndView serviceIns(ServiceDTO servicedto) {
		ModelAndView mav = new ModelAndView();
		serviceDAO.insert(servicedto);
		mav.setViewName("redirect:/service/serviceList");		
		return mav;
	}//serviceList() end
	
	
	
	
}//end

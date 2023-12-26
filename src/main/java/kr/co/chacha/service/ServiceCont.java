package kr.co.chacha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
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
	public ModelAndView serviceList2(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String uid=(String)session.getAttribute("s_id");
		mav.setViewName ("service/serviceList");
		mav.addObject("serviceList2",serviceDAO.serviceList2(uid));
		return mav;
	}//serviceList() end
	
	@GetMapping("/serviceForm")
	public ModelAndView serviceForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceForm");
		return mav;
	}//
	
	//게시물 글쓰기
	@PostMapping("/serviceForm")
	public ModelAndView serviceIns(ServiceDTO servicedto,
			 HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String uid=(String)session.getAttribute("s_id");
		servicedto.setUid(uid);
		serviceDAO.insert(servicedto);
		mav.setViewName("redirect:/service/serviceList");		
		return mav;
	}//serviceList() end
	

	// 게시물 상세 페이지로 이동
    @GetMapping("/servicedetail")
    public ModelAndView serviced(int sno) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("service/servicedetail");
    	mav.addObject("serviced", serviceDAO.detail(sno));
    	return mav;
    }
    
	// 게시물 수정
	@GetMapping("/serviceUpdate")
	public ModelAndView serviceUpdate(int sno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceUpdate");
		mav.addObject("serviceup", serviceDAO.detail(sno));
		return mav;
		
	}//화면전환
	
	@PostMapping("/serviceUpdate")
	public ModelAndView serviceUpdate1(ServiceDTO servicedto) {
		ModelAndView mav = new ModelAndView();
		serviceDAO.update(servicedto);
		mav.setViewName("redirect:/service/serviceList");		
		return mav;
	}//동작
	
	//게시물 삭제
	@PostMapping("/serviceDelete")
	public ModelAndView serviceDelete(int sno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/service/serviceList");
		serviceDAO.delete(sno);
		return mav;
		
	}//serviceList() end
}//end

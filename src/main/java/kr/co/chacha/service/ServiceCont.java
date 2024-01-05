package kr.co.chacha.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.servicea.ServiceaDTO;

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
	public ModelAndView serviceList(@RequestParam(value="page", required=false) Integer page) {
		ModelAndView mav = new ModelAndView();
		
		int currentPage = (page != null) ? page: 1;
		int totalCount = serviceDAO.serviceListCnt();
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi=startNavi+naviLimit-1;
		
		if(maxPage<endNavi) {
			endNavi = maxPage;
		}
		
		List<ServiceDTO> serviceList = serviceDAO.serviceList(currentPage, boardLimit);
		
		if(!serviceList.isEmpty()) {
			mav.addObject("startNavi",startNavi);
			mav.addObject("endNavi",endNavi);
			mav.addObject("maxPage",maxPage);
			mav.addObject("serviceList",serviceList);
		}
		
		mav.setViewName ("service/serviceList");
		//mav.addObject("serviceList",serviceDAO.serviceList(dto));
		//mav.addObject("serviceListCnt",serviceDAO.serviceListCnt());
		return mav;
	}//serviceList() end
	
	@GetMapping("/serviceForm")
	public ModelAndView serviceForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceForm");
		return mav;
		
	}//serviceList() end
	
	@PostMapping("/serviceForm")
	public ModelAndView serviceIns(ServiceDTO servicedto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sid = session.getAttribute("s_id").toString();
		//System.out.println("세션값 확인 : " + sid); 세션값 가져오는 거 확인되고 로그 찌겪혀으니까 확실한거 확인
		servicedto.setUid(sid);
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
	
	// 봉사신청 
		@GetMapping("/servicea")
		public ModelAndView servicea(int sno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service/servicea");
			mav.addObject("servicea", serviceDAO.detail(sno));
			return mav;
			
		}//화면전환
		
		@PostMapping("/servicea")
		public ModelAndView servicea(ServiceDTO servicedto) {
			ModelAndView mav = new ModelAndView();
			serviceDAO.insertServicea(servicedto);
			mav.setViewName("redirect:/service/serviceList");
			return mav;
			
		}//화면전환
		

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
		
	//페이징
	
	//처음페이지 요청은 1페이지를 보여줌
	
	@GetMapping("/paging")
	public String paging(Model model,
						@RequestParam(value = "page", required = false, defaultValue = "1")int page) {
		System.out.println("page = " + page);
		return "redirect:/";
	}
	
		 

		 

}//end

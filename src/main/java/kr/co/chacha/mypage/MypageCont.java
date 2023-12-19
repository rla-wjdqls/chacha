package kr.co.chacha.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/mypage")
public class MypageCont {

	public MypageCont() {
		System.out.println("----MypageCont()객체 생성됨");
	}//end
	
	@Autowired
	MypageDAO mypageDao;
	
	
	@GetMapping("/jjimList")
	public ModelAndView jjimlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/jjimList");
		return mav;
	}//jjimlist() end
	
	@GetMapping("/myList")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList");
		return mav;
	}//jjimlist() end
	
	@GetMapping("/myClass")
	public ModelAndView myclass() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myClass");
		return mav;
	}//jjimlist() end
	
	@GetMapping("/myService")
	public ModelAndView myservice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myService");
		return mav;
	}//jjimlist() end
	
	@GetMapping("/myInfo")
	public ModelAndView myinfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myInfo");
		return mav;
	}//jjimlist() end
	
/*
    @GetMapping("/myClass")
    public ModelAndView myClassList() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myClass");
    	mav.addObject("myClassList", mypageDao.myClassList());
    	
        return mav; 
    }//myClassList() end
*/    
    
    
    	
	
	
	
	
}//end



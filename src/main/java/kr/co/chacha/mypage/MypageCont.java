package kr.co.chacha.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;


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
	public ModelAndView myclassPage() {
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
	

    @RequestMapping("/myClass")
    public ModelAndView myClassList(HttpSession session) {
    	String s_id = "h99999";
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myClass");
    	mav.addObject("myClassList", mypageDao.myeduList(s_id));
    	
        return mav; 
    }//myClassList() end
 
    
    @RequestMapping("/myService")
    public ModelAndView myServiceList() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myService");
    	mav.addObject("myServiceList", mypageDao.mysvList());
    	
        return mav; 
    }//myClassList() end
    	
	
	
	
	
}//end



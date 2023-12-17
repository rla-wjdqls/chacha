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
	MypageDAO MypageDAO;
	
	
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
	
	
}//end



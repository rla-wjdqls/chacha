package kr.co.chacha.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("----MemberCont()객체 생성됨");
	}//end
	
	@Autowired
	MemberDAO memberDao;
	
	//로그인 페이지 이동
	@GetMapping("/loginForm")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}//login() end
	
	 
	
	//회원가입 페이지 이동
	@GetMapping("/signupForm")
	public ModelAndView signupForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/signupForm");
		return mav;
	}//login() end
	
	
	
}//end

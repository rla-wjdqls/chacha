package kr.co.chacha.research;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
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
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
	
	
	
	// 설문조사 폼 이동
	@GetMapping("/researchList")
	public ModelAndView researchList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		return mav;
	}//researchList() end
	

	// 설문조사 등록폼 이동
	@GetMapping("/researchReg")
	public ModelAndView researchReg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchReg");
		return mav;
	}//researchReg() end
	
	
	@PostMapping("/getNextQuestion")
	@ResponseBody
	public String getNextQuestion(@RequestParam(name = "answer1") String answer1) {
	    // answer1에 따라서 다음 질문 생성
	    String nextQuestion = "";
	    if ("1".equals(answer1)) {
	        // 예를 들어, answer1이 1일 때의 다음 질문을 생성
	        nextQuestion = "질문2. 귀하의 가구원은 어떻게 되십니까?<br><br>" +
	                        "<input type=\"radio\" name=\"survay2\" value=\"5\" />만족 " +
	                        "<input type=\"radio\" name=\"survay2\" value=\"4\" />다소만족 " +
	                        "<input type=\"radio\" name=\"survay2\" value=\"3\" />보통 " +
	                        "<input type=\"radio\" name=\"survay2\" value=\"2\" />다소미흡 " +
	                        "<input type=\"radio\" name=\"survay2\" value=\"1\" />매우미흡";
	    } else {
	        // answer1이 다른 경우에 대한 다음 질문 생성
	        // ...
	    }

	    return nextQuestion;
	}

	
	

	
	
	
	
}//class end









package kr.co.chacha.research;

import java.net.http.HttpRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.member.MemberDAO;
import kr.co.chacha.mypage.MypageDTO;

@Controller
@RequestMapping("/research")
public class ResearchCont {

	
	public ResearchCont() {
		System.out.println("----ResearchCont()객체 생성됨");
	}//end
	
	
	@Autowired
	ResearchDAO researchdao;

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
	
	// 설문조사 페이지 이동
	@GetMapping("/researchForm")
	public ModelAndView research() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		return mav;
	}//research() end
	
	
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
	
	
	//설문조사 등록
	@GetMapping("/researchInsert")
	public void researchInsert(HttpServletRequest req, ResearchDTO researchDto) {
		//설문번호 발급 생성하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		String rno = "r" + date;
		//System.out.println(rno); //r20240104170120
		
		String rtitle = req.getParameter("rtitle");
		String rstate = req.getParameter("rstate");
		String rop = req.getParameter("rop");
		
		//문자열 값 -> java.util.Date 변환
		String rdate1String = req.getParameter("rdate1");
	    String rdate2String = req.getParameter("rdate2");

	    // String을 Date로 변환
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	        Date rdate1 = dateFormat.parse(rdate1String);
	        Date rdate2 = dateFormat.parse(rdate2String);

	        researchDto.setRno(rno);
	        researchDto.setRstate(rstate);
	        researchDto.setRop(rop);
	        researchDto.setRtitle(rtitle);
	        researchDto.setRdate1(rdate1);
	        researchDto.setRdate2(rdate2);
	        
	        System.out.println(researchDto.getRdate1());
	        System.out.println(researchDto.getRdate2());


	    } catch (ParseException e) {
	        e.printStackTrace(); // 날짜 형식이 잘못된 경우 예외 처리
	    }

	}//researchInsert() end
	
	
	
	
	
	@GetMapping("/researchNext")
	@ResponseBody
		public String researchNext(@RequestParam("questionNumber") int questionNumber) {
		    // 각 질문에 대한 HTML을 반환하는 로직 추가
		    if (questionNumber == 1) {
		        return "질문1. 귀하의 성별은 어떻게 되십니까?<br><br>" +
		                "<input type='radio' name='survay1' value='5' />만족" +
		                "<input type='radio' name='survay1' value='4' />다소만족" +
		                "<input type='radio' name='survay1' value='3' />보통" +
		                "<input type='radio' name='survay1' value='2' />다소미흡" +
		                "<input type='radio' name='survay1' value='1' />매우미흡";
		    } else if (questionNumber == 2) {
		        return "질문2. 귀하의 가구원은 어떻게 되십니까?<br><br>" +
		                "<input type='radio' name='survay2' value='5' />만족" +
		                "<input type='radio' name='survay2' value='4' />다소만족" +
		                "<input type='radio' name='survay2' value='3' />보통" +
		                "<input type='radio' name='survay2' value='2' />다소미흡" +
		                "<input type='radio' name='survay2' value='1' />매우미흡";
		    } else {
		        // 다른 질문에 대한 처리 추가
		        return "다음문제";
		    }
		
	}//researchNext() end
	
	
	
	
	
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









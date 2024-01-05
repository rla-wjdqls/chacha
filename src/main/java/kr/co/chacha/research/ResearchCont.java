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
	
	
	// 설문조사 페이지 이동
	@GetMapping("/researchList")
	public ModelAndView researchList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		return mav;
	}//researchList() end
	
	
	// 설문조사 폼 불러오기
	//research
	@PostMapping("/researchList")
	public void researchContent() {
	
	String rno = "r20240105170513";
	
	//선택한 글의 설문번호로 정보 불러오기
	researchdao.loadContent(rno);
	
	
	
	}//researchContent() end
	
	
	
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
	
	
	

	// 설문조사 등록폼 이동
	@GetMapping("/researchReg")
	public ModelAndView researchReg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchReg");
		return mav;
	}//researchReg() end
	
	
	//설문조사 등록
	@PostMapping("/researchInsert")
	public void researchInsert(HttpServletRequest req) {
	    
		String[] qcont = req.getParameterValues("qcont");
		String[] qtype = req.getParameterValues("qtype");
		String[] choice = req.getParameterValues("choice");
		
		for(int i=0; i<qcont.length; i++) {
			System.out.println(qcont[i]);
		}//for end
		//우리 아이가 예쁠떄, 얄미울때
		
		for(int i=0; i<qtype.length; i++) {
			System.out.println(qtype[i]);
		}//for end
		//우리 아이가 예쁠떄, 얄미울때
		
		for(int i=0; i<choice.length; i++) {
			System.out.println(choice[i]);
		}//for end
		//잘때, 항상, 매번
		
		ResearchDTO researchDto=new ResearchDTO();
		
		//설문번호 발급 생성하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		String rno = "r" + date;
		//System.out.println(rno); //r20240104170120
		
        //researchDto.setRno(rno);
        //researchDto.setQcont(qcont);
        //researchDto.setChoice(choice);
        
        //researchdao.researchInsert(researchDto);
        //researchdao.researchqInsertm(researchDto);

        //생성된 일련번호 qno 찾아와서 dto에 담아줌  
        //int qno = researchdao.checkQno(researchDto);
        
        //researchDto.setQno(qno);
        
        //researchdao.researchcInsert(researchDto);
        	
        

	}//researchInsert() end
	
	
	
	
	
	
	

	
	
	
	


	
	

	
	
	
	
}//class end









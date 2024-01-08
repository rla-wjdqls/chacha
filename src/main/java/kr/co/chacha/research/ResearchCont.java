package kr.co.chacha.research;

import java.net.http.HttpRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
		
	
	// 설문조사 목록 페이지
	@RequestMapping("/researchList")
	public ModelAndView researchList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		mav.addObject("researchList", researchdao.researchList());
		return mav;
	}//researchList() end
	
	
	// 설문조사 페이지 띄어주기
	@RequestMapping("/researchForm")
	public ModelAndView researchForm(@RequestParam String rno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		mav.addObject("researchList", researchdao.researchList2(rno));
		mav.addObject("researchForm", researchdao.researchForm(rno));
		mav.addObject("researchChoice", researchdao.researchChoice(rno));
		return mav;
	}//researchForm() end
	
	

	// 설문조사 등록폼 이동
	@GetMapping("/researchReg")
	public ModelAndView researchReg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchReg");
		return mav;
	}//researchReg() end
	
	
	
	//설문조사 등록
	@PostMapping("/researchInsert")
	public void researchInsert(HttpServletRequest req, ResearchDTO researchDTO) {
	    
		String[] qcont = req.getParameterValues("qcont");
		String[] qtype = req.getParameterValues("qtype");
		String[] choice = req.getParameterValues("choice");
		
		/*
			for(int i=0; i<qcont.length; i++) {
				System.out.println(qcont[i]);
			}//for end
			
			for(int i=0; i<qtype.length; i++) {
				System.out.println(qtype[i]);
			}//for end
			
			for(int i=0; i<choice.length; i++) {
				System.out.println(choice[i]);
			}//for end
		*/
		
		//설문번호 발급 생성하기
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sd.format(new Date());
		String rno = "r" + date;
		
        
        //research 테이블 isnert 
        //researchdao.researchInsert(researchDTO);
        
        //researchq 테이블 isnert
        //배열을 list에 담음
        List<ResearchDTO> researchList = new ArrayList<>();
        
        researchList.add(researchDTO);
        
        
	    researchdao.researchqInsert(researchList);

        //생성된 일련번호 qno 찾아와서 dto에 담아줌  
        //int qno = researchdao.checkQno(researchDTO);
        //System.out.println(qno);
        
        //researchDto.setQno(qno);
        
        //researchdao.researchcInsert(researchDto);
        	
        

	}//researchInsert() end
	
	
	
	
	
	
	

	
	
	
	


	
	

	
	
	
	
}//class end









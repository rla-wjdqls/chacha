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
import jakarta.websocket.Session;
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
		
		//qno 가져오기
		int qno = researchdao.chekckminQno(rno);
		System.out.println(qno);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		mav.addObject("researchList", researchdao.researchList2(rno));
		//qno에 맞는 질문 가져오기
		//mav.addObject("researchForm", researchdao.checkQcont(qno));
		//mav.addObject("researchChoice", researchdao.researchChoice(rno));
		return mav;
	}//researchForm() end
	
	

	// 설문 등록 페이지 이동
	@GetMapping("/researchReg")
	public ModelAndView researchReg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchReg");
		return mav;
	}//researchReg() end
	
	
	//설문조사 등록
		@PostMapping("/researchInsert")
		public void researchInsert(ResearchDTO researchDTO) {

			//설문번호 발급 생성하기
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
			String date = sd.format(new Date());
			String rno = "r" + date;
	        researchDTO.setRno(rno);
			
	        //research 테이블 isnert 
	        int cnt1 = researchdao.researchInsert(researchDTO);
	        //System.out.println(cnt1);
	        
	        //researchq 테이블 isnert
	        List<ResearchDTO> researchList = new ArrayList<>();
	     
	        // 원래의 qcont를 쉼표(,)를 기준으로 분리하여 ResearchDTO를 생성하고 리스트에 추가
	        String[] qcontArray = researchDTO.getQcont().split(",");
	        String[] qtypeArray = researchDTO.getQtype().split(",");

	        for (int i = 0; i < qcontArray.length; i++) {
	            ResearchDTO newResearchDTO = new ResearchDTO();
	            newResearchDTO.setRno(researchDTO.getRno());
	            newResearchDTO.setQcont(qcontArray[i]);
	            newResearchDTO.setQtype(qtypeArray[i]);
	            researchList.add(newResearchDTO);
	        }//for end
	        
		    int cnt2 = researchdao.researchqInsert(researchList);
		    //System.out.println(cnt2);
		    
		    System.out.println(researchDTO);
		    //rno=r20240109112244, qno=0, choice=선택지1,선택지2-1,선택지2-2,선택지3-1,선택지3-2,선택지3-3
		    
		    //qno 가져오기
	        System.out.println(researchdao.checkQno(rno)); //[qno=32, qno=33, qno=34]
	        //[rno=null, qno=38, choice=null, rno=null, qno=39, choice=null, rno=null, qno=40, choice=null]
	        
	        
	        
	        
	        //researchDto.setQno(qno);
	        
	        //researchdao.researchcInsert(researchDto);
	        	
	        

		}//researchInsert() end

	
	

	

	
	
}//class end









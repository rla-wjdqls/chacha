package kr.co.chacha.research;

import static org.hamcrest.CoreMatchers.nullValue;

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
	@GetMapping("/researchList")
	public ModelAndView researchList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		mav.addObject("researchList", researchdao.researchList());
		return mav;
	}//researchList() end
	
	
	// 설문조사 페이지 띄어주기
	@RequestMapping("/researchForm")
	public ModelAndView researchForm(@RequestParam String rno) {
		//System.out.println(rno); //r20240110144825
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		mav.addObject("researchList2", researchdao.researchList2(rno));
		//mav.addObject("researchrForm", researchdao.researchrForm(rno));
		return mav;
	}//researchForm() end
	
	
	// 설문조사 내용 가져와 보여주기
	@GetMapping("/researchrList")
	@ResponseBody
	public List<ResearchDTO> researchrList(@RequestParam String rno) {
		
		List<ResearchDTO> list = researchdao.researchrList(rno);
		return list;
		
	}//researchrList() end
	
	
	// 설문조사 답변 insert
	@PostMapping("/researchrInsert")
	@ResponseBody
	public int researchrInsert(@RequestParam String rno, HttpSession session, ResearchDTO researchDTO) {
		
		String s_id = (String)session.getAttribute("s_id");
		researchDTO.setUid(s_id);
		
		List<ResearchDTO> researchrList = new ArrayList<>();
		
		int cnt = researchdao.researchrInsert(researchrList);
		return cnt;
		
	}//researchrList() end

	
	

	// 설문 등록 페이지 이동
	@GetMapping("/researchReg")
	public ModelAndView researchReg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchReg");
		return mav;
	}//researchReg() end
	
	
	//설문조사 등록
		@PostMapping("/researchInsert")
		public ModelAndView researchInsert(ResearchDTO researchDTO) {

			//설문번호 발급 생성하기
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
			String date = sd.format(new Date());
			String rno = "r" + date;
	        researchDTO.setRno(rno);
			
	        //research 테이블 isnert 
	        int cnt1 = researchdao.researchInsert(researchDTO);
	        
	        //researchq 테이블 isnert
	        List<ResearchDTO> researchList = new ArrayList<>();
	     
	        // 원래의 qcont를 쉼표(,)를 기준으로 분리하여 ResearchDTO를 생성하고 리스트에 추가
	        String[] qcontArray = researchDTO.getQcont().split(",");
	        String[] qtypeArray = researchDTO.getQtype().split(",");
	        String[] qtyArray = researchDTO.getQty().split(",");
	        
	        //System.out.println(Arrays.toString(qtyArray)); //[2,3]
	        
	        for (int i = 0; i < qcontArray.length; i++) {
	            ResearchDTO newResearchDTO = new ResearchDTO();
	            newResearchDTO.setRno(researchDTO.getRno()); 
	            newResearchDTO.setQcont(qcontArray[i]);
	            newResearchDTO.setQtype(qtypeArray[i]);
	            newResearchDTO.setQty(qtyArray[i]);
	            researchList.add(newResearchDTO);
	        }//for end
	        
		    int cnt2 = researchdao.researchqInsert(researchList);
		    //System.out.println(cnt2);
		    
		    List<ResearchDTO> qnoList = researchdao.checkQno(rno);

			 // qno 값을 추출하여 배열로 만들어줌
			 int[] qnoArray = qnoList.stream()
			                         .mapToInt(ResearchDTO::getQno)
			                         .toArray(); //[121, 122, 123]
        
			// qtyArray를 정수 배열로 변환
			 int[] qtyIntArray = Arrays.stream(qtyArray)
			                            .mapToInt(Integer::parseInt)
			                            .toArray();
		        
			// qnoArray를 이용하여 qtyIntArray에 따라 qno를 반복해서 추가하는 코드
			 List<Integer> resultQnoList = new ArrayList<>();

			 for (int i = 0; i < qnoArray.length; i++) {
			     int qno = qnoArray[i];
			     int qty = qtyIntArray[i];

			     // qty 값에 따라 qno를 반복해서 리스트에 추가
			     for (int j = 0; j < qty; j++) {
			         resultQnoList.add(qno);
			     }//for end
			 }//for end

			 // 리스트를 배열로 변환
			 int[] resultQnoArray = resultQnoList.stream()
			                                      .mapToInt(Integer::intValue)
			                                      .toArray();

		    // researchc 테이블 insert
		    String[] choiceArray = researchDTO.getChoice().split(",");
		    List<ResearchDTO> researchcList = new ArrayList<>();

		    for (int i = 0; i < resultQnoArray.length; i++) {
		        ResearchDTO newResearchDTO = new ResearchDTO();
		        newResearchDTO.setQno(resultQnoArray[i]);
		        newResearchDTO.setChoice(choiceArray[i]);
		        researchcList.add(newResearchDTO);
		    }

		    int cnt3 = researchdao.researchcInsert(researchcList);

		    ModelAndView mav = new ModelAndView();
		    
		    if (cnt3 != 0) {
		        mav.setViewName("redirect:/research/researchList");
		        //mav.addObject("alertMessage", "설문조사가 등록되었습니다!");
		        return mav;
		    }else {
		    	mav.setViewName("redirect:/research/researchReg");
		    	return mav;
		    }//ir end
		    
		}//researchInsert() end

		
		
		
		
		
		
}//class end









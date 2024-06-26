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
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	//진행중이고 공개된 가장 최신 설문번호 가져오기
	@GetMapping("/checkMaxrno")
	@ResponseBody
	public String checkMaxrno() {
		String rno = researchdao.checkMaxrno();
		return rno;
	}//checkMaxrno end
	
	
	//설문조사 결과 리스트로 가져오기
	@GetMapping("/resultList")
	@ResponseBody
	public List<ResearchDTO> resultList(@RequestParam String rno) {
		
		// DB 데이터를 조회하여 List<ResearchDTO>를 반환 
	    List<ResearchDTO> result = researchdao.checkResult(rno);

		return result;
	}//resultList() end

	
	// 설문조사 내용 가져와 보여주기
	@GetMapping("/researchrList")
	@ResponseBody
	public List<ResearchDTO> researchrList(@RequestParam String rno) {
		
		List<ResearchDTO> list = researchdao.researchrList(rno);
		return list;
		
	}//researchrList() end
		
	
	// 설문 진행 여부를 확인하는 메서드
    private boolean isAfterCurrentDate(String rdate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate researchDate = LocalDate.parse(rdate, formatter);
        LocalDate currentDate = LocalDate.now();
        return currentDate.isAfter(researchDate);
    }//isAfterCurrentDate() end
	
    
	// 설문조사 목록 페이지
	@GetMapping("/researchList")
	public ModelAndView researchList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		mav.addObject("researchList", researchdao.researchList());
		return mav;
	}//researchList() end
	
	
	// 설문조사 페이지 띄어주기
	@GetMapping("/researchForm")
	public ModelAndView researchForm(@RequestParam String rno) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchForm");
		mav.addObject("researchList2", researchdao.researchList2(rno));
		return mav;
	}//researchForm() end
	
	
	//설문조사 질문 개수 가져오기
	@GetMapping("/getTotalQuestions")
	@ResponseBody
	public int getTotalQuestions(@RequestParam String rno) {
		int cnt = researchdao.getQuestions(rno);		
		return cnt;
	}//getTotalQuestions() end
	
	
	// 설문조사 수정 페이지 이동
	@GetMapping("/researchModify")
	public ModelAndView researchModify(@RequestParam String rno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchModify");
		mav.addObject("researchList2", researchdao.researchList2(rno));
		return mav;
	}//researchModify() end
	
	//설문조사 수정
	@PostMapping("/researcfrmhModify")
	public ModelAndView researchfrmModify(@RequestParam ResearchDTO researchdto) {
		
		//System.out.println(researchdto);
		int cnt = researchdao.researchModify(researchdto);
		//System.out.println(cnt);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("research/researchList");
		return mav;
	}//researchModify() end
	
	
	//사용자 확인하여 설문조사 한번만 참여 가능
	@GetMapping("/checkUser")
	@ResponseBody
	public int checkUser(@RequestParam String rno, HttpSession session) {
		
		String uid = (String)session.getAttribute("s_id");
				
		ResearchDTO researchDTO = new ResearchDTO();
		researchDTO.setUid(uid);
		researchDTO.setRno(rno);
		
		int cnt = researchdao.checkUser(researchDTO); 
		
		return cnt;
		
	}//checkUser() end
	
	
	
	//설문조사 답변 Insert (체크박스, 라디오버튼)
	@PostMapping("/researchrcInsert")
	@ResponseBody
	public void researchrcInsert(@RequestBody Map<String, Object> insertData, HttpSession session) {
		
		String uid = (String)session.getAttribute("s_id");
		
		List<Integer> qnoValues = (List<Integer>)insertData.get("qno");
		List<Integer> cnoValues = (List<Integer>)insertData.get("cno");
		
		List<ResearchDTO> researchrcList = new ArrayList<>();
		
		for (int i = 0; i < qnoValues.size(); i++) {
		    ResearchDTO researchDTO = new ResearchDTO();
		    researchDTO.setQno(qnoValues.get(i));
		    researchDTO.setReply(cnoValues.get(i)); //reply에서 선택한 값 확인하기 위해 cnoValues 넣어줌 
		    researchDTO.setUid(uid);
		    // 다른 필요한 속성들도 설정 가능
		    researchrcList.add(researchDTO);
		}
				
		researchdao.researchrcInsert(researchrcList);

		/*
	    // 받은 데이터 확인
	    for (int i = 0; i < qnoValues.size(); i++) {
	        System.out.println("QNO: " + qnoValues.get(i)); //166,166,167,168
	        System.out.println("CNO: " + cnoValues.get(i)); //136,137,138,142

	        // 여기에 데이터 처리 로직 추가...
	    }
	    */    
		
	}//researchInsert() end

	
	// 설문조사 답변 insert
	@PostMapping("/researchrInsert")
	@ResponseBody
	public int researchrInsert(HttpSession session, @RequestBody Map<String, Object> insertData) {
		
		String s_id = (String)session.getAttribute("s_id");
		
		ResearchDTO researchDTO = new ResearchDTO();	
		researchDTO.setUid(s_id);
		
		// 여기서 insertData를 원하는 형태로 사용하면 됩니다.
	    Object qnoObject = insertData.get("qno");
	    Object cnoObject = insertData.get("cno");
		
	    // 각 값이 null이 아닌지 확인 후 ResearchDTO에 설정
	    if (qnoObject != null) {
	        researchDTO.setQno(Integer.parseInt((String)qnoObject));
	    }//if end
	    if (cnoObject != null) {
	        researchDTO.setReply(Integer.parseInt((String)cnoObject));
	    }//if end
	    
		int cnt = researchdao.researchrInsert(researchDTO);
		
		return cnt;
		
	}//researchrList() end
	
	/*
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
 
	  
	*/
	

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

		
		// 설문 결과 페이지 이동
		@GetMapping("/researchResult")
		public ModelAndView researchResult(@RequestParam String rno) {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("research/researchResult");
			mav.addObject("researchList2", researchdao.researchList2(rno));
			mav.addObject("cnt", researchdao.countUid(rno));
			return mav;
		}//researchResult() end
		
		//설문조사 수정
		@PostMapping("/researchModify")
		public String researchModify(ResearchDTO researchDTO) {
			researchdao.researchModify(researchDTO);
			
			return "redirect:/research/researchList";
		}//researchResult() end
		
		//설문조사 삭제
		@PostMapping("/researchDelete")
		public String researchDelete(@RequestParam String rno) {
			researchdao.researchDelete(rno);
			return "redirect:/research/researchList";
		}//researchResult() end
		
		
}//class end






































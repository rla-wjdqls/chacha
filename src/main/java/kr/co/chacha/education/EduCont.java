package kr.co.chacha.education;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/education")
public class EduCont {
	
	public EduCont() {
		System.out.println("-----EduCont() 객체 생성");
	}
	
	@Autowired
    private SqlSession sqlSession;
	 
	@Autowired
	private EduDAO eduDao;
	
	@RequestMapping("/educationList")
	public ModelAndView educationList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/educationList");
		return mav;
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
	
	@GetMapping("/dog")
	public ModelAndView dog() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/dog");
		return mav;
	}
	
	@GetMapping("/dogResult")
	public String dogResult(HttpSession session, EduDTO edudto) {
		
		// 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
	    //String uid = (String) session.getAttribute("s_id");  //사용자 아이디
	    //int applicationNumber = 14;  //신청번호
	    //String lectureType = "강아지"; //강의구분
	    
	    System.out.println(edudto);
	    //int totalScore = (score); 
	    //int score = (int) session.getAttribute("score");
		//Integer score = (Integer) session.getAttribute("score");
		 

	    // Controller 또는 Servlet에서 데이터 처리
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("uid", uid);
	    paramMap.put("eduno", applicationNumber);
	    paramMap.put("eduop", lectureType);
	    paramMap.put("score", score);

	    // MyBatis를 사용하여 DB에 데이터 삽입
	    sqlSession.insert("eduIns", paramMap);
	    //session.setAttribute("score", score);
	    
	    // 리다이렉트 경로 반환
	    return "redirect:/education/dogResult";
	}
	
	/*
	@PostMapping("/dogResult")
	public ModelAndView dogResult(HttpSession session) {
		
		// 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
	    String uid = (String) session.getAttribute("s_id");  //사용자 아이디
	    int applicationNumber = 14;  //신청번호
	    String lectureType = "강아지"; //강의구분
	    
	    //int totalScore = (score); 
	    //int score = (int) session.getAttribute("score");
		Integer score = (Integer) session.getAttribute("score");
		 

	    // Controller 또는 Servlet에서 데이터 처리
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("uid", uid);
	    paramMap.put("eduno", applicationNumber);
	    paramMap.put("eduop", lectureType);
	    paramMap.put("score", score);

	    // MyBatis를 사용하여 DB에 데이터 삽입
	    sqlSession.insert("eduIns", paramMap);
	    //session.setAttribute("score", score);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("education/dogResult");
	    return mav;
	}
	*/
	
	// 현재 날짜를 문자열로 반환하는 메서드
    private String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        return sdf.format(currentDate);
    }
	
	
	
	@GetMapping("/cat")
	public ModelAndView cat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/cat");
		return mav;
	}
	
	/*
	@GetMapping("/catResult")
	public ModelAndView catResult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/catResult");
		return mav;
	}
	*/
	@GetMapping("/catResult")
	public ModelAndView catResult(HttpSession session) {
		
		// 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
	    String uid = (String) session.getAttribute("s_id");  //사용자 아이디
	    int applicationNumber = 11;  //신청번호
	    String lectureType = "고양이"; //강의구분
	    int totalScore = 20; //세션에서 총점 가져오기
	    String currentDate = "2024-01-10";  //현재 날짜를 가져오는 메서드

	    // Controller 또는 Servlet에서 데이터 처리
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("uid", uid);
	    paramMap.put("eduno", applicationNumber);
	    paramMap.put("eduop", lectureType);
	    paramMap.put("score", totalScore);
	    paramMap.put("edu_date", currentDate);

	    // MyBatis를 사용하여 DB에 데이터 삽입
	    sqlSession.insert("eduIns", paramMap);
	    session.setAttribute("score", totalScore);

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("education/catResult");
	    return mav;
	}
	
	

}

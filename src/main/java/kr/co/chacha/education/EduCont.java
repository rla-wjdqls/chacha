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
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping("/dogox")
	public ModelAndView dogox() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/dogox");
		return mav;
	}
	
	@GetMapping("/catox")
	public ModelAndView catox() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/catox");
		return mav;
	}
	
	@GetMapping("/dog")
	public ModelAndView dog() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/dog");
		return mav;
	}
	
	@GetMapping("/dogResult")
	public ModelAndView dogResult() {
		
		 // 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
        String userId = "s_id";  // 사용자 아이디를 어떻게 가져올지에 따라 수정
        int applicationNumber = 2;  // 신청번호를 적절한 방법으로 가져옴
        String lectureType = "강의구분";  // 강의구분을 적절한 방법으로 가져옴
        int totalScore = 20;  // 총점을 적절한 방법으로 가져옴
        String currentDate = "2024-01-10";  // 현재 날짜를 가져오는 메서드

        // Controller 또는 Servlet에서 데이터 처리
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("uid", userId);
        paramMap.put("eduno", applicationNumber);
        paramMap.put("eduop", lectureType);
        paramMap.put("score", totalScore);
        paramMap.put("edu_date", currentDate);

        // MyBatis를 사용하여 DB에 데이터 삽입
        sqlSession.insert("eduIns", paramMap);
        
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/dogResult");
		return mav;
	}
	
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
	
	@GetMapping("/catResult")
	public ModelAndView catResult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("education/catResult");
		return mav;
	}
	
	/*
	@Service
	public class EduServiceImpl implements EduService {

	    private final EduDAO eduDAO;

	    @Autowired
	    public EduServiceImpl(EduDAO eduDAO) {
	        this.eduDAO = eduDAO;
	    }

	    @Override
	    public void saveQuizResults(List<EduDTO> quizResults) {
	        eduDAO.insertQuizResults(quizResults);
	    }
	*/

}

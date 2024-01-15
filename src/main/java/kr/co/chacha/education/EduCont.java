package kr.co.chacha.education;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
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
		public ModelAndView dogResult(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			String uid = (String) session.getAttribute("s_id");
		    
		    EduDTO quizResult = eduDao.getLatestResult(uid); // 데이터베이스에서 최신 결과 조회
		    mav.addObject("quizResult", quizResult);
		    mav.setViewName("education/dogResult");

		    return mav;
		}
		
	@PostMapping("/dogResult")
	public String dogResult(HttpSession session, HttpServletRequest req, Model model, @RequestParam("score") int score) {
		
		String[] answers = new String[10];
	    for (int i = 1; i <= 10; i++) {
	        answers[i-1] = req.getParameter("qd" + i);
	        //System.out.println(answers[i-1]);
	    }
	    
	    // 모델에 사용자 답안 추가
	    model.addAttribute("answers", answers);
		// 사용자가 제출한 답안을 확인
	    
		
	    
	    String uid = (String) session.getAttribute("s_id");
	    String lectureType = "강아지";

	    EduDTO edudto = new EduDTO();
	    edudto.setUid(uid);
	    edudto.setEduop(lectureType);
	    edudto.setScore(score);

	    eduDao.eduIns(edudto);

	    //return "redirect:/education/dogResult";
	    return "education/dogResult";
	}
	
	/*
	// POST 처리 후 리다이렉트될 GET 메서드
    @GetMapping("/dogResult")
    public ModelAndView dogResult(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String uid = (String) session.getAttribute("s_id");

        // 데이터베이스에서 해당 사용자의 최신 퀴즈 결과를 조회
        EduDTO quizResult = eduDao.getLatestResult(uid);
        mav.addObject("quizResult", quizResult); // 결과 객체를 뷰로 전달
        mav.setViewName("education/dogResult"); // 결과 페이지

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
	public ModelAndView catResult(HttpSession session) {
		
		// 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
	    String uid = (String) session.getAttribute("s_id");  //사용자 아이디
	    String lectureType = "고양이"; //강의구분
	    //int totalScore = 20; //세션에서 총점 가져오기
	    Integer score = (Integer) session.getAttribute("score");

	    // Controller 또는 Servlet에서 데이터 처리
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("uid", uid);
	    paramMap.put("eduop", lectureType);
	    paramMap.put("score", score);

	    // MyBatis를 사용하여 DB에 데이터 삽입
	    //sqlSession.insert("eduIns", paramMap);
	    //session.setAttribute("score", score);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("education/catResult");
	    return mav;
	}
	*/
	@GetMapping("/catResult")
	public String catResult(HttpSession session, EduDTO edudto) {
		
		// 여기에 퀴즈 결과 데이터를 처리하는 로직을 추가
	    String uid = (String) session.getAttribute("s_id");  //사용자 아이디
	    String lectureType = "고양이"; //강의구분
	    //int totalScore = 20; //세션에서 총점 가져오기
	    Integer score = (Integer) session.getAttribute("score");

	    // Controller 또는 Servlet에서 데이터 처리
	    //Map<String, Object> paramMap = new HashMap<>();
	    //paramMap.put("uid", uid);
	    //paramMap.put("eduop", lectureType);
	    //paramMap.put("score", score);
	    edudto.setUid(uid);
	    edudto.setEduop(lectureType);
	    edudto.setScore(score);

	    eduDao.eduIns(edudto);
	    
	    return "redirect:/education/catResult";
	}

}

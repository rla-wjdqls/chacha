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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String dogResult(HttpSession session, HttpServletRequest req, @RequestParam("score") int score) {
		

	    String uid = (String) session.getAttribute("s_id");
	    String lectureType = "dog";

	    EduDTO edudto = new EduDTO();
	    edudto.setUid(uid);
	    edudto.setEduop(lectureType);
	    edudto.setScore(score);

	    eduDao.eduIns(edudto);

	    
	    return "/education/dogResult";
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
	public ModelAndView catResult(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String uid = (String) session.getAttribute("s_id");
	    
	    EduDTO quizResult = eduDao.getLatestResult(uid); // 데이터베이스에서 최신 결과 조회
	    mav.addObject("quizResult", quizResult);
	    mav.setViewName("education/catResult");

	    return mav;
	}

	@PostMapping("/catResult")
	public String catResult(HttpSession session, HttpServletRequest req, @RequestParam("score") int score) {
	
    String uid = (String) session.getAttribute("s_id");
    String lectureType = "cat";

    EduDTO edudto = new EduDTO();
    edudto.setUid(uid);
    edudto.setEduop(lectureType);
    edudto.setScore(score);

    eduDao.eduIns(edudto);

    return "/education/catResult";
}


	
}
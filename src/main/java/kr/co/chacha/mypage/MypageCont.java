package kr.co.chacha.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.member.MemberDAO;
import kr.co.chacha.member.MemberDTO;


@Controller
//@RequestMapping("/mypage")
public class MypageCont {

	public MypageCont() {
		System.out.println("----MypageCont()객체 생성됨");
	}//end
	 
	@Autowired
	MypageDAO mypageDao;
	
		
	@GetMapping("/mypage/myList")
	public ModelAndView mypage(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList");
		mav.addObject("myHelpList", mypageDao.myHelp(s_id));
		mav.addObject("myAdoprvList", mypageDao.myAdoprv(s_id));
		return mav;
	}//mypage() end

	
	@GetMapping("/mypage/myAdopt")
	public ModelAndView myAdopt(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myAdopt");
    	mav.addObject("myAdoptList", mypageDao.myAdopt(s_id));
        return mav; 
	}//myAdopt() end
	
	
	@GetMapping("/mypage/myComment")
	public ModelAndView myComment(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myComment");
    	mav.addObject("myCommentList", mypageDao.myComment(s_id));
        return mav; 
	}//myComment() end
	
	
	@GetMapping("/mypage/myInfo1")
	public ModelAndView myinfo1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myInfo1");
		return mav;
	}//myInfo1() end
	
	
	@GetMapping("/mypage/myInfo2")
	public ModelAndView myinfo2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myInfo2");
		return mav;
	}//myInfo2() end

	
	//내강의실
    @RequestMapping("/mypage/myClass")
    public ModelAndView myClassList(HttpSession session) {
    	String s_id = (String)session.getAttribute("s_id");
    	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myClass");
    	mav.addObject("myClassList", mypageDao.myeduList(s_id));
        return mav; 
    }//myClassList() end
 
    
    
    @RequestMapping("/mypage/myService")
    public ModelAndView myServiceList(HttpSession session) {
    	String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myService");
    	mav.addObject("myServiceList", mypageDao.mysvList(s_id));
        return mav; 
    }//myClassList() end
    	
    
	@RequestMapping("/mypage/jjimList")
	public ModelAndView jjimlist(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/jjimList");
    	mav.addObject("myjjimList", mypageDao.jjimList(s_id));
        return mav; 
	}//jjimlist() end

	
	// 비밀번호 일치하면 회원정보 수정 페이지로 이동
	@PostMapping("/mypage/myInfoModify")
	public ModelAndView myInfoModify(HttpServletRequest req, HttpSession session) {

		String s_id = (String)session.getAttribute("s_id"); 
		String s_passwd = (String)session.getAttribute("s_passwd"); 
		//System.out.println(s_passwd); // kim9595 비밀번호
		
		String passwd =	req.getParameter("passwd");
		//System.out.println(passwd); //3454e55~ 세션아이디 비번과 다름
		
		ModelAndView mav = new ModelAndView();
		
		if(s_passwd.equals(passwd)) {
			mav.setViewName("mypage/myInfoModify"); //비밀번호 일치 시 수정 페이지로 이동
			//mav.addObject("myInfo", mypageDao.myInfoCheck(s_id));
		} else {
			mav.setViewName("redirect:/mypage/myInfo1"); //비밀번호 불일치 시 다시 돌아옴
		}//if end
		
		return mav;
	}// myInfoModify() end
	
	

	
	
	// 비밀번호 일치하면 회원탈퇴 페이지로 이동
	@PostMapping("/mypage/myInfoWithdraw")
	public ModelAndView myinfoWithdraw(HttpSession session,HttpServletRequest req) {
		String s_passwd = (String)session.getAttribute("s_passwd"); 
		//System.out.println(s_passwd); // kim9595 비밀번호
		
		String passwd =	req.getParameter("passwd");
		//System.out.println(passwd); //3454e55~ 세션아이디 비번과 다름
		
		ModelAndView mav = new ModelAndView();
		
		if(s_passwd.equals(passwd)) {
			mav.setViewName("mypage/myInfoWithdraw"); //비밀번호 일치 시 수정 페이지로 이동
		} else {
			mav.setViewName("redirect:/mypage/myInfo2"); //비밀번호 불일치 시 다시 돌아옴
		}//if end
		
		return mav;
	}// myinfoWithdraw() end
	
	
	//회원 탈퇴
	@GetMapping("/mypage/memberWithdraw")
	public ModelAndView memberWithdraw(HttpSession session) {
		
	    String s_id = (String) session.getAttribute("s_id");
	    mypageDao.memberWithdraw(s_id); // 실제 회원 탈퇴 메서드 호출 등

	    // 세션 초기화
	    session.invalidate();
		
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("redirect:/");
    	
        return mav; 
		
	}//memberWithdraw() end
	
	
		
	//로그아웃 클릭시 세션 만료
	@RequestMapping("/mypage/logout2")
	public String logout2(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
	}//logout2()
	
	
}//end
























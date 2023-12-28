package kr.co.chacha.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.jjim.JjimDTO;
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
	
	
	//내글목록(관리자)
	@GetMapping("/mypage/myList_a")
	public ModelAndView myList_a(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_a");
		//mav.addObject("myList_a", mypageDao.myList_a(s_id));
		return mav;
	}//myList_b() end
	
	//내글목록(파트너)
	@GetMapping("/mypage/myList_b")
	public ModelAndView myList_b(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_b");
		mav.addObject("myServiceList", mypageDao.myService(s_id));
		return mav;
	}//myList_b() end
	
	
	//내글목록(사용자)
	@GetMapping("/mypage/myList_c")
	public ModelAndView myList_c(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_c");
		mav.addObject("myHelpList", mypageDao.myHelp(s_id));
		mav.addObject("myAdoprvList", mypageDao.myAdoprv(s_id));
		return mav;
	}//myList_c() end
		
	
	@GetMapping("/mypage/myAdopt")
	public ModelAndView myAdopt(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myAdopt");
    	mav.addObject("myAdoptList", mypageDao.myAdopt(s_id));
        return mav; 
	}//myAdopt() end
	
	
	@GetMapping("/mypage/memberAdopt")
	public ModelAndView memAdopt(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/memberAdopt");
    	//mav.addObject("myAdoptList", mypageDao.myAdopt(s_id));
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
    
    
	//회원 강의신청 내역(파트너)
    @RequestMapping("/mypage/memberClass")
    public ModelAndView memClassList(HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/memberClass");
    	mav.addObject("memberClassList", mypageDao.memeduList());
        return mav; 
    }//memClassList() end
 
    
    //봉사신청내역(사용자)
    @RequestMapping("/mypage/myService")
    public ModelAndView myServiceList(HttpSession session) {
    	String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myService");
    	mav.addObject("myServiceList", mypageDao.mysvList(s_id));
        return mav; 
    }//myClassList() end
    
    
    //봉사신청내역(파트너)
    @RequestMapping("/mypage/memberService")
    public ModelAndView serviceList(HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/memberService");
    	mav.addObject("memserviceList", mypageDao.memserviceList());
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
			mav.addObject("myInfo", mypageDao.myInfoCheck(s_id));
		} else {
			mav.setViewName("redirect:/mypage/myInfo1"); //비밀번호 불일치 시 다시 돌아옴
		}//if end
		
		return mav;
	}// myInfoModify() end
	
	
	//수정 버튼 눌러서 폼 제출
	@PostMapping("/mypage/memberModify")
	public ModelAndView memberModify(HttpSession session, HttpServletRequest req) {
		
		String uid = req.getParameter("uid");
		String passwd = req.getParameter("passwd");
		String tel = req.getParameter("tel");
		String birth = req.getParameter("birth");
		String zipcode = req.getParameter("zipcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		MypageDTO mypagedto = new MypageDTO(); 
		
		mypagedto.setUid(uid);
		mypagedto.setPasswd(passwd);
		mypagedto.setTel(tel);
		mypagedto.setBirth(birth);
		mypagedto.setZipcode(zipcode);
		mypagedto.setAddr1(addr1);
		mypagedto.setAddr2(addr2);
		
		mypageDao.memberModify(mypagedto);
		
		ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("redirect:/"); //수행 후 마이페이지로 다시 돌아게 수정할 것
    	
        return mav; 
		
	}//memberModify() end
	

	
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
	@RequestMapping("/mypage/logout")
	public String logout2(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
	}//logout()
	
	
	//찜리스트 삭제
	@PostMapping("/mypage/delete")
	@ResponseBody
	public int jjimDelete(HttpSession session, String anino) {
		String s_id = (String)session.getAttribute("s_id");
		MypageDTO mypagedto = new MypageDTO();
		mypagedto.setAnino(anino);
		mypagedto.setUid(s_id);
		
		int cnt = mypageDao.jjimDelete(mypagedto);
		
		return cnt;
	}//jjimDelete() end
	
	
}//end






















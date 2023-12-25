package kr.co.chacha.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.member.MemberDTO;


@Controller
@RequestMapping("/mypage")
public class MypageCont {

	public MypageCont() {
		System.out.println("----MypageCont()객체 생성됨");
	}//end
	 
	@Autowired
	MypageDAO mypageDao;
	
		
	@GetMapping("/myList")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList");
		return mav;
	}//mypage() end

	
	@GetMapping("/myAdopt")
	public ModelAndView myAdopt() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myAdopt");
    	mav.addObject("myAdoptList", mypageDao.myAdopt());
        return mav; 
	}//myAdopt() end
	
	
	@GetMapping("/myComment")
	public ModelAndView myComment() {
		//String s_id = "kim9595";
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myComment");
    	mav.addObject("myCommentList", mypageDao.myComment());
        return mav; 
	}//myComment() end
	
	
	@GetMapping("/myInfo1")
	public ModelAndView myinfo1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myInfo1");
		return mav;
	}//myInfo1() end
	
	
	@GetMapping("/myInfo2")
	public ModelAndView myinfo2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myInfo2");
		return mav;
	}//myInfo2() end

	
    @RequestMapping("/myClass")
    public ModelAndView myClassList(HttpSession session) {
    	String s_id = "h99999";
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myClass");
    	mav.addObject("myClassList", mypageDao.myeduList(s_id));
        return mav; 
    }//myClassList() end
 
    
    
    @RequestMapping("/myService")
    public ModelAndView myServiceList(HttpSession session) {
    	String s_id = "h99999";
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myService");
    	mav.addObject("myServiceList", mypageDao.mysvList(s_id));
        return mav; 
    }//myClassList() end
    	
	@RequestMapping("/jjimList")
	public ModelAndView jjimlist() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/jjimList");
    	mav.addObject("myjjimList", mypageDao.jjimList());
        return mav; 
	}//jjimlist() end

	
	
	// 비밀번호 일치하면 회원정보 수정 페이지로 이동
	@PostMapping("/myInfoModify")
	public ModelAndView myInfoModify(HttpServletRequest req) {
		
		String passwd =	req.getParameter("passwd");
		//System.out.println(passwd);
		
		int cnt = mypageDao.checkPasswd(passwd); //1
		
		System.out.println(cnt);
		
		ModelAndView mav = new ModelAndView();
		
		if(cnt==1) {
			mav.setViewName("mypage/myInfoModify");
		}//if end

		return mav;
	}// myInfoModify() end
	
		
	
	// 비밀번호 일치하면 회원탈퇴 페이지로 이동
	@PostMapping("/myInfoWithdraw")
	public ModelAndView myinfoWithdraw(HttpServletRequest req) {
		String passwd =	req.getParameter("passwd");
		int cnt = mypageDao.checkPasswd(passwd);
		//System.out.println(cnt);
		
		ModelAndView mav = new ModelAndView();
		
		if(cnt==1) {
			mav.setViewName("mypage/myInfoWithdraw");
		}//if end

		return mav;
	}// myinfoWithdraw() end
	
	
	
	@PostMapping("/memberWithdraw")
	public ModelAndView memberWithdraw(HttpSession session) {
		
		// 여기에 실제 회원 탈퇴 로직 추가
	    String s_id = (String) session.getAttribute("s_id");
	    //System.out.println(s_id); //h99999
	    mypageDao.memberWithdraw(s_id); // 실제 회원 탈퇴 메서드 호출 등

	    // 세션 초기화
	    session.invalidate();
		
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("redirect:/");
    	
        return mav; 
		
	}//memberWithdraw() end
	
	
	
	@PostMapping("/memberModify")
	public ModelAndView memberModify(HttpSession session, HttpServletRequest req) {
		
	    String s_id =  (String)session.getAttribute("s_id");
	    System.out.println(s_id);
	    
	    
	    MemberDTO memberDTO = new MemberDTO();
		
	    String uname = req.getParameter("uname").trim();
	    String email = req.getParameter("email").trim();
	    String tel = req.getParameter("tel").trim();
	    
	    System.out.println(uname);
	    System.out.println(email);
	    System.out.println(tel);
	    		
	    memberDTO.setUname(req.getParameter("uname").trim());
	    memberDTO.setUid(req.getParameter("uid").trim());
	    memberDTO.setEmail(req.getParameter("email").trim());
	    memberDTO.setPasswd(req.getParameter("upassword").trim());
	    memberDTO.setTel(req.getParameter("tel").trim());
	    memberDTO.setBirth(req.getParameter("birth").trim());
	    memberDTO.setZipcode(req.getParameter("zipcode").trim());
	    memberDTO.setAddr1(req.getParameter("addr1").trim());
	    memberDTO.setAddr2(req.getParameter("addr2").trim());
	    
	 
	    
	    
	    
	    
	   // mypageDao.memberModify(memberDTO); // 실제 회원 탈퇴 메서드 호출 등

		
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("redirect:/");
    	
        return mav; 
		
	}//memberWithdraw() end
	
	
		
	//로그아웃 클릭시 세션 만료
	@RequestMapping("/logout2")
	public String logout2(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
	}//logout2()
	
	
}//end
























package kr.co.chacha.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("----MemberCont()객체 생성됨");
	}//end
	
	@Autowired
	MemberDAO memberDao;
	
	//로그인 페이지 이동
	@GetMapping("/loginForm")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}//login() end
	
	
	//로그인 폼 전송
	 @PostMapping("/loginProc")
	 public String loginProc(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberdto, HttpSession session) {
		 
		 //System.out.println(memberdto.getUid());    //kim9595
		 //System.out.println(memberdto.getPasswd());	//dhfdg852@
		 
		 String mlevel = memberDao.loginProc(memberdto);
		 //System.out.println(mlevel); //c
		 
		 //ModelAndView mav = new ModelAndView();
	
		 if(mlevel==null){  //로그인 실패했을 때
			 	System.out.println("로그인 실패");
			 	return "redirect:/member/loginForm";
				//req.setAttribute("message", "<p>아이디/비밀번호가 일치하지 않습니다</p>");
				//req.setAttribute("link", "<a href='javascript:history.back()'>[다시시도]</a>");
		 }else{ 	//로그인 성공했을 때 -> 아이디:kim9595 비밀번호:dhfdg852@
			 
				//다른 페이지에서도 로그인 상태 정보 공유할 수 있도록 session 전역변수에 값 올리기
				session.setAttribute("s_id", memberdto.getUid());
				session.setAttribute("s_passwd", memberdto.getPasswd());
				session.setAttribute("s_mlevel", mlevel);
				
				//세션에 아이디, 비밀번호, 회원등급 저장됨을 확인함 
				//System.out.println(session.getAttribute("s_id"));
				//System.out.println(session.getAttribute("s_passwd"));
				//System.out.println(session.getAttribute("s_mlevel"));
				//session.setMaxInactiveInterval(60 * 30); //세션 유지시간 설정

				//쿠키 시작--------------------------------------------------------------
				String c_id=net.utility.Utility.checkNull(req.getParameter("c_id")); //id저장 클릭
				//System.out.println(c_id); //SAVE
				Cookie cookie = null;
				//System.out.println(memberdto.getUid()); //kim9595
				
				if(c_id.equals("SAVE")){ //ID저장에 체크 했다면
					//쿠키변수 선언 new Cookie("변수명", 값)
					cookie = new Cookie("c_id", memberdto.getUid()); //c_id에 로그인 성공한 아이디 저장됨
					
					//쿠키 생존기간 1개월
					cookie.setMaxAge(60*60*24*30); //각 브라우저의 쿠키 삭제 영향을 받는다				
				}else{
					cookie = new Cookie("c_id", "");
					cookie.setMaxAge(0);
				}//if end
				
				//요청한 사용자 PC에 쿠키값 저장
				resp.addCookie(cookie);								
				
				//쿠키 끝---------------------------------------------------------------
				//mav.setViewName("/index");	
				//System.out.println("로그인 성공");
				return "redirect:/";
		}//if end
 
		 //return mav;  
	 }//loginProc() end 

	 
	
	//회원가입 페이지 이동
	@GetMapping("/signupForm")
	public ModelAndView signupForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/signupForm");
		return mav;
	}//login() end
	
	
	//회원가입 폼전송
	@PostMapping("/insert")
	public String insert(HttpServletRequest req) {
		MemberDTO memberdto = new MemberDTO();
		System.out.println(req.getParameter("uid"));
		System.out.println(req.getParameter("tel"));
		System.out.println(req.getParameter("birth"));
		
		memberdto.setUid(req.getParameter("uid"));
		memberdto.setEmail(req.getParameter("email"));
		memberdto.setUname(req.getParameter("uname"));
		memberdto.setPasswd(req.getParameter("passwd"));
		memberdto.setZipcode(req.getParameter("zipcode"));
		memberdto.setAddr1(req.getParameter("addr1"));
		memberdto.setAddr2(req.getParameter("addr2"));
		memberdto.setTel(req.getParameter("tel"));
		memberdto.setBirth(req.getParameter("birth"));
		
		memberDao.memberInsert(memberdto);
		
		return "redirect:/";
	}//insert() end
	
	
	
	
	
	
	
	
	
}//end

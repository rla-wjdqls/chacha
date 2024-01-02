package kr.co.chacha.member;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.Console;
import java.net.http.HttpHeaders;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("----MemberCont()객체 생성됨");
	}// end

	@Autowired
	MemberDAO memberDao;

	// 로그인 페이지 이동
	@GetMapping("/loginForm")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}// login() end

	// 로그인 폼 전송
	@PostMapping("/loginProc")
	public String loginProc(HttpServletRequest req, HttpServletResponse resp, MemberDTO memberdto,
			HttpSession session) {

		String mlevel = memberDao.loginProc(memberdto);

		if (mlevel == null) { // 로그인 실패했을 때
			//System.out.println("로그인 실패");
			return "redirect:/member/loginForm";
			// req.setAttribute("message", "<p>아이디/비밀번호가 일치하지 않습니다</p>");
			// req.setAttribute("link", "<a href='javascript:history.back()'>[다시시도]</a>");
		} else { // 로그인 성공했을 때 -> 아이디:kim9595 비밀번호:dhfdg852@

			// 다른 페이지에서도 로그인 상태 정보 공유할 수 있도록 session 전역변수에 값 올리기
			session.setAttribute("s_id", memberdto.getUid());
			session.setAttribute("s_passwd", memberdto.getPasswd());
			session.setAttribute("s_mlevel", mlevel);

			// 세션에 아이디, 비밀번호, 회원등급 저장됨을 확인함
			// session.setMaxInactiveInterval(60 * 30); //세션 유지시간 설정

			// 쿠키 시작--------------------------------------------------------------
			String c_id = net.utility.Utility.checkNull(req.getParameter("c_id")); // id저장 클릭
			// System.out.println(c_id); //SAVE
			Cookie cookie = null;
			// System.out.println(memberdto.getUid()); //kim9595

			if (c_id.equals("SAVE")) { // ID저장에 체크 했다면
				// 쿠키변수 선언 new Cookie("변수명", 값)
				cookie = new Cookie("c_id", memberdto.getUid()); // c_id에 로그인 성공한 아이디 저장됨

				// 쿠키 생존기간 1개월
				cookie.setMaxAge(60 * 60 * 24 * 30); // 각 브라우저의 쿠키 삭제 영향을 받는다
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
			} // if end

			// 요청한 사용자 PC에 쿠키값 저장
			resp.addCookie(cookie);

			// 쿠키 끝---------------------------------------------------------------
			return "redirect:/";
		} // if end

		// return mav;
	}// loginProc() end

	
	
    @GetMapping("/navercallback")
    public String naverCallbackGet() {
        return "member/loginForm";
    }//naverCallbackGet() end
    

	
	//네이버 로그인
	@PostMapping("/navercallback")
	@ResponseBody
	public String navercallbackPost(@RequestBody MemberDTO memberdto, HttpSession session,
			HttpServletRequest req, HttpServletResponse resp) {
		
		// JSON 형식으로 응답
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

		// AJAX 요청에서 받은 데이터 처리
		//콜백에서 받아온 정보 가져오기
		String s_email = memberdto.getS_email(); 
		String s_uname = memberdto.getS_uname();
		
		//dto에 필요한 값 담기 
		memberdto.setS_email(s_email);
		memberdto.setS_uname(s_uname);
		
		//세션로그인 테이블에 회원정보 있는지 확인
		String s_mlevel  = String.valueOf(memberDao.naverCheck(memberdto));
		//System.out.println(s_mlevel); //"1"
		
		if("c".equals(s_mlevel)) {
			session.setAttribute("s_id", s_email);
			session.setAttribute("s_mlevel", s_mlevel);
			
	        return "{\"result\": \"c\"}";
			
		}else {
			memberDao.naverInsert(memberdto);
			
			session.setAttribute("s_id", s_email);
			session.setAttribute("s_mlevel", s_mlevel);
			
			return "{\"result\": \"c\"}";
			
		}//if end
		
	}//navercallbackPost() end
    
	
	
    @GetMapping("/kakaocallback")
    public String kakaoLogin() {
        return "member/loginForm";
    }//kakaoLogin() end
	
	
	//카카오 로그인
	@PostMapping("/kakaocallback")
	@ResponseBody
	public String kakaocallbackPost(@RequestBody MemberDTO memberdto, HttpSession session,
			HttpServletRequest req, HttpServletResponse resp) {
		
		//사용자 정보 받아오기(이름, 이메일)
		
		// JSON 형식으로 응답
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

		// AJAX 요청에서 받은 데이터 처리
		//콜백에서 받아온 정보 가져오기
		String s_email = memberdto.getS_email(); 
		String s_uname = memberdto.getS_uname();
		
		//dto에 필요한 값 담기 
		memberdto.setS_email(s_email); //rla-wjdqls@daum.net
		memberdto.setS_uname(s_uname); //김정빈
		
		//세션로그인 테이블에 회원정보 있는지 확인
		String s_mlevel  = String.valueOf(memberDao.kakaoCheck(memberdto));
		//System.out.println(s_mlevel); //"1"   null
		
		if("c".equals(s_mlevel)) {
			session.setAttribute("s_id", s_email);
			session.setAttribute("s_mlevel", s_mlevel);
			
	        return "{\"result\": \"c\"}";
			
		}else { //소셜멤버 테이블에 정보 없을 시 insert -> 확인 완료
			memberDao.kakaoInsert(memberdto);
			
			session.setAttribute("s_id", s_email);
			session.setAttribute("s_mlevel", s_mlevel);
			
			return "{\"result\": \"c\"}";
			
		}//if end
		
	}//kakaocallbackPost() end
    
    
    
    
    
    
	// 아이디 찾기 페이지 이동
	@GetMapping("/findID")
	public ModelAndView findID() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findID");
		return mav;
	}// findID() end
	
	
	// 입력한 정보가 db 데이터와 일치 할 경우, 아이디 확인 페이지 이동 
	// 입력한 정보가 db 데이터와 불일치 할 경우, 아이디  
	
	@PostMapping("/findIDResult")
	public ModelAndView findIDResult(HttpServletRequest req) {
		
	    String uname = req.getParameter("uname").trim();
	    String email = req.getParameter("email").trim();
	    String birth = req.getParameter("birth").trim();
		
		MemberDTO memberdto = new MemberDTO();
		
		//memberdto에 입력 값 담기 
		memberdto.setUname(uname);
		memberdto.setEmail(email);
		memberdto.setBirth(birth);
		
		ModelAndView mav = new ModelAndView();
		
		//db 데이터와 입력값이 일치하면 해당하는 아이디 찾아오기
		String uid = memberDao.findID(memberdto);
		
		// uid를 ModelAndView에 추가
	    mav.addObject("uid", uid);
		
		mav.setViewName("member/findIDResult");
		return mav;
	}// findIDResult() end
	
	

	// 비밀번호 찾기 페이지 이동
	@GetMapping("/findPasswd")
	public ModelAndView findPasswd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findPasswd");
		return mav;
	}// findPasswd() end

	
	// 비밀번호 확인 페이지 이동
	@PostMapping("/findPasswdResult")
	public ModelAndView findPasswdResult(HttpServletRequest req) {
		
	    String uid = req.getParameter("uid").trim();
	    String email = req.getParameter("email").trim();
	    String birth = req.getParameter("birth").trim();
		
		MemberDTO memberdto = new MemberDTO();
		
		//memberdto에 입력 값 담기 
		memberdto.setUid(uid);
		memberdto.setEmail(email);
		memberdto.setBirth(birth);
		
		ModelAndView mav = new ModelAndView();
		
		//db 데이터와 입력값이 일치하면 해당하는 아이디 찾아오기
		String passwd = memberDao.findPasswd(memberdto);
		
		// uid를 ModelAndView에 추가
	    mav.addObject("passwd", passwd);
		
		mav.setViewName("member/findPasswdResult");
		return mav;
	}// findPasswdResult() end
	
	
	// 회원가입 페이지 이동
	@GetMapping("/signupForm")
	public ModelAndView signupForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/signupForm");
		return mav;
	}// login() end
	
	
	@GetMapping("idjbcheck")
	public String idCheckForm() {
		return "/member/signupForm";
	}//idCheckForm() end
	
	
	@PostMapping("idjbcheck")
	@ResponseBody
	public String idjbCheck(HttpServletRequest req) {
		String uid = req.getParameter("uid").trim();
		
		//db 확인 
		//int -> string 
		String cnt =String.valueOf(memberDao.idCheck(uid)); //중복 아이디가 있으면 1->"1" 없으면 0->"0"
		
		//JSON 응답----------------------------------------------------------
		//https://mvnrepository.com에서 json-simple검색후, pom.xml에 의존성 추가해야 함
		JSONObject json = new JSONObject();
		json.put("count", cnt); //key, value
		return json.toString();
	}//idjbCheck() end
	
	
	@PostMapping("emailjbcheck")
	@ResponseBody
	public String emailjbCheck(HttpServletRequest req) {
		String email = req.getParameter("email").trim();
		String cnt =String.valueOf(memberDao.emailCheck(email));
		
		JSONObject json = new JSONObject();
		json.put("count", cnt); //key, value
		return json.toString();
	}//emailjbCheck() end
	

	// 입력 아이디,이메일 db 데이터 중복 확인 후 회원가입 폼전송
	@PostMapping("/insert")
	public String insert(HttpServletRequest req) {
		String uid = req.getParameter("uid");
		String email = req.getParameter("email");
		
		int cnt_uid = memberDao.idCheck(uid);
		int cnt_email = memberDao.emailCheck(email);
		
		MemberDTO memberdto = new MemberDTO();

		memberdto.setUid(req.getParameter("uid"));
		memberdto.setEmail(req.getParameter("email"));
		memberdto.setUname(req.getParameter("uname"));
		memberdto.setPasswd(req.getParameter("passwd"));
		memberdto.setZipcode(req.getParameter("zipcode"));
		memberdto.setAddr1(req.getParameter("addr1"));
		memberdto.setAddr2(req.getParameter("addr2"));
		memberdto.setTel(req.getParameter("tel"));
		memberdto.setBirth(req.getParameter("birth"));

		//System.out.println(memberdto.toString());
		memberDao.memberInsert(memberdto);
		

		return "redirect:/";
	}// insert() end

	
		


	
	
    
	
	
	
	
	
	
	
	
	
	



}// end

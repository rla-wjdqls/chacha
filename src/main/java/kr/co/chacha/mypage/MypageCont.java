package kr.co.chacha.mypage;

import java.awt.PageAttributes.MediaType;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.iamport.iamportCont;
import kr.co.chacha.jjim.JjimDTO;
import kr.co.chacha.member.MemberDAO;
import kr.co.chacha.member.MemberDTO;
import kr.co.chacha.research.ResearchDTO;
import kr.co.chacha.service.ServiceDTO;

@Controller
//@RequestMapping("/mypage")
public class MypageCont {
	
	public MypageCont() {
		System.out.println("----MypageCont()객체 생성됨");
	}//end
	 
	@Autowired
	MypageDAO mypageDao;
	
	@Autowired
	iamportCont iamportcont;
	
	private RestTemplate restTemplate=new RestTemplate();
    private HttpHeaders headers=new HttpHeaders();
    private JSONObject body=new JSONObject();
	
	
	//내글목록(관리자)
	@GetMapping("/mypage/myList_a")
	public ModelAndView myLista(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_a");
		mav.addObject("myList_a", mypageDao.myLista(s_id));
		return mav;
	}//myLista() end
	
	//내글목록(파트너)
	@GetMapping("/mypage/myList_b")
	public ModelAndView myList_b(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		System.out.println(s_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_b");
		mav.addObject("myServiceList", mypageDao.myService(s_id));
		return mav;
	}//myList_b() end
	
	
	//내글목록(사용자)
	@GetMapping("/mypage/myList_c")
	public ModelAndView myList_c(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		
		int helpPost = mypageDao.helpPost(s_id);	
		int adoprvPost = mypageDao.adoprvPost(s_id);	
		
		int totalPost = helpPost + adoprvPost;
		String totlaPost = String.valueOf(totalPost);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myList_c");
		mav.addObject("myHelpList", mypageDao.myHelp(s_id));
		mav.addObject("myAdoprvList", mypageDao.myAdoprv(s_id));
		//mav.addObject("myListc", mypageDao.myListc(s_id));
		mav.addObject("totalPost", totalPost);
		return mav;
	}//myList_c() end
	
	
	@GetMapping("/mypage/myAdopt")
	public ModelAndView myAdopt(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myAdopt");
    	mav.addObject("myAdoptList", mypageDao.myAdopt(s_id));
    	mav.addObject("myAdoptList1", mypageDao.myAdopt1(s_id));
        return mav; 
	}//myAdopt() end
	
	
	@GetMapping("/mypage/memberAdopt")
	public ModelAndView memAdopt(HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/memberAdopt");
    	mav.addObject("memAdoptList", mypageDao.memAdopt());
        return mav; 
	}//myAdopt() end
	
	
	@GetMapping("/mypage/myComment")
	public ModelAndView myComment(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		
		int comment = mypageDao.commentCnt(s_id);
		String totalComment = String.valueOf(comment);
		
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("mypage/myComment");
    	mav.addObject("myCommentList", mypageDao.myComment(s_id));
    	mav.addObject("totalComment", totalComment);
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
    
    
    //봉사취소 
  	@GetMapping("/mypage/srvDelete")
  	@ResponseBody
  	public String srvDelete(String uid, String sano) {
  		
  		int sano_i = Integer.valueOf(sano); 
  		
  		System.out.println(uid);       //kim9595
  		System.out.println(sano_i); //F
  		
  		MypageDTO mypageDTO = new MypageDTO();
  		mypageDTO.setUid(uid);
  		mypageDTO.setSano(sano_i);
  		
  		//mypageDao.srvDelete(mypageDTO);
  		
  		return "success";
  	}//srvDelete() end
    
  
    
    
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
	
	
	//회원관리(관리자)
	@GetMapping("/mypage/memList")
	public ModelAndView memList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/memList");
		mav.addObject("memberList", mypageDao.memList());
		mav.addObject("smemberList", mypageDao.smemList());
		return mav;
	}//memList() end
	
	
	//회원정보 수정(관리자)
	@GetMapping("/mypage/memListModify")
	@ResponseBody
	public String memListModify(String uid, String mlevel) {
		//System.out.println(uid);	//kim9595
		//System.out.println(mlevel); //c
		
		MypageDTO mypageDTO = new MypageDTO();
		mypageDTO.setUid(uid);
		mypageDTO.setMlevel(mlevel);
		
		mypageDao.updateMlevel(mypageDTO);
		
		return "success";
	}//memListModify() end

	
	//입양신청내역 수정(관리자)
	@GetMapping("/mypage/memAdoptModify")
	@ResponseBody
	public String memAdotModify(String uid, String sub_state) {
		//System.out.println(uid);       //kim9595
		//System.out.println(sub_state); //F
		
		MypageDTO mypageDTO = new MypageDTO();
		mypageDTO.setUid(uid);
		mypageDTO.setSub_state(sub_state);
		
		mypageDao.updateSubstate(mypageDTO);
		
		return "success";
	}//memAdotModify() end
	
	
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
	
	
	// 소셜로그인 회원탈퇴 페이지로 이동
	@GetMapping("/mypage/s_myInfoWithdraw")
	public ModelAndView s_myinfoWithdraw() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/s_myInfoWithdraw"); //비밀번호 일치 시 수정 페이지로 이동
		
		return mav;
	}//s_myinfoWithdraw() end
	
	
	
	//일반 회원 탈퇴
	@GetMapping("/mypage/memberWithdraw")
	public ModelAndView memberWithdraw(HttpSession session) {
		
	    String s_id = (String) session.getAttribute("s_id");
	    mypageDao.memberWithdraw(s_id); 

	    // 세션 초기화
	    session.invalidate();
		
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("redirect:/");
    	
        return mav; 
	}//memberWithdraw() end
	
	
	
	//소셜로그인 회원 탈퇴
	@PostMapping("/mypage/s_memberWithdraw")
	public ModelAndView smemberWithdraw(HttpSession session) {
		
	    String s_id = (String) session.getAttribute("s_id");
	    
	    mypageDao.smemberWithdraw(s_id);	

	    // 세션 초기화
	    session.invalidate();
		
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("redirect:/");
    	
        return mav; 
		
	}//smemberWithdraw() end
	
		
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
	
	
	//결제 버튼 클릭 시 주문번호 생성
	@GetMapping("/mypage/payNum")
	@ResponseBody
	public Map<String, String> payNum(HttpSession session) {
	
	Map<String, String> response = new HashMap<>();
	String s_id = (String)session.getAttribute("s_id");
	mypageDao.myInfoCheck(s_id); //이메일,이름,전화번호
	
	//MypageDTO mypagedto = new MypageDTO(); null값 출력
	MypageDTO mypagedto = mypageDao.myInfoCheck(s_id); // 이메일, 이름, 전화번호를 가진 객체를 리턴받음
	
	String buyer_email = mypagedto.getEmail();
	String buyer_name = mypagedto.getUname();
	String buyer_tel = mypagedto.getTel();
	
	//주문서 번호 생성하기
	
	//오늘날짜 및 현재시각을 문자열 "년월일시분초"로 구성해서 반환하기
	//->예)20231123143615
	SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
	String date = sd.format(new Date());
	String payno = "p" + date;
	//System.out.println(payno); //결제버튼 누르면 출력 p20240102221606
	
	// 응답 데이터 설정
    response.put("buyer_email", buyer_email);
    response.put("buyer_name", buyer_name);
    response.put("buyer_tel", buyer_tel);
    response.put("payno", payno);

    return response;
	
	}//payNum() end

	
	@PostMapping("/mypage/payUpdate")
	@ResponseBody
	public Map<String, String> payUpdate(HttpSession session){
		
		//System.out.println("111");
		//String imp_uid = requestBody.get("imp_uid");
	    //System.out.println(imp_uid);
	    
	    String s_id = (String) session.getAttribute("s_id");
	    
	    //MypageDTO mypageDTO = new MypageDTO();
	    
	    //payment, adopt 테이블 update
        mypageDao.payUpdate(s_id);
        mypageDao.adoptUpdate(s_id);
   
        Map<String, String> response = new HashMap<>();
        response.put("result", "success");
        
	    return response;
	    
	}//payUpdate() end
	
	
	// 환불 
 	@PostMapping("/mypage/cancelPay")
	@ResponseBody
	public Map<String, Object> cancelPay(@RequestBody Map<String, Object> params) throws IOException {
 	    // 전달받은 데이터 확인
 	    String imp_uid = (String) params.get("imp_uid"); 
 	    int amount = (int) params.get("amount");		 
 	    
 	    //System.out.println(imp_uid); //imp_620437863810
 	    //System.out.println(amount);  //100
 		
	    // 액세스 토큰 얻기
	    String access_token = iamportcont.getToken();
	    //System.out.println(access_token);
	    //{access_token=7ea99df1f09e16a5bd5c864c90aa9e00e2c54091, now=1.705501237E9, expired_at=1.705503037E9}
	    
	    Map<String, Object> responseMap = new HashMap<>();
		
	    try {
	    	if(access_token == null) {
	    		throw new Exception();
	    	}
	    	
	    	headers.clear();
	    	headers.add("Authorization", access_token);
	    	body.clear();
	    	body.put("imp_uid", imp_uid);
	    	body.put("checksum", amount);
	    	body.put("amount", amount);

	    	HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
	        
	        ResponseEntity<Map> responseEntity = restTemplate.postForEntity("https://api.iamport.kr/payments/cancel", entity, Map.class);
	        
	        HttpStatus statusCode = (HttpStatus) responseEntity.getStatusCode();
	        
	        if (statusCode.is2xxSuccessful()) {
	            responseMap.put("status", "success");
	            responseMap.put("message", "환불 성공");
	        } else {
	            responseMap.put("status", "error");
	            responseMap.put("message", "환불 실패");
	        }
	    } catch (Exception e) {
	        responseMap.put("status", "error");
	        responseMap.put("message", e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return responseMap;
	    
		} // cancelPay() ends 

 	
 	//결제상태 변경
 	@GetMapping("/mypage/updatePayop")
 	public String updatePayop(@RequestParam("uid") String uid) {
 	// 전달받은 데이터 확인
 	//System.out.println(uid); //kim9595
 		
 	mypageDao.updatePayop(uid);
 		
 		
 	return "success";
 	
 	}//updatePayop() end
 	
 	
	
	//페이징+검색
	@RequestMapping("/searchList")
	public ModelAndView searchList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword, HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		
		ModelAndView mav = new ModelAndView();

		int currentPage = (page != null) ? page : 1;
		int helpPost = mypageDao.helpPost(s_id);	
		int adoprvPost = mypageDao.adoprvPost(s_id);	
		int totalCount = helpPost + adoprvPost;
		int boardLimit = 10; // 한 화면에 출력할 게시물 수
		int naviLimit = 5; // 한 화면에 출력할 게시판 페이지 수
		int maxPage; // 게시판의 총 페이지 수
		int startNavi; // 한 화면에 출력되는 게시판 페이지의 첫번째 번호
		int endNavi; // 한 화면에 출력되는 게시판 페이지의 마지막 번호

		maxPage = (int) ((double) totalCount / boardLimit + 0.9);
		startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;

		if (maxPage < endNavi) {
			endNavi = maxPage;
		}

		MypageDTO mypageDTO = new MypageDTO();

		List<MypageDTO> searchList = mypageDao.searchList(currentPage, boardLimit, type, keyword, session);

		if (!searchList.isEmpty()) {
			mav.addObject("startNavi", startNavi);
			mav.addObject("endNavi", endNavi);
			mav.addObject("maxPage", maxPage);
			mav.addObject("searchList", searchList);
		}

		mav.setViewName("mypage/myList_c");
		if (!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			mav.addObject("type", type);
			mav.addObject("keyword", keyword);
		}
		return mav;
	}// searchList() end
	
	
}//class end
	



	
	

	
	
	























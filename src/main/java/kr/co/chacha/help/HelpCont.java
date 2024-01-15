package kr.co.chacha.help;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.service.ServiceDTO;


@Controller
@RequestMapping("/help")
public class HelpCont {
	
	public HelpCont() {
		System.out.println("-----HelpCont() 객체 생성");
	}//HelpCont() end
	
	@Autowired
	private HelpDAO helpDAO;
	
	@RequestMapping("/helpList")
	public ModelAndView helpList(
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="type", required=false) String type,
			@RequestParam(value="keyword", required=false) String keyword
			) {
		
		
		ModelAndView mav = new ModelAndView();
		
		int currentPage = (page != null) ? page: 1;
		int totalCount = helpDAO.helpListCnt();
		int boardLimit = 10; //한 화면에 출력할 게시물 수
		int naviLimit = 5; //한 화면에 출력할 게시판 페이지 수
		int maxPage; //게시판의 총 페이지 수 
		int startNavi; //한 화면에 출력되는 게시판 페이지의 첫번째 번호
		int endNavi; //한 화면에 출력되는 게시판 페이지의 마지막 번호
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi=startNavi+naviLimit-1;
		
		if(maxPage<endNavi) {
			endNavi = maxPage;
		}
		
		HelpDTO dto = new HelpDTO();
		
		List<HelpDTO> helpList = helpDAO.helpList(currentPage, boardLimit, type, keyword);
		
		if(!helpList.isEmpty()) {
			mav.addObject("startNavi",startNavi);
			mav.addObject("endNavi",endNavi);
			mav.addObject("maxPage",maxPage);
			mav.addObject("helpList",helpList);
		}
		
		mav.setViewName ("help/helpList");
		if(!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			mav.addObject("type",type);
			mav.addObject("keyword",keyword);
		}
		return mav;
	}
	
	
	
	@GetMapping("/helpForm")
	public ModelAndView helpForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/helpForm");
		return mav;
	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
						 @RequestParam(name="img") MultipartFile img,
						 HttpServletRequest req,
						 HttpSession session) {
		String helppic="-";
		if(img != null && !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
			helppic=img.getOriginalFilename();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
				img.transferTo(new File(path + File.separator + helppic)); //파일저장
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		map.put("helppic", helppic);
		String uid=(String)session.getAttribute("s_id");
		map.put("uid", uid);
		
		helpDAO.insert(map);
		return "redirect:/help/helpList";
	
	}//insert() end

	/*
	@PostMapping("/helpForm")
	public ModelAndView helpIns(HelpDTO helpdto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sid = session.getAttribute("s_id").toString();
		//System.out.println("세션값 확인 : " + sid); 세션값 가져오는 거 확인되고 로그 찌겪혀으니까 확실한거 확인
		helpdto.setUid(sid);
		helpDAO.insert(helpdto);
		mav.setViewName("redirect:/help/helpList");		
		return mav;
	} */
	
	//상세 페이지
	@GetMapping("/helpDetail")
    public ModelAndView helpd(int textno, HttpServletRequest request) {
    	ModelAndView mav = new ModelAndView();
    	HttpSession session = request.getSession(); // 세션 객체를 가져옴
    	mav.setViewName("help/helpDetail");
    	
    	// 조회수 증가
    	helpDAO.increaseViewCount(textno);
	    // 세션에서 조회한 게시물 ID 목록을 가져옴
        Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
        if (viewedPosts == null) {
            viewedPosts = new HashSet<>();
        }

        // 게시물을 이전에 조회하지 않았다면 조회수 증가
        if (!viewedPosts.contains(textno)) {
        	helpDAO.increaseViewCount(textno);
            viewedPosts.add(textno);
            session.setAttribute("viewedPosts", viewedPosts);
        }

    	mav.addObject("helpd", helpDAO.detail(textno));
    	return mav;
    }
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end

	// 게시물 수정
		@GetMapping("/helpUpdate")
		public ModelAndView helpUpdate(int textno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("help/helpUpdate");
			mav.addObject("helpup", helpDAO.detail(textno));
			return mav;
			
		}
		
		@PostMapping("/helpUpdate")
		public ModelAndView helpUpdate(HelpDTO helpdto) {
			ModelAndView mav = new ModelAndView();
			helpDAO.update(helpdto);
			mav.setViewName("redirect:/help/helpList");		
			return mav;
		}
		
		@PostMapping("/helpDelete")
		public ModelAndView helpDelete(int textno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/help/helpList");
			helpDAO.delete(textno);
			return mav;		
		}
		
		
		/*
		@PostMapping("/helpUpdate")
		public ModelAndView helpUpdate(@ModelAttribute HelpDTO dto, HttpServletRequest req) {
			
			//기존에 저장된 정보를 가져오기
			HelpDTO oldDTO = HelpDAO.detail(dto.getTextno());
			
			////////////////////////////////////////////////////////
			//파일을 수정할 것인지?
			
			
			//1) 
			MultipartFile img=dto.getHelppic();
			if(img != null && img.getSize() > 0) { //새로운 포스터 파일이 첨부되어 전송되었는지?
				//신규로 전송된 파일 저장
				ServletContext application = req.getServletContext();
				String basePath = application.getRealPath("/storage");
				String helppic = UploadSaveManager.saveFileSpring30(img, basePath);
				//신규로 전송된 파일명 dto에 담기
				dto.setHelppic(helppic);
			}else {
				//포스터 파일은 수정하지 않은 경우
				dto.setHelppic(oldDTO.getHelppic());  //기존에 저장된 파일명
			}//if end
		}
		*/
		
		// 세션에서 로그인 정보를 가져오는 메서드
		private boolean isLoggedIn(HttpServletRequest request) {
		    HttpSession session = request.getSession();
		    return session.getAttribute("uid") != null; // "uid=loggedInUser"는 로그인된 사용자 정보를 담고 있는 세션 속성 이름
		}
		
		@WebServlet("/login")
		public class LoginServlet extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        // 사용자 아이디와 비밀번호를 확인하는 로직 (이 부분은 실제 로그인 로직으로 대체되어야 합니다)

		        // 로그인이 성공했다고 가정하고 세션에 사용자 정보를 저장
		        String loggedInUser = "s_id"; // 실제로는 데이터베이스에서 가져오거나 로그인 정보를 확인하는 과정이 있어야 합니다.

		        // 세션에 사용자 정보를 저장
		        HttpSession session = request.getSession();
		        session.setAttribute("uid", loggedInUser);

		        // 로그인 후 리다이렉트 등의 로직 수행
		        response.sendRedirect("/index"); // 로그인 후 이동할 페이지로 설정
		    }
		}//login end
		
		
		
		
		
		
		
	
}

package kr.co.chacha.help;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
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
	public ModelAndView helpList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/helpList");
		mav.addObject("helpList",helpDAO.helpList());
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
    public ModelAndView helpd(int textno) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("help/helpDetail");
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
		
		
	
}

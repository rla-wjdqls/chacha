package kr.co.chacha.help;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
						 HttpServletRequest req) {
		String helppic="-";
		if(img != null || !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
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
		
		helpDAO.insert(map);
		return "redirect:/help/helpList";
	
	}//insert() end
	
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
	
}

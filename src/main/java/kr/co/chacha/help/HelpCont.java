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

@Controller
@RequestMapping("/help")
public class HelpCont {
	
	public HelpCont() {
		System.out.println("-----HelpCont() 객체 생성");
	}//HelpCont() end
	
	@Autowired
	private HelpDAO helpDAO;
	
	@RequestMapping("/helpList")
	public ModelAndView helpList2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("help/helpList");
		mav.addObject("helpList2",helpDAO.helpList2());
		return mav;
	}
	
	
	
	@GetMapping("/helpForm")
	public String helpForm() {
		return "help/helpForm";
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
	@GetMapping("/helpdetail")
    public ModelAndView helpd(int sno) {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("help/helpdetail");
    	mav.addObject("helpd", helpDAO.detail(sno));
    	return mav;
    }
	
}

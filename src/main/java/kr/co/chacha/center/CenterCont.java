package kr.co.chacha.center;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/center")
public class CenterCont {
	
	public CenterCont() {
		System.out.println("----CenterCont() 객체 생성");
	}//CenterCont() end
	
	@Autowired
	private CenterDAO centerDao;
	
	@GetMapping("/centerinfo") //보호소 소개
	public ModelAndView centerInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerinfo");
		return mav;
	}
	
	@GetMapping("/centerForm") //입양가능 동물 목록
	public ModelAndView centerForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerForm");
		return mav;
	}
	
	@GetMapping("/centerWrite") //동물 추가 페이지
	public String write() {
		return "center/centerWrite";
	}
	
	@GetMapping("/detail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/detail");
		return mav;
	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
						 @RequestParam MultipartFile img,
						 HttpServletRequest req) {
		String filename="-";
		if(img != null && img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
			filename=img.getOriginalFilename();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
				img.transferTo(new File(path + "\\" + filename)); //파일저
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		map.put("filename", filename);
		
		centerDao.insert(map);
		return "redirect:/center/centerForm";
	}
			
}

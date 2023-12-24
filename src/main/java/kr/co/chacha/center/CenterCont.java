package kr.co.chacha.center;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
		mav.addObject("form", centerDao.form());
		return mav;
	}
	
	@GetMapping("/centerWrite") //동물 추가 페이지
	public String write() {
		return "center/centerWrite";
	}
	
//	@GetMapping("/detail")
//	public ModelAndView detail() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("center/detail");
//		return mav;
//	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
						 @RequestParam(name="img") MultipartFile img,
						 HttpServletRequest req) {
		String anipic="-";
		//System.out.println(img);
		//System.out.println(anipic);
		//System.out.println(img.getOriginalFilename());
		if(img != null || !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
			anipic=img.getOriginalFilename();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
				img.transferTo(new File(path + File.separator + anipic)); //파일저장
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		map.put("anipic", anipic);
		
		centerDao.insert(map);
		return "redirect:/center/centerForm";
	}
	
	@GetMapping("/detail")
	public ModelAndView detail(String anino) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/detail");
		mav.addObject("center", centerDao.detail(anino));
		return mav;
		
	}
	
	@PostMapping("/centerUpdate")
	public ModelAndView updateForm(String anino) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/centerUpdate");
		mav.addObject("center", centerDao.detail(anino));
		return mav;
	}
	
	@PostMapping("update")
	public String update(@RequestParam Map<String, Object> map,
						 @RequestParam(name="img") MultipartFile img,
					     HttpServletRequest req) {
		String anipic="-";
		if(img != null || !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
			anipic=img.getOriginalFilename();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
				img.transferTo(new File(path + File.separator + anipic)); //파일저장
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		map.put("anipic", anipic);
		centerDao.update(map);
		
		return "redirect:/center/centerForm";
		}
	
//}else {
//	String anino = map.get("anino").toString();
//	//System.out.println(anino);
//	anipic=centerDao.anipic(anino);
	
	@PostMapping("delete")
	public String delete(HttpServletRequest req) {
		String anino=req.getParameter("anino");
		
		String anipic=centerDao.anipic(anino);
		
		if(anipic != null && anipic.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");
			File file = new File(path + File.separator + anipic);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end
		centerDao.delete(anino);
		
		return "redirect:/center/centerForm";
	}
			
}

package kr.co.chacha.adopt;

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
import kr.co.chacha.help.HelpDTO;

@Controller
@RequestMapping("/adopt")
public class AdoptCont {
	
	public AdoptCont() {
		System.out.println("-----AdoptCont() 객체 생성");
	}//CenterCont() end
	
	@Autowired
	private AdoptDAO adoptDAO;
	
	@RequestMapping("/adoptReview")
	public ModelAndView adoptReview() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adopt/adoptReview");
		mav.addObject("adoptReview", adoptDAO.adoptReview());
		return mav;
	}
	
	@GetMapping("/adoptForm")
	public ModelAndView adoptForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adopt/adoptForm");
		return mav;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
						 @RequestParam(name="arimg") MultipartFile img,
						 HttpServletRequest req,
						 HttpSession session) {
		String arimg="-";
		if(img != null && !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
			arimg=img.getOriginalFilename();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
				img.transferTo(new File(path + File.separator + arimg)); //파일저장
			}catch(Exception e) {
				System.out.println(e);
			}//try end
		}//if end
		
		map.put("arimg", arimg);
		String uid=(String)session.getAttribute("s_id");
		map.put("uid", uid);
		
		adoptDAO.insert(map);
		return "redirect:/adopt/adoptReview";
	
	}
	
		//상세 페이지
		@GetMapping("/adoptDetail")
	    public ModelAndView adoptd(int arno) {
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("adopt/adoptDetail");
	    	mav.addObject("adoptd", adoptDAO.detail(arno));
	    	return mav;
	    }
		
		@PostMapping("/adoptDelete")
		public ModelAndView adoptDelete(int arno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/adopt/adoptReview");
			adoptDAO.delete(arno);
			return mav;
			
		}
		
		// 게시물 수정
		@GetMapping("/adoptUpdate")
		public ModelAndView adoptUpdate(int arno) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adopt/adoptUpdate");
			mav.addObject("adoptup", adoptDAO.detail(arno));
			return mav;
			
		}
		
		@PostMapping("/adoptUpdate")
		public ModelAndView adoptUpdate(AdoptDTO adoptdto) {
			ModelAndView mav = new ModelAndView();
			adoptDAO.update(adoptdto);
			mav.setViewName("redirect:/adopt/adoptReview");		
			return mav;
		}
	
		
}

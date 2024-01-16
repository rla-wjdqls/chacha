package kr.co.chacha.center;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.adopt.AdoptDTO;

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
	
	@GetMapping("/centerForm")
	public ModelAndView centerForm(Integer pageNumber, Integer pageItem) {
	    int page = 0;
    	int size = 0;
    	
	    if(pageNumber == null && pageItem == null) {
	    	page = 1;
	    	size = 4;
	    }else {
	    	page = pageNumber;
	    	size = pageItem;
	    }
	    
	    //System.out.println(page);
	    //System.out.println(size);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("center/centerForm");
	    mav.addObject("form", centerDao.form(page, size));
	    //mav.addObject("list", centerDao.form(page, size));
	    return mav;
	}
	
	@PostMapping("/centerForm")
	@ResponseBody
	public List<CenterDTO> centerList(Integer pageNumber, Integer pageItem) {
	    int page = pageNumber;
    	int size = pageItem;    
	    
	    //System.out.println(page);
	    //System.out.println(size);
	    
	    return centerDao.form(page, size);
	}
	
	@GetMapping("/indexRandom")
	@ResponseBody
	public List<CenterDTO> randomList(){
		return centerDao.randomList();
	}
	
	@GetMapping("/chart")
	@ResponseBody
	public List<String[]> readCsv(){
		List<String[]> data = new ArrayList<>(); //csv파일의 데이터를 담을 리스트
		
			//csv 파일 읽어오기
		try(BufferedReader br = new BufferedReader(new FileReader("src/main/resources/static/chart.csv"))){
			
			String line;
			
			while((line = br.readLine()) != null) { //line에 저
				String[] row = line.split(","); //읽은 줄 , 기준으로 배열에 담기
				data.add(row); //담기
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(data);
		return data;
	}
	
	@GetMapping("/centerWrite") //동물 추가 페이지
	public String write() {
		return "center/centerWrite";
	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map,
						 @RequestParam(name="img") MultipartFile img,
						 HttpServletRequest req,
						 HttpSession session) {
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
		String uid=(String)session.getAttribute("s_id");
		map.put("uid", uid);
		
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
					     HttpServletRequest req,
						 HttpSession session) {
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
		String uid=(String)session.getAttribute("s_id");
		map.put("uid", uid);
		centerDao.update(map);
		
		return "redirect:/center/centerForm";
		}
	
//}else {
//	String anino = map.get("anino").toString();
//	//System.out.println(anino);
//	anipic=centerDao.anipic(anino);
	
	@PostMapping("delete")
	public String delete(HttpServletRequest req, HttpSession session) {
		String anino=req.getParameter("anino");
		
		String anipic=centerDao.anipic(anino);
		
		if(anipic != null && !anipic.equals("-")) {
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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		return "redirect:/";
		
	}//logout end
	
//	@PostMapping("eduCheck")
//	@ResponseBody
//	public int eduCheck(String anino, HttpSession session) {
//		String uid = (String)session.getAttribute("s_id");
//		String str = anino.substring(0, 1);
//		int cnt = centerDao.check(uid, str);
//		
//		return cnt;
//		
//	}
	
	private int sequenceNumber = 1;//신청번호의 시작 순차 번호
	@PostMapping("/adoptInsert")
	@ResponseBody
	public int adoptInsert(@RequestParam("sub_cont") String subCont, String anino,
						   @RequestParam(name="img") MultipartFile img,
						   HttpServletRequest req,
						   HttpSession session) {
		String uid=(String)session.getAttribute("s_id");
		String aniStr = anino.substring(0, 1);
		
		//System.out.println(uid);
		//System.out.println(aniStr);
		CenterDTO centerDto = new CenterDTO();
		centerDto.setUid(uid);
		centerDto.setAnino(aniStr);
		int cnt = centerDao.eduCheck(centerDto);
		if(cnt != 0) {
			System.out.print("60점 이상");
			centerDto.setUid(uid);
			centerDto.setAnino(anino);
			centerDto.setSub_cont(subCont);
			String subpic="-";
			//System.out.println(img);
			//System.out.println(anipic);
			//System.out.println(img.getOriginalFilename());
			if(img != null || !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
				subpic=img.getOriginalFilename();
				try {
					ServletContext application = req.getSession().getServletContext();
					String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
					img.transferTo(new File(path + File.separator + subpic)); //파일저장
				}catch(Exception e) {
					System.out.println(e);
				}//try end
			}//if end
			
			int check = centerDao.apnoChack(centerDto);
			if(check == 0) {
				centerDto.setSubpic(subpic);
				int count = centerDao.check(centerDto);
				SimpleDateFormat sd = new SimpleDateFormat("yyMMdd");
				String date = sd.format(new Date());
				
				//순차 번호 증가
				String apno = "s" + date + String.format("%02d", count +1);
				
				System.out.println(subpic);
				System.out.println(subCont);
				System.out.println(apno);
				centerDto.setApno(apno);
				cnt = centerDao.adoptInsert(centerDto);
				if(cnt > 0) {
					System.out.println("신청 완료");
				}
			}else {
				cnt=0;
			}
			
		}else {
			cnt=-1; //60점 미만
		}
		
		
		return cnt;
	}

			
}

package kr.co.chacha.center;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
	    //mav.addObject("form", centerDao.form(page, size));
	    //mav.addObject("list", centerDao.form(page, size));
	    return mav;
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
		//System.out.println(data);
		return data;
	}
	
	@GetMapping("/centerWrite") //동물 추가 페이지
	public String write() {
		return "center/centerWrite";
	}
	
//	@PostMapping("/insert")
//	public String insert(@RequestParam Map<String, Object> map,
//						 @RequestParam(name="img") MultipartFile img,
//						 HttpServletRequest req,
//						 HttpSession session) {
//		String anipic="-";
//		//System.out.println(img);
//		//System.out.println(anipic);
//		//System.out.println(img.getOriginalFilename());
//		if(img != null || !img.isEmpty()) { //파일이 존재한다면 (없지 않다면)
//			anipic=img.getOriginalFilename();
//			try {
//				ServletContext application = req.getSession().getServletContext();
//				String path = application.getRealPath("/storage"); //실제 파일은 이곳에 저장
//				img.transferTo(new File(path + File.separator + anipic)); //파일저장
//			}catch(Exception e) {
//				System.out.println(e);
//			}//try end
//		}//if end
//		
//		map.put("anipic", anipic);
//		String uid=(String)session.getAttribute("s_id");
//		map.put("uid", uid);
//		
//		centerDao.insert(map);
//		return "redirect:/center/centerForm";
//	}
	
	@PostMapping("/saveAnimal")
	@ResponseBody
	public String animalInsert(@RequestBody Map<String, List<Map<String, Object>>> requestMap,  HttpServletRequest req) {
			System.out.println(requestMap);
			List<Map<String, Object>> animals = requestMap.get("animals");
			
			for (Map<String, Object> animal : animals) {
				CenterDTO centerDto = new CenterDTO();
				
				String kindCd = (String) animal.get("kindCd");
				String desertionNo = null;
				if (kindCd.startsWith("[개]"))  {
					desertionNo = "d" +(String) animal.get("desertionNo");
				}else if(kindCd.startsWith("[고양이]")){
					desertionNo = "c" +(String) animal.get("desertionNo");
					
				}else if(kindCd.startsWith("[기타]")){
					desertionNo = "a" +(String) animal.get("desertionNo");
					
				}
				
				if(desertionNo != null) {
					int cnt = centerDao.selectAnino(desertionNo);
				    if(cnt == 0) {
						centerDto.setAnino(desertionNo);
						centerDto.setAname((String) animal.get("kindCd"));
						centerDto.setAge((String) animal.get("age"));
						centerDto.setGender((String) animal.get("sexCd"));
						centerDto.setWeight((String) animal.get("weight"));
						centerDto.setGenop((String) animal.get("neuterYn"));
						centerDto.setIntro((String) animal.get("specialMark"));
						centerDto.setNoticeSdt((String) animal.get("noticeSdt"));
						centerDto.setNoticeEdt((String) animal.get("noticeEdt"));
						centerDto.setHappenPlace((String) animal.get("happenPlace"));
						centerDto.setCareNm((String) animal.get("careNm"));
						centerDto.setCareTel((String) animal.get("careTel"));
						centerDto.setColorCd((String) animal.get("colorCd"));
						centerDto.setAdopt((String) animal.get("processState"));
						centerDto.setAge((String) animal.get("age"));
						//System.out.println(aname);
						String anipic = "-";
						if (animal.get("popfile") != null) {
						    String popfileUrl = (String) animal.get("popfile");

						    // 이미지 다운로드 및 저장 로직
						    try (InputStream in = new URL(popfileUrl).openStream()) {
						        ServletContext application = req.getSession().getServletContext();
						        String path = application.getRealPath("/storage"); // 실제 파일은 이곳에 저장

						        // 파일명 추출 (URL에서 마지막 슬래시 뒤의 부분을 파일명으로 사용)
						        String fileName = popfileUrl.substring(popfileUrl.lastIndexOf('/') + 1);

						        // 파일 저장
						        Files.copy(in, Paths.get(path, fileName), StandardCopyOption.REPLACE_EXISTING);

						        anipic = fileName;
						    } catch (Exception e) {
						        System.out.println(e);
						    }
						}//if end
						
						centerDto.setAnipic(anipic);
						System.out.println("아" +centerDto.getAnino());
					    centerDao.insert(centerDto);	
					}
				    
				}
				}

		return "성공";
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public ModelAndView detail(String anino, String kindCd) {
		System.out.println(anino);
		System.out.println(kindCd);
		String anino_ = "";
		
		if (kindCd.startsWith("[개]"))  {
			anino_ = "d" + anino;
		}else if(kindCd.startsWith("[고양이]")){
			anino_ = "c" + anino;
			
		}else if(kindCd.startsWith("[기타]")){
			anino_ = "a" +anino;
		}
		
		System.out.println(anino_);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/detail");
		mav.addObject("detail", centerDao.detail(anino_));
		return mav;
		
	}
	
	@GetMapping("/jdetail")
	public ModelAndView detail(String anino) {
		System.out.println(anino);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("center/detail");
		mav.addObject("detail", centerDao.detail(anino));
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
		System.out.println(anino);
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

package kr.co.chacha.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.oracle.wls.shaded.org.apache.bcel.classfile.Attribute;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.chacha.chat.ChatDTO;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
@RequestMapping("/service")
public class ServiceCont {

	public ServiceCont() {
		System.out.println("----ServiceCont()객체 생성됨");
	}// end

	@Autowired
	ServiceDAO serviceDAO;

	/*
	 * @GetMapping("/serviceList") public ModelAndView serviceList() { ModelAndView
	 * mav = new ModelAndView(); mav.setViewName("service/serviceList"); return mav;
	 * 
	 * }//serviceList() end
	 */
	@RequestMapping("/serviceList")
	public ModelAndView serviceList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword) {
		ModelAndView mav = new ModelAndView();

		int currentPage = (page != null) ? page : 1;
		int totalCount = serviceDAO.serviceListCnt();
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

		ServiceDTO dto = new ServiceDTO();

		List<ServiceDTO> serviceList = serviceDAO.serviceList(currentPage, boardLimit, type, keyword);

		if (!serviceList.isEmpty()) {
			mav.addObject("startNavi", startNavi);
			mav.addObject("endNavi", endNavi);
			mav.addObject("maxPage", maxPage);
			mav.addObject("serviceList", serviceList);
		}

		mav.setViewName("service/serviceList");
		if (!StringUtils.isEmpty(type) && !StringUtils.isEmpty(keyword)) {
			mav.addObject("type", type);
			mav.addObject("keyword", keyword);
		}
		return mav;
	}// serviceList() end

	@GetMapping("/serviceForm")
	public ModelAndView serviceForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceForm");
		return mav;

	}// serviceList() end

	@PostMapping("/serviceForm")
	public ModelAndView serviceIns(ServiceDTO servicedto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sid = session.getAttribute("s_id").toString();
		// System.out.println("세션값 확인 : " + sid); 세션값 가져오는 거 확인되고 로그 찌겪혀으니까 확실한거 확인
		servicedto.setUid(sid);
		serviceDAO.insert(servicedto);
		mav.setViewName("redirect:/service/serviceList");
		return mav;
	}// serviceList() end

	// 게시물 상세 페이지로 이동
	@GetMapping("/servicedetail")
	public ModelAndView serviced(int sno, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(); // 세션 객체를 가져옴
		mav.setViewName("service/servicedetail");

		// 조회수 증가
		// serviceDAO.increaseViewCount(sno); //아이디 상관없이 증가
		// 세션에서 조회한 게시물 ID 목록을 가져옴
		Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
		if (viewedPosts == null) {
			viewedPosts = new HashSet<>();
		}

		// 게시물을 이전에 조회하지 않았다면 조회수 증가
		if (!viewedPosts.contains(sno)) {
			serviceDAO.increaseViewCount(sno);
			viewedPosts.add(sno);
			session.setAttribute("viewedPosts", viewedPosts);
		}

		// 게시물 정보를 불러와서 모델에 추가
		mav.addObject("serviced", serviceDAO.detail(sno));
		return mav;
	}

	// 게시물 수정
	@GetMapping("/serviceUpdate")
	public ModelAndView serviceUpdate(int sno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/serviceUpdate");
		mav.addObject("serviceup", serviceDAO.detail(sno));
		return mav;

	}// 화면전환

	@PostMapping("/serviceUpdate")
	public ModelAndView serviceUpdate1(ServiceDTO servicedto) {
		ModelAndView mav = new ModelAndView();
		serviceDAO.update(servicedto);
		mav.setViewName("redirect:/service/serviceList");
		return mav;
	}// 동작

	// 게시물 삭제
	@PostMapping("/serviceDelete")
	public ModelAndView serviceDelete(int sno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/service/serviceList");
		serviceDAO.delete(sno);
		return mav;

	}// serviceList() end

	// 봉사신청
	@GetMapping("/servicea")
	public ModelAndView servicea(int sno) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("service/servicea");
		mav.addObject("servicea", serviceDAO.detail(sno));
		return mav;

	}// 화면전환

	@PostMapping("/servicea")
	public ModelAndView servicea(ServiceDTO servicedto) {
		ModelAndView mav = new ModelAndView();
		serviceDAO.insertServicea(servicedto);
		// 인서트하고 나서 모집인원과 신청인원 계산해서 기존글에 모집마감 업데이트 여기에 로직 추가
		mav.setViewName("redirect:/service/serviceList");
		return mav;

	}// 화면전환

	// 인원체크 ajax
	@PostMapping("/checkPerson")
	@ResponseBody
	public int checkPerson(int sno) {
		System.out.println(sno);
		// 봉사글 시퀀스 받아서 조회하는 쿼리
		int cnt = serviceDAO.checkPersonCnt(sno);
		return cnt;
	}

	/*
	 * @PostMapping(value="/uploadSummernoteImageFile", produces =
	 * "application/json")
	 * 
	 * @ResponseBody public JsonObject
	 * uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile)
	 * {
	 * 
	 * JsonObject jsonObject = new JsonObject();
	 * 
	 * String fileRoot = "C:\\summernote_image\\"; //저장될 외부 파일 경로 String
	 * originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
	 * extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	 * //파일 확장자
	 * 
	 * String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
	 * 
	 * File targetFile = new File(fileRoot + savedFileName);
	 * 
	 * try { InputStream fileStream = multipartFile.getInputStream();
	 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
	 * jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
	 * jsonObject.addProperty("responseCode", "success");
	 * 
	 * } catch (IOException e) { FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
	 * jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
	 * 
	 * return jsonObject; }
	 */
//	@RestController //
//	public class ImageController {
//
//	    @PostMapping("/uploadImage")
//	    public String uploadImage(@RequestParam("file") MultipartFile file) {
//	        // 이미지를 받아서 처리하는 로직을 구현합니다.
//	        // file 변수에 업로드된 이미지 파일이 전달됩니다.
//	        // 저장하거나 다른 작업을 수행할 수 있습니다.
//	        
//	        // 예를 들어, 이미지 파일 이름을 반환하거나 처리된 이미지의 URL을 반환할 수 있습니다.
//	        return "Image uploaded successfully: " + file.getOriginalFilename();
//	    }	

	/*
	 * //글 목록
	 * 
	 * @RequestMapping("/getserviceList") public String
	 * getserviceList(getserviceList cri, Model model) {
	 * 
	 * List<serviceDTO> serviceList = service.serviceList(cri);
	 * 
	 * int total = boardService.totalCnt(cri); // Model 정보 저장
	 * model.addAttribute("boardList",boardList); model.addAttribute("paging",new
	 * PageMaker(cri,total)); return "boardList"; // View 이름 리턴 } }
	 */

}// end
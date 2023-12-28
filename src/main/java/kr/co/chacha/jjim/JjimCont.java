package kr.co.chacha.jjim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jjim") //자주 쓰는 명령어 
public class JjimCont {
	
	public JjimCont() {
		System.out.println("----JjimCont() 객체 생성");
	}//JjimCont() end
	
	@Autowired
	private JjimDAO jjimDao;
	
	@PostMapping("/insert")
	@ResponseBody
	public int jjimInsert(String anino, HttpSession session) throws Exception {
		String uid=(String)session.getAttribute("s_id");
		//System.out.println(anino);
		JjimDTO jjimDTO = new JjimDTO();
		jjimDTO.setAnino(anino);
		jjimDTO.setUid(uid);
		
		int cnt = jjimDao.jjimInsert(jjimDTO);
		return cnt;
	}
	
	
	@PostMapping("/select")
	@ResponseBody
	public int jjimSelect(String anino, HttpSession session) throws Exception{
		String uid=(String)session.getAttribute("s_id");
		JjimDTO jjimDTO = new JjimDTO();
		jjimDTO.setAnino(anino);
		jjimDTO.setUid(uid);
		
		int cnt = jjimDao.jjimSelect(jjimDTO);
		System.out.println(cnt);
		return cnt;
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public int jjimDelete(String anino, HttpSession session) throws Exception{
		String uid = (String)session.getAttribute("s_id");
		JjimDTO jjimDTO = new JjimDTO();
		jjimDTO.setAnino(anino);
		jjimDTO.setUid(uid);
		
		int cnt = jjimDao.jjimDelete(jjimDTO);
		return cnt;
	}
	

}











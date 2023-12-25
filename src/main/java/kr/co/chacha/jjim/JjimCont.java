package kr.co.chacha.jjim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jjim")
public class JjimCont {
	
	public JjimCont() {
		System.out.println("----JjimCont() 객체 생성");
	}//JjimCont() end
	
	@Autowired
	private JjimDAO jjimDao;
	
	@PostMapping("insert")
	public String jjim(@ModelAttribute JjimDTO jjimDto, HttpSession session) {
		jjimDto.setUid("s_id");
		jjimDao.jjimInsert(jjimDto);
		return "redirect:/center/detail";
	}
}

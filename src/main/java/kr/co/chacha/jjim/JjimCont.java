package kr.co.chacha.jjim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@Controller
public class JjimCont {
	
	public JjimCont() {
		System.out.println("----JjimCont() 객체 생성");
	}//JjimCont() end
	
	@Autowired
	private JjimDAO jjimDao;
	

}
